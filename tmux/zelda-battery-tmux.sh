#!/usr/bin/env sh
#
# Works best with blinking text: the last heart will blink when you have less
# than 25% of your battery life remaining.
#
# Add the following to your `~/.tmux.conf`:
#
#     set -g status-right "#[fg=red]#(path/to/zelda-battery-tmux.sh)"

battery="$(pmset -g ps | tail -1 | perl -pe 's/.*?(\d+)%.*/\1/')"

if [[ $battery -lt 25 ]]; then
  echo "#[blink]♥#[noblink] ♡ ♡ "
elif [[ $battery -lt 50 ]]; then
  echo "♥ ♡ ♡ "
elif [[ $battery -lt 75 ]]; then
  echo "♥ ♥ ♡ "
else
  echo "♥ ♥ ♥ "
fi
