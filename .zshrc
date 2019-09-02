# Path to your oh-my-zsh installation.
export ZSH=/home/niels/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# If shell becomes slow because of this revert to materialshell
# ZSH_THEME="spaceship"
eval "$(starship init zsh)"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  encode64
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Uncomment to run archey3 when a new terminal is opened
# if [ -f /usr/bin/neofetch ]; then neofetch --color_blocks off; fi
neofetch --disable GPU CPU theme icons resolution --color_blocks off

# Disable ctrl-s and ctrl-q (XON/XOFF flow of control)
stty stop '' -ixoff -ixon

# Enable VIM keybindings
# bindkey -v

# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Theming for bat
export BAT_THEME="TwoDark"

# Add Golang to path
export GOPATH="/home/niels/.go"
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOBIN

# Add Rust to path
export PATH=$PATH:/home/niels/.cargo/bin
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Theming for tldr
export TLDR_COLOR_NAME='blue bold'
export TLDR_COLOR_EXAMPLE='blue'
export TLDR_COLOR_DESCRIPTION='white'
export TLDR_COLOR_COMMAND='green'

# Remove this cancer after VioletWolf
export PATH=$PATH:/home/niels/.gem/ruby/2.6.0/bin

# Aliases
alias cat=bat
alias vim=nvim
alias worktime='sshuttle -r office 178.128.138.243 104.248.167.248 192.168.4.134'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
