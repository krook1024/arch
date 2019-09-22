#!/usr/bin/env python3
from config import CURRENT_COURSE_ROOT

from rofi import rofi
from presentations import Presentations

presentations = Presentations()

lp = len(presentations)
lines = lp if lp < 15 else 15
options = [p.basename for p in presentations]

key, index, selected = rofi('Select presentation', options, [
    '-lines', lines,
], True)

if index >= 0:
    presentations[index].open()
