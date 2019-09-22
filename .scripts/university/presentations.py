#!/usr/bin/env python3

from config import CURRENT_COURSE_ROOT, PDF_READER

from os import path
from glob import glob
import subprocess

class Presentation:
    def __init__(self, filename):
        self.filename = filename
        self.basename = path.basename(filename)

    def __str__(self):
        return self.basename

    def open(self):
        subprocess.Popen([
            PDF_READER,
            self.filename
        ])

class Presentations(list):
    def __init__(self):
        list.__init__(self, self.get_all())

    def get_all(self):
        presentations_path = path.join(CURRENT_COURSE_ROOT,
                'presentations')

        _presentations = [
            Presentation(path) for path in
                glob(path.join(presentations_path, '*.pdf'))
        ]

        return sorted(_presentations, key=lambda c: c.basename)


if __name__ == 'main':
    presentations = Presentations().get_all()

    for presentation in Presentations().get_all():
        print(presentation)
