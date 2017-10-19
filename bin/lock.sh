#!/bin/sh
# This relies on https://github.com/chrjguill/i3lock-color


B='#00000000'  # blank
C='#ffffff22'  # clear ish
#D='#ff00ffcc'  # default
D='#3d87ffee'  # default
#T='#ee00eeee'  # text
T='#3d87ffee'  # text
W='#880000bb'  # wrong
V='#bb00bbbb'  # verifying

#revert the dpms settings back to off ...AAAAAAND it doesn't work...
#revert() {
  #xset +dpms dpms 0 0 0
#}

#xset +dpms dpms 1 1 1

i3lock -f             \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--textcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--radius 280          \
--timesize=80         \
--datesize=38         \
-p default            \
-c '#000000'
#--screen 0            \
#--blur 5              \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc

#revert
