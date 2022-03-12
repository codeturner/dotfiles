local utils = {}

-- adjustable parameters
utils.timeBetweenDoubleTapToQuit = 2
utils.clipboardFrequency = 1.6
utils.clipboardShowCopiedAlert = false
utils.pasteOnSelect = true
utils.layoutConfigFile = hs.fs.currentDir() .. "/layout.json"
utils.showAppShortcutsConfigFile = hs.fs.currentDir() .. "/showAppShortcuts.json"

-- internals - private parameter holder
local internals = {}

-- require double tap within 2 seconds (configurable) to quit an application
function utils.onDoubleTapToQuitTimer()
    -- first time thru, create timer instance now so that timeBetweenDoubleTapToQuit takes affect
    if not internals._doubleTapToQuitTimer then internals._doubleTapToQuitTimer = hs.timer.delayed.new(utils.timeBetweenDoubleTapToQuit, function() end) end

    local app = hs.application.frontmostApplication()
    if internals._doubleTapToQuitTimer:running() then
        -- timer running, this is our second tap
        internals._doubleTapToQuitTimer:stop()
        app:kill()
        if internals._doubleTapToQuitAlert then
            local uuid = internals._doubleTapToQuitAlert
            internals._doubleTapToQuitAlert = nil
            hs.alert.closeSpecific(uuid)
        end
    else
        internals._doubleTapToQuitAlert = hs.alert.show("Double tap ⌘Q to quit " .. app:name(), utils.timeBetweenDoubleTapToQuit)
        internals._doubleTapToQuitTimer:start()
    end
end

-- show clipboard manager - require ClipboardTool spoon to be installed
function utils.onToggleClipboard()
    -- first time thru, load spoon
    if not utils.clipboardSpoon then
        utils.clipboardSpoon = hs.loadSpoon("ClipboardTool")
        if not utils.clipboardSpoon then
            hs.alert.show("ClipboardTool spoon failed to load - did you install it?")
            return
        end
        utils.clipboardSpoon.frequency = utils.clipboardFrequency
        utils.clipboardSpoon.show_copied_alert = utils.clipboardShowCopiedAlert
        utils.clipboardSpoon.paste_on_select = utils.pasteOnSelect
        utils.clipboardSpoon:start()
    end

    utils.clipboardSpoon:toggleClipboard()
end

-- helper function to print table as a string
function utils.serializeTable(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0

    local tmp = string.rep(" ", depth)

    if name then tmp = tmp .. name .. " = " end

    if type(val) == "table" then
        tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

        for k, v in pairs(val) do tmp = tmp .. utils.serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "") end

        tmp = tmp .. string.rep(" ", depth) .. "}"
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    else
        tmp = tmp .. '"[inserializeable datatype:' .. type(val) .. ']"'
    end

    return tmp
end

-- helper function to launch or focus app, handling the ability to bring focus a specific window of a multi-windowed app
function utils.showApp(config)
    local app = hs.application.get(config.application)
    if not app then
        local alternateName = config.alternateName
        if config.alternateName then app = hs.application.get(config.alternateName) end
    end
    if app then
        if config.window then
            local window = app:findWindow(config.window)
            if window then window:focus() end
        else
            app:activate()
        end
    else
        print("config=" .. utils.serializeTable(config))
        print(config.application .. "+" .. (config.window or ""))
        hs.application.launchOrFocus(config.application)
    end
end

-- paint an image at the mouse pointer
function utils.popupImage(imagePath, size, displaySeconds)
    -- Hide an existing highlight if it exists
    if internals._drawing then
        internals._drawing:hide()
        if internals._drawingTimer then internals._drawingTimer:stop() end
    end
    -- Get the current co-ordinates of the mouse pointer
    local point = hs.mouse.absolutePosition()
    internals._drawing = hs.drawing.image(hs.geometry.rect(point.x - (size.x / 2), point.y - (size.y / 2), size.x, size.y), imagePath)
    internals._drawing:show()
    -- Set a timer to hide the circle after 3 seconds
    internals._drawingTimer = hs.timer.doAfter(displaySeconds, function() internals._drawing:hide() end)
end

-- paint a big circle outline around the specified position
function utils.showCircle(point)
    -- Hide an existing highlight if it exists
    if internals._drawing then
        internals._drawing:hide()
        if internals._drawingTimer then internals._drawingTimer:stop() end
    end
    -- Prepare a big red circle around the point
    internals._drawing = hs.drawing.circle(hs.geometry.rect(point.x - 250, point.y - 250, 500, 500))
    internals._drawing:setStrokeColor({["red"] = 0.0, ["green"] = 1.0, ["blue"] = 0.0, ["alpha"] = 0.65})
    internals._drawing:setFill(false)
    internals._drawing:setStrokeWidth(100)
    internals._drawing:show()

    -- Set a timer to hide the circle after 3 seconds
    internals._drawingTimer = hs.timer.doAfter(1, function() internals._drawing:hide() end)
end

-- move the mouse to the center of the specified screen number and paint a big circle outline around it
function utils.centerMouse(screen)
    local screens = hs.screen.allScreens()
    if #screens >= screen then
        local rect = screens[screen]:fullFrame()
        local pos = {x = rect.x1 + ((rect.x2 - rect.x1) / 2), y = rect.y1 + ((rect.y2 - rect.y1) / 2)}
        hs.mouse.absolutePosition(pos)
        utils.showCircle(pos)
    end
end

-- show and set the position of the specified window
-- expected formate of windowLayout: { applicationName, windowName, screenObject, rectanglePositioning }
function utils.applyLayout(windowLayout)
    for k, v in pairs(windowLayout) do
        local config = {};
        config.application = v[1]
        config.window = v[2]
        utils.showApp(config)
    end
    hs.layout.apply(windowLayout, function(windowTitle, pattern) return string.find(string.lower(windowTitle), string.lower(pattern)) or false end)
end

-- read desired layout from layout configuration json file and moves the specified apps/windows to their correct screen position
-- json file is formated as follows:
-- {
--   "screen1": [
--     {
--       "application": "Slack",
--       "positioning": [0, 0, 0.7, 1]
--     },
--     {
--       "application": "Microsoft Outlook",
--       "positioning": [0.3, 0, 0.7, 1]
--     }
--   ],
--   "screen2": [
--     {
--       "application": "YouTube Music",
--       "positioning": [0, 0, 0.5, 1]
--     },
--     {
--       "application": "Google Chrome",
--       "window": "workflowy",
--       "positioning": [0.5, 0, 0.5, 1]
--     }
--   ]
-- }
-- specifed screen object is not rendered if that screen doesn't exist
function utils.loadLayout()
    local config = nil
    if hs.fs.displayName(utils.layoutConfigFile) then config = hs.json.read(utils.layoutConfigFile) end
    if not config then
        hs.alert.show("Failed to load configuration file: " .. utils.layoutConfigFile)
        return
    end

    local screens = hs.screen.allScreens()
    local screenIdx = 1
    while screenIdx <= #screens do
        local key = "screen" .. screenIdx
        local definition = config[key]
        if definition then
            local layout = {}
            for key, value in pairs(definition) do
                if value.application and value.positioning then
                    table.insert(layout, {value.application, value.window, screens[screenIdx], value.positioning})
                else
                    hs.alert.show("Invalid configuration: " .. utils.serializeTable(value))
                end
            end
            utils.applyLayout(layout)
        end
        screenIdx = screenIdx + 1
    end
end

-- read shortcut config file and setup hotkeys to show or launch apps/windows with the specified shortcut
function utils.loadShowAppShortcuts()
    local shortcuts = nil
    if hs.fs.displayName(utils.showAppShortcutsConfigFile) then shortcuts = hs.json.read(utils.showAppShortcutsConfigFile) end
    if shortcuts then
        for key, value in pairs(shortcuts) do
            if value.application and value.mods and value.key then
                hs.hotkey.bind(value.mods, value.key, function() utils.showApp(value) end)
            else
                hs.alert.show("Invalid configuration: " .. utils.serializeTable(value))
            end
        end
    end
end

return utils
