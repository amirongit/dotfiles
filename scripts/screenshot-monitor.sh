#!/usr/bin/env bash
set -euo pipefail

eval "$(xdotool getmouselocation --shell)"
monitors=$(xrandr | grep -oE '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+')

while read -r geom; do
  w=${geom%%x*}
  rest=${geom#*x}
  h=${rest%%+*}
  rest=${rest#*+}
  x=${rest%%+*}
  y=${rest#*+}

  if [ "$X" -ge "$x" ] && [ "$X" -lt "$((x + w))" ] &&
     [ "$Y" -ge "$y" ] && [ "$Y" -lt "$((y + h))" ]; then
    maim -m 1 -g "${w}x${h}+${x}+${y}" "${1:-screenshot.png}"
    exit 0
  fi
done <<< "$monitors"

echo "No monitor found under mouse" >&2
exit 1
