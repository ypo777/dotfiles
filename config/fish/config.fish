eval (/opt/homebrew/bin/brew shellenv)

if status is-interactive
	zoxide init fish | source
end

set -gx PYTHON (which python3)

set -g fish_greeting
set -Ux EDITOR nvim
set -U fish_key_bindings fish_vi_key_bindings

export NVM_DIR="$HOME/.nvm"

# Created by `pipx` on 2024-07-11 04:19:07
set PATH $PATH /Users/yanpaing/.local/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yanpaing/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/yanpaing/Downloads/google-cloud-sdk/path.fish.inc'; end

starship init fish | source
