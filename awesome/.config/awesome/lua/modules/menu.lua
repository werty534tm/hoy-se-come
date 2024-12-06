local awful = require("awful")
local beautiful = require("beautiful")

-- Create a launcher widget and a main menu
local opciones= {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local putamierdademenu= awful.menu({ items = { { "puta mierda", opciones},
                                    { "open terminal", terminal }
                                  }
                        })

local tepiensoborrar = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = putamierdademenu})

return tepiensoborrar
