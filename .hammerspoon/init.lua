local utils = require("utils")

-- Load BingDaily spoon - sets desktop to daily bing image
hs.loadSpoon("BingDaily")

-- load ClipboardTool - requires ClipboardTool spoon
hs.hotkey.bind({"cmd", "alt"}, "V", utils.onToggleClipboard)

-- double tap to quit
hs.hotkey.bind({"cmd"}, "Q", utils.onDoubleTapToQuitTimer)

-- launch or show specific apps according to configuration
utils.loadShowAppShortcuts()

-- launch or show default apps in their correct spots on screen 1
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Z", utils.loadLayout)

-- open new finder at home dir
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "SPACE", function() hs.execute("open ~") end)

-- pop up a fun image - great for screen-sharing surprises
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "D", function() utils.popupImage("~/.hammerspoon/dogs.gif", {x = 574, y = 500}, 6) end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "5", function() utils.popupImage("~/.hammerspoon/5.gif", {x = 300, y = 300}, 2) end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function() utils.popupImage("~/.hammerspoon/joy.gif", {x = 500, y = 280}, 3) end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function() utils.popupImage("~/.hammerspoon/knock.gif", {x = 500, y = 366}, 6) end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function() utils.popupImage("~/.hammerspoon/blink.gif", {x = 500, y = 366}, 12) end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "9", function() utils.popupImage("~/.hammerspoon/9.gif", {x = 427, y = 240}, 6) end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function() utils.popupImage("~/.hammerspoon/unimpressed.gif", {x = 312, y = 205}, 6) end)

-- move mouse to the center of the specified screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", function() utils.centerMouse(1) end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "2", function() utils.centerMouse(2) end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "3", function() utils.centerMouse(3) end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "4", function() utils.centerMouse(4) end)

-- done
hs.notify.show("Hammerspoon", "", "Ready to hammer!")
