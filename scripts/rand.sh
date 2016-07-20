#!/bin/bash

~/bin/themer activate $(~/bin/themer list | shuf -n 1)
feh  --bg-fill $(find ~/Pictures/ps -type f | shuf -n 1) '/home/takuya/Pictures/bjango-trio-hot-vert.png'

