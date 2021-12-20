#!/usr/bin/env osascript -l JavaScript
ObjC.import('AppKit')
function run(argv) {
    // gather information on current configuration
    ca = Application.currentApplication()
    ca.includeStandardAdditions = true
    ssid = ca.doShellScript("/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'")
    hostname = ca.systemInfo().hostName
    screen_count = $.NSScreen.screens.count

    // assume at home unless command line or network SSID says otherwise
    // command line wins
    home = true
    if (argv.length > 0 && argv[0] === "work") {
        home = false
    }
    else if (ssid !== "habbin" && ssid !== "habbinga") {
        home = false
    }

    // resize Terminal or iTerm2 1-3 depending on how many screens are running
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

    if (isTerminal == false && isIterm2 == false) {
        console.log("did not find Terminal or iTerm2, exiting")
        return
    }

    // set window parameters based on where we are

    var options = []

    // Terminal, work, work laptop, screen_count = 1
    options[0] =  {x0: 0,     x1: 621,   x2: 1169,  y: 25,    w: 620,   h: 1023}

    // Terminal, work, work laptop, screen_count = 2
    // @todo
    options[1] =  {x0: 500,   x1: 500,   x2: 500,   y: 1000,  w: 620,   h: 1023}

    // Terminal, work, Erik laptop, screen_count = 1
    options[2] =  {x0: 0,     x1: 620,   x2: 821,   y: 25,    w: 619,   h: 811 }

    // Terminal, work, Erik laptop, screen_count = 2
    // N/A
    options[3] =  {x0: 500,   x1: 500,   x2: 500,   y: 1000,  w: 620,   h: 1023}

    // Terminal, home, work laptop, screen_count = 1
    options[4] = options[0]

    // Terminal, home, work laptop, screen_count = 2
    options[5] =  {x0: -62,   x1: 559,   x2: 1180,  y: -1055, w: 620,   h: 1023}

    // Terminal, home, Erik laptop, screen_count = 1
    options[6] = options[2]

    // Terminal, home, Erik laptop, screen_count = 2
    options[7] =  {x0: -292,  x1: 328,   x2: 948,   y: -1055, w: 620,   h: 1023}

    // iTerm2,   work, work laptop, screen_count = 1
    options[8] =  {x0: 0,     x1: 621,   x2: 1172,  y: 25,    w: 620,   h: 1023}

    // iTerm2,   work, work laptop, screen_count = 2
    // @todo
    options[9] =  {x0: -62,   x1: 559,   x2: 1180,  y: -1055, w: 620,   h: 1023}

    // iTerm2,   work, Erik laptop, screen_count = 1
    options[10] = {x0: 0,     x1: 605,   x2: 835,   y: 25,    w: 605,   h: 811 }

    // iTerm2,   work, Erik laptop, screen_count = 2
    // N/A
    options[11] = {x0: 500,   x1: 500,   x2: 500,   y: 1000,  w: 620,   h: 1023}

    // iTerm2,   home, work laptop, screen_count = 1
    options[12] = options[8]

    // iTerm2,   home, work laptop, screen_count = 2
    options[13] = {x0: -62,   x1: 559,   x2: 1180,  y: -1055, w: 620,   h: 1023}

    // iTerm2,   home, Erik laptop, screen_count = 1
    options[14] = options[10]

    // iTerm2,   home, Erik laptop, screen_count = 2
    options[15] = {x0: 500,   x1: 500,   x2: 500,  y: 1000,  w: 620,    h: 1023}

    option_index = (
        (isIterm2 ? 8 : 0) +
        (home ? 4 : 0) +
        (hostname.startsWith("Erik") ? 2 : 0) +
        (screen_count == 2 ? 1 : 0))
    var option = options[option_index]

    console.log(
        "home=%s " +
        "hostname=%s " +
        "screen count=%d " +
        "option_index=%d",
        home.toString(),
        hostname,
        screen_count,
        option_index)
    console.log(
        "(x[], y, w, h) = ([%d, %d, %d], %d, %d, %d)",
        option.x0,
        option.x1,
        option.x2,
        option.y,
        option.w,
        option.h)

    var window_sizes = []
    window_sizes[1] = {x: option.x0, y: option.y, w: option.w, h: option.h}
    window_sizes[2] = {x: option.x1, y: option.y, w: option.w, h: option.h}
    window_sizes[3] = {x: option.x2, y: option.y, w: option.w, h: option.h}

    // iTerm2 windows might have increasing IDs
    windows = term.windows()
    windows.sort(function(a, b) { return a.id() - b.id() })

    for (var j in windows) {
        win = windows[j]
        name = win.name()
        bounds = win.bounds()

        // capture window number from name
        if (isIterm2) {
            window_number = Number(j) + 1
            console.log("j %d window_number %d name %s index %d id %s", j, window_number, name, win.index(), win.id())
        } else {
            // Terminal labels names as something - x1
            window_number = name.substr(-1)
            // high sierra now names each tab individually.
            // assuming 1-3 in window 1, 4-6 in window 2, 7-9 in window 3
            // if (window_number == 1 || window_number == 2 || window_number == 3)
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

            console.log(
                "%d:%s " +
                "cur (x, y, w, h) = (%d, %d, %d, %d) " +
                "new (x, y, w, h) = (%d, %d, %d, %d) ",
                j,
                window_number,
                bounds.x,
                bounds.y,
                bounds.width,
                bounds.height,
                window_sizes[window_number].x,
                window_sizes[window_number].y,
                window_sizes[window_number].w,
                window_sizes[window_number].h)

            bounds.x = window_sizes[window_number].x
            bounds.y = window_sizes[window_number].y
            bounds.width = window_sizes[window_number].w
            bounds.height = window_sizes[window_number].h
            win.bounds = bounds
        }
    }
}
