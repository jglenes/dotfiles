import os
import atexit

# Enable Readline
import readline
import rlcompleter

### Indenting
class TabCompleter(rlcompleter.Completer):
    """Completer that supports indenting"""
    def complete(self, text, state):
        if not text:
            return ('\t', None)[state]
        else:
            return rlcompleter.Completer.complete(self, text, state)

readline.set_completer(TabCompleter().complete)

### Add autocompletion
if 'libedit' in readline.__doc__:
    readline.parse_and_bind("bind -e")
    readline.parse_and_bind("bind '\t' rl_complete")
else:
    readline.parse_and_bind("tab: complete")

# Enable history
HISTORY_PATH = os.path.expanduser("~/.pyhistory") # where to store history
HISTORY_LENGTH = 2000 # how many of lines of history to store

# save/restore history
def save_history(path=HISTORY_PATH, length=HISTORY_LENGTH):
    import readline
    readline.set_history_length(length)
    readline.write_history_file(path)

if os.path.exists(HISTORY_PATH):
    readline.read_history_file(HISTORY_PATH)

atexit.register(save_history)


# do not litter!
del os, atexit, save_history, HISTORY_PATH, \
