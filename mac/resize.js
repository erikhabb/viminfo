#!/usr/bin/env osascript -l JavaScript
ObjC.import('AppKit')
function run(argv) {
    // resize Terminal 1-3 depending on how many screens are running
    isTerminal = false
    isIterm2 = false
    try {
        isIterm2 = Application("iTerm2").running()
        term = Application("iTerm2")
        console.log("iTerm2 running")
    } catch (e) {
        try {
            isTerminal = Application("Terminal").running()
            term = Application("Terminal")
            console.log("Terminal running")
        } catch (e) {
        }
    }

    if (isTerminal || isIterm2) {
        screens = $.NSScreen.screens
        screen = screens.objectAtIndex(0)
        console.log("Detected %d screens", screens.count)

        var sizes = []
        var x = []

        home = true
        if (argv.length > 0 && argv[0] === "work") {
            home = false
        }

        columns = 85

        if (screens.count == 1) {
            rows = 61
        } else {
            rows = 47
        }

        if (isIterm2) {
            if (screens.count == 1) {
                x[0] = 0
                x[1] = 620
                x[2] = 819
            } else {
                if (home) {
                    x[0] = -279
                    x[1] = 343
                    x[2] = 965
                } else {
                    x[0] = -332
                    x[1] = 290
                    x[2] = 912
                }
            }
        } else {
            if (screens.count == 1) {
                x[0] = 0
                x[1] = 620
                x[2] = 819
            } else {
                if (home) {
                    x[0] = -279
                    x[1] = 339
                    x[2] = 959
                } else {
                    x[0] = -332
                    x[1] = 289
                    x[2] = 910
                }
            }
        }

        if (screens.count == 1) {
            y = 23
        } else {
            y = -1057
        }

        if (isIterm2) {
            width = 621
        } else {
            width = 620
        }

        if (screens.count == 1) {
            height = 805
        } else {
            height = 1041
        }

        sizes[1] = {columns: columns, rows: rows, x: x[0], y: y, width: width, height: height}
        sizes[2] = {columns: columns, rows: rows, x: x[1], y: y, width: width, height: height}
        sizes[3] = {columns: columns, rows: rows, x: x[2], y: y, width: width, height: height}

        for (var j in term.windows()) {
            win = term.windows[j]
            name = win.name()
            bounds = win.bounds()

            // capture window number from name
            if (isIterm2) {
                // iTerm2 labels names as 1. something
                window_number = name.substr(0, 1)
            } else {
                // Terminal labels names as something - x1
                window_number = name.substr(-1)
                // high sierra now names each tab individually.
                // assuming 1-3 in window 1, 4-6 in window 2, 7-9 in window 3
                // if (window_number == 1 || window_number == 2 || window_number == 3) {
                if (window_number == 1 || window_number == 2 || window_number == 3 ||
                    window_number == 4 || window_number == 5 || window_number == 6 ||
                    window_number == 7 || window_number == 8 || window_number == 9) {
                    if (window_number == 1 || window_number == 2 || window_number == 3) {
                        window_number = 1
                    }
                    if (window_number == 4 || window_number == 5 || window_number == 6) {
                        window_number = 2
                    }
                    if (window_number == 7 || window_number == 8 || window_number == 9) {
                        window_number = 3
                    }
                }
            }

            // assume first three windows are the ones to arrange
            if (window_number == 1 || window_number == 2 || window_number == 3) {
                window_number = parseInt(window_number, 10)

                console.log("win %d window_number %s x %d y %d width %d height %d",
                        j, window_number, bounds.x, bounds.y, bounds.width, bounds.height)

                bounds.x = sizes[window_number].x
                bounds.y = sizes[window_number].y
                bounds.width = sizes[window_number].width
                bounds.height = sizes[window_number].height
                win.bounds = bounds
            }
        }
    }
}
