#aliases
alias v "nvim"
alias config "git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias ls "ls --color=auto"
alias lsl "ls --color=auto -la"

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
