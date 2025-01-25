import re
from libqtile.config import Group, Match

groups = [
    Group(name, **kwargs)
    for name, kwargs in [
        ("RAND", {}),
        ("WEB", {"matches": [Match(wm_class=re.compile(r"^(firefox)$"))]}),
        ("DEV1", {"matches": [Match(wm_class=re.compile(r"^(Apache NetBeans IDE 16)$")), Match(wm_class=re.compile(r"^(jetbrains\-pycharm\-ce)$"))]}),
        ("DEV2", {}),
        ("READ", {}),
        ("VM", {}),
        ("GAME", {"matches": [Match(wm_class=re.compile(r"^(steam)$"))]}),
        ("MUS", {"matches": [Match(wm_class=re.compile(r"^(spotify)$"))]}),
        ("VID", {"matches": [Match(wm_class=re.compile(r"^(mpv)$"))]}),
        ("DISC", {"matches": [Match(wm_class=re.compile(r"^(discord)$"))]}),
    ]
]