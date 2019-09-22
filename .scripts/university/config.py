from datetime import datetime
from pathlib import Path

def get_week(d=datetime.today()):
    return (int(d.strftime("%W")) + 52 - 5) % 52

CURRENT_COURSE_SYMLINK = Path('~/current_course').expanduser()
CURRENT_COURSE_ROOT = CURRENT_COURSE_SYMLINK.resolve()
CURRENT_COURSE_WATCH_FILE = Path('~/.config/current_course').expanduser().resolve()
ROOT = Path('~/repos/Uni/bachelor-2/semester-1').expanduser()
DATE_FORMAT = '%Y-%m-%d %H:%M'
PDF_READER = 'zathura'
TERMINAL_EMULATOR = 'kitty'
