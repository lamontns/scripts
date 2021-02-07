# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kali/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#################################################
# ###    ZSH THEME CONFIG OPTIONS       #########
# ###############################################
#ZSH_THEME="passion"
#ZSH_THEME="mira"
#ZSH_THEME="apple"
#ZSH_THEME="ys"
#ZSH_THEME="dogenpunk"
#ZSH_THEME="3den"
#ZSH_THEME="adben"
#ZSH_THEME="afowler"
#ZSH_THEME="amuse"
#ZSH_THEME="funky"
#ZSH_THEME="itchy"
#ZSH_THEME="kafeitu"
#ZSH_THEME="lukerandall"
#ZSH_THEME="miloshadzic"
#ZSH_THEME="re5et"
#ZSH_THEME="tjkirch_mod"
#ZSH_THEME="wedisagree"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="3den"
#ZSH_THEME="Soliah"
#ZSH_THEME="adben"
#ZSH_THEME="afowler"
#ZSH_THEME="agnoster"
#ZSH_THEME="amuse"
#ZSH_THEME="aussiegeek"
#ZSH_THEME="bira"
#ZSH_THEME="crcandy"
ZSH_THEME="fino-time"
#ZSH_THEME="fox"
#ZSH_THEME="gnzh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
 DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zconf="vim ~/.zshrc"
 alias s="spotify"
 alias ls="ls -GFhS --color"
 alias load="source ~/.zshrc"
 alias p3="python3"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias c="cat"
alias cp="/usr/local/bin/advcp -gR"
alias mv="/usr/local/bin/advmv -g"

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip3
# pip zsh completion end

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(alias-finder pip vim-interaction iterm2 httpie gnu-utils tmux vim-interaction zsh-interactive-cd web-search xcode osx zsh_reload nmap keychain knife knife_ssh encode64 colorize colored-man-pages brew)
alias pwgen="pwgen -c -n -y -s -B -1 14"
alias jxa="osascript -il JavaScript"
