# IDE Shortcut Keys

Mapping shortcuts of commands found in eclipse to intellij and vscode.

Shortcuts preceded by + means that this is a new shortcut you have to create in that IDE.

Also note that the keys F11 and F12 are mapped to mission control features in the Mac. To use these in the IDE, disable them in your Mac by going to System Prefs > Keyboard > Shortcuts > Mission Control and unchecking F11, F12.

|                          | Eclipse                           | Intellij                             | VSCode                                                     |
| ------------------------ | --------------------------------- | ------------------------------------ | ---------------------------------------------------------- |
| Copy line                | ctrl+alt+down, ctrl+alt+up        | cmd+d, +ctrl+alt+down                | shift+alt+down, shift+alt+up, +ctrl+alt+down, +ctrl+alt+up |
| Delete line              | ctrl+/                            | cmd+back, +ctrl+/                    | shift+cmd+k, +ctrl+/                                       |
| Delete all left          | ---                               | +cmd+back                            | cmd+back                                                   |
| Delete all right         | shift+cmd+del                     | +cmd+delete                          | cmd+delete, ctrl+k                                         |
| Delete word left         | alt+back                          | alt+back                             | alt+back                                                   |
| Delete word right        | alt+del                           | alt+del                              | alt+del                                                    |
| Find                     | cmd+f                             | cmd+f                                | cmd+f                                                      |
| Find in Files            | shift+cmd+f                       | shift+cmd+f                          | shift+cmd+f                                                |
| Find next                | F3, ctrl+alt+f, cmd+k             | cmd+g, +F3                           | F3, cmd+g                                                  |
| Find next select         | ---                               | +cmd+F3                              | cmd+F3                                                     |
| Find prev                | shift+F3, shift+cmd+k             | shift+cmd+g, +shift+F3               | shift+F3, shift+cmd+g                                      |
| Find prev select         | ---                               | ---                                  | shift+cmd+F3                                               |
| Incremental find         | cmd+j                             | cmd+f                                | cmd+f                                                      |
| Find/replace             | cmd+f                             | cmd+r                                | alt+cmd+f, +cmd+r                                          |
| Go back                  | cmd+[                             | cmd+[                                | ctrl+-                                                     |
| Go forward               | cmd+]                             | cmd+]                                | shift+ctrl+-                                               |
| Goto                     | ctrl+g, cmd+l                     | cmd+l, +ctrl+g                       | ctrl+g                                                     |
| Join lines               | shift+ctrl+j                      | shift+ctrl+j, +ctrl+j                | ctrl+j                                                     |
| Move to line end         | cmd+right                         | cmd+right                            | cmd+right                                                  |
| Move to line beg         | cmd+left                          | cmd+left                             | cmd+left                                                   |
| Move line up             | alt+up                            | shift+alt+up, +alt-up                | alt+up                                                     |
| Move line down           | alt+down                          | shift+alt+down, +alt+down            | alt+down                                                   |
| Toggle comment           | ctrl+\, shift+cmd+c, cmd+/        | cmd+/                                | cmd+/                                                      |
| Toggle block comment     | ---                               | alt+cmd+/, shift+ctrl+/, shift+cmd+/ | shift+alt+a                                                |
| debug                    | cmd+F11                           | ctrl+d                               | F5                                                         |
| pause                    | ---                               | ---                                  | F6                                                         |
| resume                   | F5                                | -F9                                  | F6                                                         |
| run                      | alt+cmd+r, shift+cmd+F11          | ctrl+r                               | ---                                                        |
| Step into                | F11                               | F7, +F11                             | F11                                                        |
| Step over                | F10                               | F8, +F10                             | F10                                                        |
| Step out                 | F12                               | shift+F8, +F12                       | shift+F11, +F12                                            |
| Stop                     | alt+cmd+s, cmd+F2                 | cmd+F2                               | shift+F5                                                   |
| Toggle breakpoint        | F9                                | cmd+F8, +F9                          | F9                                                         |
| Uppercase                | ctrl+u                            |                                      | ctrl+u                                                     |
| Toggle case              | ---                               | shift+cmd+u, ctrl+u                  | ---                                                        |
| Trim trailing whitespace | ---                               | ---                                  | cmd+k,cmd+x                                                |
| Code completion          | ctrl+space                        | ctrl+space                           | ctrl+space                                                 |
| Smart completion         | ---                               | ctrl+shift+space                     | ---                                                        |
| Statement completion     | ---                               | shift+cmd+enter                      | ---                                                        |
| Quick access             | ctrl+3                            | shift+shift                          | ---                                                        |
| Search everywhere        | ---                               | shift+shift                          | ---                                                        |
| Maximize view            | ctrl+m                            | shift+cmd+F12, +ctrl+m               | ---                                                        |
| Open type                | shift+cmd+t                       | cmd+o, +shift+cmd+t                  | cmd+t                                                      |
| Open resource            | shift+cmd+r                       | shift+cmd+o, +shift+cmd+r            | ---                                                        |
| Open symbol              | ---                               | alt+cmd+o                            | cmd+t                                                      |
| Quick fix                | ctrl+1, cmd+1                     | ---                                  | ---                                                        |
| Show intention action    | ---                               | alt+enter                            | ---                                                        |
| Format code              | ctrl+shift+f, shift+cmd+f, ctrl+0 | alt+cmd+l, +ctrl+0, +ctrl+shift+f    | shift+alt+f, +ctrl+0                                       |
| Organize imports         | shift+cmd+o                       | +ctrl+alt+o, +ctrl+9                 | shift+alt+o, +ctrl+alt+o                                   |
| Open declaration         | ctrl+d, cmd+d                     | cmd+b, +cmd+d                        | -F12, +cmd+d                                               |
| Open type hierarchy      | shift+cmd+h, F4                   | ctrl+h                               | ---                                                        |
| Quick type hierarchy     | cmd+t                             | +cmd+t                               | ---                                                        |
| Go to superclass         | ---                               | cmd+u                                | ---                                                        |
| Find references/usages   | shift+cmd+g                       | alt+F7, +shift+cmd+g                 | shift+F12                                                  |
| Rename                   | ctrl+alt+r, alt+cmd+r             | shift+F6, +alt+cmd+r, +F2            | F2                                                         |
| Move to matching brace   | ctrl+]                            | +ctrl+]                              | +ctrl+]                                                    |
| Javadoc selected element | ctrl+4                            | +ctrl+4                              | ---                                                        |
| Assign to local var      | ctrl+5                            | alt+enter, +ctrl+5                   | ---                                                        |
| Generate getters/setters | ctrl+6                            | ctrl+enter ..., cmd+n ...            | ---                                                        |
| Build clean              | ctrl+7                            | +ctrl+7 (rebuild)                    | ---                                                        |
| Override/implement       | ctrl+8                            | ctrl+enter …, cmd+n ...              | ---                                                        |
| Close window             | cmd+w                             | cmd+w                                | cmd+w                                                      |
| Close all windows        | shift+cmd+w                       | +shift+cmd+w                         | shift+cmd+w                                                |
| Outline / File Structure | cmd+o                             | cmd+f12, +ctrl+shift+o               | ---                                                        |
| Switch Mode              |                                   | ctrl+`                               |                                                            |
| Clipboard history        |                                   | cmd+shift+v                          | cmd+shift+v (clipboard history plugin)                     |
| Column select            | alt+cmd+a                         | alt+drag                             | shift+alt+click, shift+alt+cmd+arrow                       |
| Multiple cursor          |                                   | alt+shift+click                      | alt+click, alt+cmd+arrow                                   |
