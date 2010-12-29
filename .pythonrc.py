# source http://sontek.net/tips-and-tricks-for-the-python-interpreter

import __builtin__
import pprint
import readline
import rlcompleter
import sys

# tab completion
readline.parse_and_bind("tab: complete")

# pretty print by default
def my_displayhook(value):
    if value is not None:
        __builtin__._ = value
        pprint.pprint(value)

sys.displayhook = my_displayhook
