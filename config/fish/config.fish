eval (/opt/homebrew/bin/brew shellenv)

set -g fish_greeting
set -Ux EDITOR nvim
set -U fish_key_bindings fish_vi_key_bindings

zoxide init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Added by Antigravity
fish_add_path /Users/yanpaingoo/.antigravity/antigravity/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/yanpaingoo/.lmstudio/bin
# End of LM Studio CLI section

export PATH="$HOME/.local/bin:$PATH"

# GitHub PAT for Claude Code MCP (load from gitignored local file)
test -f ~/.config/fish/local.fish && source ~/.config/fish/local.fish
set -gx KUBECONFIG ~/.kube/rke2-lab.yaml
