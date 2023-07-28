# !/bin/zsh

# Check if we have a working internet connection
if ! ping -q -c 1 -W 1 github.com >/dev/null; then
    exit
fi

chezmoi update >/dev/null 2>&1

# if chezmoi exited with 0, exit this script
if [ $? -eq 0 ]; then
    exit
fi

# check if chezmoi status has any output, if it does, exit
if [ -n "$(chezmoi status)" ]; then
    echo -en "\rchezmoi has changes, exiting\n❯ "
    exit
fi

# list containing problem directories
PROBLEM_DIRS=(
    ~/.config/nvim
)

# delete all files in problem directories
for dir in $PROBLEM_DIRS; do
    echo -en "Deleting $dir\n❯ "

    # backup directory to tmp
    mv $dir /tmp
done

chezmoi update >/dev/null 2>&1
