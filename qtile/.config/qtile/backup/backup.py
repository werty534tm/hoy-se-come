# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
# import re
import socket
import subprocess
import time
# from typing import List
from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Rofi parabuscar chaqueteadas
    Key([mod], "d", lazy.spawn("rofi -show drun")),
    Key([mod, "shift"], "d", lazy.spawn("rofi -show")),
    # Audio
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5")),
    Key([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute")),
    # Brillo
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "up", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "shift"], "t", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn("kitty"), desc="Launch terminal"),
    # Toggle between different layouts as defined below
        Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Cositas añadidas por mí desde cero
    # Cambiar de wallpaper de forma aleatoria o con una gui
    Key([mod], "n", lazy.spawn("wallpaper-cambio")),
    Key([mod, "shift"], "n", lazy.spawn("backgroundselectGUI")),
    # Tomar capturas de pantalla con flameshot
    Key([mod], "c", lazy.spawn("flameshot screen")),
    Key([mod, "shift"], "c", lazy.spawn("flameshot gui")),
    # Puro meme
    Key([mod], "m", lazy.spawn("basado.sh"))
]

# Eventos de qtile hook
# Sonidos personalizados
efectos = {
    "error":"sans_sound_effect.wav",
    "abrir_ventana":"egg_pop.wav",
    "cerrar_ventana":"Grass_Breaking.wav",
    "focus_change":"Small_Slime_Jump.wav",
    "float_change":"Small_Slime_Jump.wav",
    "group_window_add":"mario_pipe.wav",
}
SONIDOS = "/home/negrojose/.config/qtile/sound_effects/"
CMD = "playsound.sh"

def proceso(effect):
    path = SONIDOS + effect
    subprocess.Popen(["sh", CMD, path])

def guardarLog(mensaje):
    mensaje = time.strftime('%H:%M:%S', time.localtime()) + " " + mensaje
    subprocess.Popen(["sh", "-c", f"echo {mensaje} >> ~/.config/qtile/log"])

def borrarLog():
    subprocess.Popen(["sh", "-c","rm", "-rf", "~/.config/qtile/log"])

def compararGrupo(grupo):
    guardarLog("Intentando obtener el manager.")
    try:
        manager = qtile
        if manager is not None:
            guardarLog("Manager obtenido.")
            return manager.current_group.name != grupo
        else: guardarLog("Error: manager no obtenido.")
    except Exception as e: guardarLog(f"Error 2: {e}")

"""
@hook.subscribe.focus_change
def focus_change():
    cmd = "playsound.sh"
    path = "/home/negrojose/.config/qtile/sound_effects/mario_pipe.wav"
    subprocess.Popen(["sh", cmd, path])
"""

@hook.subscribe.client_new
def new_client(client):
    proceso(efectos["abrir_ventana"])
    guardarLog("ventana abierta")

@hook.subscribe.client_killed
def client_killed(client):
    proceso(efectos["cerrar_ventana"])
    guardarLog("ventana cerrada")

@hook.subscribe.float_change
def float_change():
    proceso(efectos["float_change"])
    guardarLog("float change")

"""
@hook.subscribe.group_window_add
def group_window_add(group, window):
    guardarLog("Ventana añadida a un grupo.")
    if compararGrupo(group.name):
        proceso(efectos["group_window_add"])
"""

@hook.subscribe.shutdown
def shutdown():
    borrarLog()
    proceso(efectos["error"])

"""
@hook.subscribe.current_screen_change
def current_screen_change(client):
    path = sonidos + "egg_pop.wav"
    proceso(path)


@hook.subscribe.client_managed
def client_managed(client):
    path = sonidos + "mario_pipe.wav"
    proceso(path)
"""

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

"""
groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
"""
groups = [
    Group(name, **kwargs)
    for name, kwargs in [
        ("RAND", {}),
        ("WEB", {"matches": [Match(wm_class=["firefox"])]}),
        ("DEV1", {"matches": [Match(wm_class=["Apache NetBeans IDE 16"]), Match(wm_class=["jetbrains-pycharm-ce"])]}),
        ("DEV2", {}),
        ("READ", {}),
        ("VM", {}),
        ("GAME", {"matches": [Match(wm_class=["steam"])]}),
        ("MUS", {"matches": [Match(wm_class=["spotify"])]}),
        ("VID", {"matches": [Match(wm_class=["mpv"])]}),
        ("DISC", {"matches": [Match(wm_class=["discord"])]}),
    ]
]

for i, group in enumerate(groups, 1):
    keys.extend(
        [
            #
            # Switch between workspaces
            #
            Key(
                [mod],
                str(i if i != 10 else 0),
                lazy.group[group.name].toscreen(toggle=False),
                desc=f"Switch to group {group.name}",
            ),
            #
            # Move focused window to workspace
            #
            Key(
                [mod, "shift"],
                str(i if i != 10 else 0),
                lazy.window.togroup(group.name),
                desc=f"Move focused window to group {group.name}",
            ),
        ]
    )

layout_theme = {
    "border_width": 1,
    "margin": 5,
    "border_focus": "#F5C2E7",
    "border_normal": "CCCCCC",
    "single_border_width": 0,
    "single_margin": 10,
}

layouts = [
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.Columns(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.Max(**layout_theme),
    # layout.MonadTall(**layout_theme),
    # layout.MonadWide(**layout_theme),
    # layout.RatioTile(**layout_theme),
    layout.Tile(**layout_theme),
    # layout.TreeTab(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    layout.Zoomy(**layout_theme),
]

widget_defaults = dict(
    font="ComicShannsMono Nerd Font",
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

# Define font
fuente="ComicShannsMono Nerd Font"

# DEFINE COLORS
def init_colors():
    return [
        ["#2e3440", "#2e3440"],  # 0 background
        ["#d8dee9", "#d8dee9"],  # 1 foreground
        ["#3b4252", "#3b4252"],  # 2 background lighter
        ["#bf616a", "#bf616a"],  # 3 red
        ["#a3be8c", "#a3be8c"],  # 4 green
        ["#ebcb8b", "#ebcb8b"],  # 5 yellow
        ["#81a1c1", "#81a1c1"],  # 6 blue
        ["#b48ead", "#b48ead"],  # 7 magenta
        ["#88c0d0", "#88c0d0"],  # 8 cyan
        ["#e5e9f0", "#e5e9f0"],  # 9 white
        ["#4c566a", "#4c566a"],  # 10 grey
        ["#d08770", "#d08770"],  # 11 orange
        ["#8fbcbb", "#8fbcbb"],  # 12 super cyan
        ["#5e81ac", "#5e81ac"],  # 13 super blue
        ["#242831", "#242831"],  # 14 super dark background
    ]


colors = init_colors()

# MOUSE CALLBACKS FOR CLICK EVENTS
# spawn calendar widget
def openCalendar():
    qtile.cmd_spawn("gsimplecal")


# Open htop
def openHtop():
    qtile.cmd_spawn("kitty htop")


# Open rofi app menu
def openMenu():
    qtile.cmd_spawn(
        "rofi -show drun"
    )


# Open archlinux logout menu
def powerMenu():
    qtile.cmd_spawn("shutdown 0")

#INITIATE WIDGET DEFAULTS
def init_widgets_defaults():
    return dict(font=fuente, fontsize=12, padding=2, background="#00000000", foreground=colors[8])


widget_defaults = init_widgets_defaults()

# DEFINE QTILE BAR GLYPHS
left = ""
right = ""

# INITIATE EMPTY WIDGET LIST
main_widgets_list = []

# APP MENU WIDGET
app_menu_widget = [
        widget.Spacer(
            length=10,
        ),
        widget.Image(
            filename="~/wallpapers/Celeste Wallpapers/titler.jpg",
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

"""
# BATTERY INDICATOR
battery_widget = [
        widget.Battery(
            font="ComicShannsMono Nerd Font",
            format="{char} {percent:2.0%}",
            charge_char="",
            discharge_char="",
            full_char="",
            update_interval=10,
            fontsize=14,
            foreground=colors[1],
            background=colors[14],
        ),
    ]

main_widgets_list.extend(battery_widget)
"""

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


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1


widgets_screen1 = init_widgets_screen1()


def init_screens():
    return [
        Screen(
            top=bar.Bar(
                widgets=init_widgets_screen1(),
                size=25,
                background="#00000000",
                border_color=["#00000000","#00000000","#00000000","#00000000"],
                border_width=[4, 4, 4, 4],
                opacity=1,
                margin=[2, 0, -2, 0],
            ),
            bottom=bar.Gap(5),
            left=bar.Gap(5),
            right=bar.Gap(5)
        ),
   ]


screens = init_screens()

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
