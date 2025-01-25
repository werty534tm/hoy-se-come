import os
import socket
from modules.colors import colors
from libqtile import qtile, widget, bar

# valores predeterminados
widget_defaults = dict(
    font="ComicShannsMono Nerd Font",
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

# fuente
fuente = "ComicShannsMono Nerd Font"

# semicírculos graciosos
left = ""
right = ""

# eventos clickables
# spawn calendar widget
def openCalendar():
    qtile.cmd_spawn("gsimplecal")

# Open htop
def openHtop():
    qtile.cmd_spawn("kitty htop")

# Open rofi app menu
def openMenu():
    qtile.cmd_spawn("rofi -show drun")

# Open archlinux logout menu
def powerMenu():
    qtile.cmd_spawn("shutdown 0")

#INITIATE WIDGET DEFAULTS
def init_widgets_defaults():
    return dict(font=fuente, fontsize=12, padding=2, background="#00000000", foreground=colors[8])

widget_defaults = init_widgets_defaults()

# lista de widgets
main_widgets_list = []

# APP MENU WIDGET
app_menu_widget = [
        widget.Spacer(
            length=10,
        ),
        widget.Image(
            filename="~/.config/qtile/resources/titler.jpg",
            mouse_callbacks={"Button1": openMenu},
        ),
        widget.Spacer(
            length=10,
        )
    ]

main_widgets_list.extend(app_menu_widget)

# GRUOP BOX WIDGET (WORKSPACES)
group_box_widget = [
        widget.TextBox(
            font=fuente,
            text=left,
            padding=0,
            fontsize=20,
        ),
        widget.GroupBox(
            font=fuente,
            fontsize=18,
            margin_y=4,
            margin_x=0,
            padding_y=20,
            padding_x=4,
            disable_drag=True,
            use_mouse_wheel=True,
            active=colors[13],
            inactive=colors[10],
            rounded=True,
            block_highlight_text_color=colors[6],
            highlight_method="text",
            this_current_screen_border=colors[4],
            this_screen_border=colors[4],
            other_current_screen_border=colors[14],
            other_screen_border=colors[14],
            foreground=colors[1],
            background=colors[14],
            urgent_border=colors[3],
        ),
        widget.TextBox(
            font=fuente,
            text=right,
            padding=0,
            fontsize=20,
        ),
        widget.Spacer(
            length=20,
        ),
    ]

main_widgets_list.extend(group_box_widget)

# WINDOW NAME WIDGET
window_name_widget = [
        widget.TextBox(
            font=fuente,
            text=left,
            padding=0,
            fontsize=20,
        ),
        widget.WindowName(
            font=fuente,
            fontsize=15,
            foreground=colors[1],
            background=colors[14],
            width=bar.CALCULATED,
            empty_group_string="Desktop",
            max_chars=54,
        ),
        widget.TextBox(
            font=fuente,
            text=right,
            padding=0,
            fontsize=20,
        ),
        widget.Spacer(
        ),
    ]

main_widgets_list.extend(window_name_widget)

# CURRENT LAYOUT ICON
current_layout_icon_widget = [
        widget.TextBox(
            font=fuente,
            text=left,
            foreground=colors[14],
            padding=0,
            fontsize=20,
        ),
        widget.CurrentLayoutIcon(
            foreground=colors[1], background=colors[14], scale=0.75
        ),
        widget.TextBox(
            font=fuente,
            text=right,
            foreground=colors[14],
            padding=0,
            fontsize=20,
        ),
        widget.Spacer(
            length=5,
        ),
    ]

main_widgets_list.extend(current_layout_icon_widget)

# SYSTEM MONITERING WIDGET
system_moniter_widget = [
        widget.TextBox(
            font=fuente,
            text=left,
            padding=0,
            fontsize=20,
        ),
        widget.TextBox(
            font=fuente,
            text=" ",
            foreground=colors[13],
            background=colors[14],
            padding=0,
            fontsize=20,
            mouse_callbacks={"Button1": openHtop},
        ),
        widget.TextBox(
            font=fuente,
            text=" CPU",
            foreground=colors[1],
            background=colors[14],
            padding=0,
            fontsize=16,
            mouse_callbacks={"Button1": openHtop},
        ),
        # # do not activate in Virtualbox - will break qtile
        widget.ThermalSensor(
            foreground=colors[1],
            foreground_alert=colors[11],
            background=colors[14],
            metric=True,
            padding=3,
            tag_sensor="Package id 0",
            threshold=80,
            mouse_callbacks={"Button1": openHtop},
        ),
        widget.TextBox(
            font=fuente,
            text=" GPU ",
            foreground=colors[1],
            background=colors[14],
            padding=0,
            fontsize=16,
            mouse_callbacks={"Button1": openHtop},
        ),
        widget.ThermalSensor(
            foreground=colors[1],
            foreground_alert=colors[11],
            background=colors[14],
            metric=True,
            padding=3,
            tag_sensor="GPU",
            threshold=80,
            mouse_callbacks={"Button1": openHtop},
        ),
        widget.Sep(
            foreground=colors[1],
            background=colors[14],
            linewidth=2,
            padding=2,
            size_percent=50,
        ),
        widget.TextBox(
            font=fuente,
            text="  ",
            foreground=colors[13],
            background=colors[14],
            padding=0,
            mouse_callbacks={"Button1": openHtop},
            fontsize=20,
        ),
        widget.Memory(
            font=fuente,
            measure_mem="G",
            format="{MemUsed: .1f}G/{MemTotal: .1f}G ",
            update_interval=5,
            fontsize=16,
            foreground=colors[1],
            background=colors[14],
            mouse_callbacks={"Button1": openHtop},
        ),
        widget.TextBox(
            font=fuente,
            text=right,
            padding=0,
            fontsize=20,
        ),
        widget.Spacer(
            length=5,
        ),
    ]

main_widgets_list.extend(system_moniter_widget)

# CALENDER AND CLOCK
calendar_clock_widget = [
         widget.TextBox(
            font=fuente,
            text=left,
            padding=0,
            fontsize=20,
        ),
        widget.Clock(
            font=fuente,
            foreground=colors[1],
            background=colors[14],
            fontsize=16,
            mouse_callbacks={"Button1": openCalendar},
            format=" %a-%d | %H:%M ",
        ),
        widget.TextBox(
            font=fuente,
            text=right,
            padding=0,
            fontsize=20,
        ),
        widget.Spacer(
            length=5,
        ),
    ]

main_widgets_list.extend(calendar_clock_widget)

# BRIGHTNESS INDICATOR
brightness_widget = [
        widget.TextBox(
            font=fuente,
            text=left,
            padding=0,
            fontsize=20,
        ),
        widget.TextBox(
            font="Noto Sans Symbols",
            text="",
            foreground=colors[1],
            background=colors[14],
            padding=10,
            fontsize=24,
        ),
        widget.Backlight(
            backlight_name="intel_backlight",
            background=colors[14],
            foreground=colors[1],
        ),
        widget.Sep(
            foreground=colors[1],
            background=colors[14],
            linewidth=0,
            padding=2,
            size_percent=50,
        ),
        widget.Sep(
            foreground=colors[1],
            background=colors[14],
            linewidth=0,
            padding=2,
            size_percent=50,
        ),
    ]

main_widgets_list.extend(brightness_widget)

# SYSTEM TRAY
system_tray = [
        widget.Systray(background=colors[14], icon_size=22, padding=4),
        widget.TextBox(
            font="ComicShannsMono Nerd Font",
            text=right,
            padding=0,
            fontsize=20,
        ),
        widget.Spacer(
            length=10,
        ),
    ]

main_widgets_list.extend(system_tray)

# POWER BUTTON
power_button = [
        widget.TextBox(
            font=fuente,
            text=left,
            foreground=colors[14],
            padding=0,
            fontsize=20,
        ),
        widget.TextBox(
            font=fuente,
            text="",
            foreground=colors[13],
            background=colors[14],
            padding=7,
            fontsize=18,
            mouse_callbacks={"Button1": powerMenu},
        ),
        widget.Sep(
            foreground=colors[14],
            background=colors[14],
            linewidth=0,
            padding=4,
            size_percent=50,
        ),
        widget.TextBox(
            font=fuente,
            text=right,
            foreground=colors[14],
            padding=0,
            fontsize=20,
        ),
        widget.Spacer(
            length=5,
        ),
    ]

main_widgets_list.extend(power_button)

# SETUP WIDGETS & QTILE BAR
def init_widgets_list():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list = main_widgets_list
    return widgets_list


widgets_list = init_widgets_list()
