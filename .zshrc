# Start Fish automatically for interactive sessions, but keep system $SHELL as Zsh/Bash
if [[ $- == *i* && -z "$INSIDE_FISH" ]]; then
    export INSIDE_FISH=1
    exec fish
fi
