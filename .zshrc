# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# export ANDROID_HOME=/home/sourav/Library/Android/sdk
export ANDROID_HOME=/Users/sourav/Library/Android/sdk
export PATH=$PATH:~/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$HOME/bin:/usr/local/bin
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'
# export JAVA_HOME='/home/sourav/Android/android-studio/jre'
export TERM="xterm-256color"



# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="funky"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# POWERLEVEL9K_MODE='nerdfont-complete'
#
# POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
# POWERLEVEL9K_DIR_HOME_BACKGROUND='004'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='004'
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='004'
# POWERLEVEL9K_VCS_CLEAN_FOREGROUND='white'
# POWERLEVEL9K_USER_DEFAULT_BACKGROUND='234'
# POWERLEVEL9K_USER_DEFAULT_FOREGROUND='white'
# POWERLEVEL9K_USER_ROOT_BACKGROUND='234'
# POWERLEVEL9K_USER_ROOT_FOREGROUND='white'
# POWERLEVEL9K_HOST_REMOTE_BACKGROUND='red'
# POWERLEVEL9K_HOST_REMOTE_FOREGROUND='white'
# POWERLEVEL9K_HOST_LOCAL_BACKGROUND='006'
# POWERLEVEL9K_HOST_LOCAL_FOREGROUND='white'
#


ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

setopt histignorespace
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  node
	zsh-z
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

alias "news"="newsboat"
alias "gmail"="neomutt"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
alias mvim="nvim"
alias sp="spotify play"
alias spp="spotify pause"
alias ss="spotify stop"
alias spa="spotify play artist"
alias sq="spotify quit"
alias str="spotify toggle repeat"
alias svu="spotify vol up"
alias svd="spotify vol down"
alias logdev="frontmdev.sh"
alias logprod1="frontmprod1.sh"
alias logprod2="frontmprod2.sh"
alias up="docker-compose up"
alias down="docker-compose down"
alias publishblog="gaa && gcmsg "Publish" && git push"
alias ide="ide.sh"
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit
compinit
source $ZSH/oh-my-zsh.sh
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export LC_ALL=en_US.UTF-8
