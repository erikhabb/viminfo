#!/usr/bin/env osascript -l JavaScript
ObjC.import('AppKit')
function run(argv) {
    // resize Terminal 1-3 depending on how many screens are running
    if (Application("Terminal").running() || Application("iTerm2").running()) {
        isIterm = false

        if (Application("iTerm2").running()) {
            term = Application("iTerm2")
            console.log("iTerm2 running")
            isIterm = true
        } else if (Application("Terminal").running()) {
            term = Application("Terminal")
            console.log("Terminal running")
        }
        screens = $.NSScreen.screens
        screen = screens.objectAtIndex(0)
        console.log("Detected %d screens", screens.count)

        for (var j in term.windows()) {
            win = term.windows[j]
            name = win.name()
            bounds = win.bounds()

            // capture window number from name
            if (isIterm) {
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
                var sizes = []

                console.log("win %d window_number %s x %d y %d width %d height %d",
                        j, window_number, bounds.x, bounds.y, bounds.width, bounds.height)

                if (screens.count == 1) {
                    sizes[1] = {columns: 85, rows: 61, x: 0,   y: 23, width: 620, height: 805}
                    sizes[2] = {columns: 85, rows: 61, x: 620, y: 23, width: 620, height: 805}
                    sizes[3] = {columns: 85, rows: 61, x: 819, y: 23, width: 620, height: 805}
                } else {
                    home = true
                    if (argv.length > 0 && argv[0] === "work") {
                        home = false
                    }

                    if (home) {
                        // home
                        sizes[1] = {columns: 85, rows: 47, x: -279, y: -1057, width: 620, height: 1041}
                        sizes[2] = {columns: 85, rows: 47, x:  339, y: -1057, width: 620, height: 1041}
                        sizes[3] = {columns: 85, rows: 47, x:  959, y: -1057, width: 620, height: 1041}
                    } else {
                        // work
                        sizes[1] = {columns: 85, rows: 47, x: -332, y: -1057, width: 620, height: 1041}
                        sizes[2] = {columns: 85, rows: 47, x:  289, y: -1057, width: 620, height: 1041}
                        sizes[3] = {columns: 85, rows: 47, x:  910, y: -1057, width: 620, height: 1041}
                    }
                }
                bounds.x = sizes[window_number].x
                bounds.y = sizes[window_number].y
                bounds.width = sizes[window_number].width
                bounds.height = sizes[window_number].height
                win.bounds = bounds
            }
        }
    }
}
