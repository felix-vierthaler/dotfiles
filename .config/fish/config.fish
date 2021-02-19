#aliases

alias c "clear"

alias v "nvim"


alias config "git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias ls "ls --color=auto"
alias la "ls --color=auto -la"

alias gs "git status"
alias ga "git add"
alias gaa "git add ."
alias gd "git diff"
alias gc "git commit"
alias gcm "git commit -m"
alias gp "git push origin master"

#oh my fish setup
set -g theme_nerd_fonts yes
set theme_color_scheme gruvbox

#vim key bindings
fish_vi_key_bindings

#no right promp
function fish_right_prompt
end

# No greeting when starting an interactive shell.
function fish_greeting
end

#start neofetch
neofetch
