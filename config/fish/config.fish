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

set -U fzf_history_opts --preview-window=right:60% --height=80%

# Fuzzy select a folder and cd into it in Terminal
alias fcd="cd (fd --type d | fzf)"

function fkill
    set pid (ps -ef | fzf --header="Select process to terminate" | awk '{print $2}')
    if test -n "$pid"
        kill -9 $pid
    end
end

function gco
    set branch (git branch --all | fzf | string trim | string replace -r '^remotes/origin/' '')
    if test -n "$branch"
        git checkout $branch
    end
end
# Fuzzy select a file and open it in Neovim
function fif
    set -l file (fzf --preview 'bat --style=numbers --color=always {} 2>/dev/null || cat {}')
    if test -n "$file"
        nvim $file
    end
end

