#!/usr/bin/env python3
from config import CURRENT_COURSE_ROOT

from rofi import rofi

from os import path
from glob import glob
import subprocess

def find_ext(dr, ext):
    return glob(path.join(dr, "*.{}".format(ext)))

presentations_path = path.join(CURRENT_COURSE_ROOT, 'presentations')
presentations = sorted(find_ext(presentations_path, 'pdf'))
print(presentations)

commands = ['last', 'prev-last', 'all', 'prev']
options = presentations

lp = len(presentations)
lines = lp if lp < 15 else 15

key, index, selected = rofi('Select presentation', options, [
    '-lines', lines,
], True)

if index >= 0:
    presentation = selected

    subprocess.Popen([
        'zathura',
        selected
])
