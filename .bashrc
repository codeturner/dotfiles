# Load the shell dotfiles, and then some:
# * ~/.bashrc_extra can be used for other settings you don't want to commit.
for file in ~/.{bashrc_prompt,bashrc_aliases,bashrc_functions,bashrc_extra}; do
  [ -r "$file" ] && source "$file"
done
unset file
