# imports
from libqtile import layout

# tema
layout_theme = {
    "border_width": 1,
    "margin": 5,
    "border_focus": "#F5C2E7",
    "border_normal": "CCCCCC",
    "single_border_width": 0,
    "single_margin": 10,
}

# layouts disponibles
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