#!/usr/bin/env python3
from rofi import rofi
import subprocess

_options = {
        "(ALT+C)   Courses":            "rofi-courses.py",
        "(ALT+L)   View lectures":      "rofi-lectures-view.py",
        "(ALT+V)   Edit lecture":       "rofi-lectures.py",
        "(ALT+T)   View presentations": "rofi-presentations-view.py",
}

options = _options.keys()

code, index, selected = rofi('Select course', options, [
    '-auto-select',
    '-no-custom',
    '-lines', len(options)
])

print(index, selected, _options.get(selected))

if index >= 0:
    subprocess.Popen([
        _options.get(selected)
    ])
