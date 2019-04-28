# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="robbyrussell"
# ZSH_THEME="cloud"
# ZSH_THEME="dracula"
# ZSH_THEME="the-one"
# ZSH_THEME=""
# autoload -U promptinit; promptinit

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246'
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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="~/.rbenv/shims:~/.rbenv/bin:~/work/adt-bundle-mac/sdk/tools:/opt/chefdk/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias dc="docker-compose"
alias dc-web="docker-compose run web"
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias pull='git pull origin'
alias push='git push origin'
alias gis='git status'
alias g='git'
alias checkout='git checkout .'
alias gitreset='git checkout . && git clean -df'

# project alias
alias vitamin-lms='cd ~/apps/vitamin-lms/vitamin-lms-admin/ && ./dev-tmux'
alias rubify-form='cd ~/apps/lab/rubify-react-form && ./dev-tmux'
alias rubify-grid='cd ~/apps/lab/rubify-react-grid && ./dev-tmux'
alias amazing-borneo='cd ~/apps/ab/ab-frontend && ./dev-tmux'
alias work-ready='cd ~/apps/work-ready/work-ready-frontend && ./dev-tmux'

alias npmri='curl -0 -L https://npmjs.com/install.sh | sh'
alias ns='npm start'
alias be='bundle exec'
alias bec='bundle exec cucumber'
alias bt='bundle exec thin start'
alias rc='bundle exec rails console'
alias gp='git push origin master'
alias gits='git status'
alias gpu='git pull origin master'
alias co='git checkout'
alias v='vim'
alias ll='ls -al'
alias 'r'='rails'
alias 'j'='jekyll'
alias 'js'='jekyll serve --watch'
alias autossh='autossh -M $(($RANDOM%6400 + 1024))'
alias resolve="a=\`git diff --name-only --diff-filter=U\`;y=;IFS=$'\n' read -rd '' -a y <<< \"$a\";for i in ${y[@]}; do echo \"$i\"; done"
alias resolve="git diff --name-only --diff-filter=U -z | xargs -0 bash -c '</dev/tty nvim \"\$@\"' x"
alias id_rsa_gen='echo ssh-keygen -t rsa -b 4096 -C "your_email@example.com" | pbcopy'
alias cp_id_rsa='cat ~/.ssh/id_rsa.pub | pbcopy'
alias ctags_index='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'
alias jhdownloadmanager='cd ~/apps/JHDownloadManager'
alias cleardns='sudo killall -HUP mDNSResponder'
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
alias fedex_cs_admin='cd ~/apps/fedex/fedex_cs_admin_dashboard'
alias rd2='cd ~/apps/gems/rubify_dashboard_2/rubify-react-form'
alias rg2='cd ~/apps/gems/rubify_dashboard_2/rubify-react-grid && g .'
alias fedex_cs_xcode='open ~/apps/fedex/fedex-apj-cs-ipad/fedex-cs-apj.xcworkspace'
alias chrome="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"

alias dc-web='docker-compose run web'
alias dc-migrate='docker-compose run web rails db:migrate'
alias dc-rspec='docker-compose run web rspec'
alias dc='docker-compose'
alias whoisonport='lsof -i tcp:3000'

alias samsung_admin='cd ~/apps/samsung_toolbox/samsung-tool-box'
alias arbitry_load="plutil -insert NSAppTransportSecurity -json '{\"NSAllowsArbitraryLoads\":true}' rubify/Info.plist"

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
export TERM=xterm-256color
eval "$(direnv hook zsh)"

# Vim Mode for command lin
# bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export TM_RUBY=$HOME/.rbenv/shims/ruby
# eval $(/usr/libexec/path_helper -s)

eval $(thefuck --alias)

export BUNDLE_ID=com.quadmark.fxtestapp
export DEVICE_TARGET=48e0f20ddb735a99b50f9d50e495c7fe20730b38
export DEVICE_ENDPOINT=http://192.168.1.180:37265

function vim {
  # /Applications/MacVim.app/Contents/bin/mvim -v $argv
  nvim $argv
}

if [[ ! -n "$TMUX" ]] &&
        [[ "$SSH_CONNECTION" == "" ]]; then
    # Attempt to discover a detached session and attach
    # it, else create a new session

    if tmux has-session -t base >/dev/null; then
        tmux attach-session -t base
    else
        tmux new-session -s base
    fi
else

    # One might want to do other things in this case,
    # here I print my motd, but only on servers where
    # one exists

    # If inside tmux session then print MOTD
    MOTD=/etc/motd.tcl
    if [ -f $MOTD ]; then
        $MOTD
    fi
fi

export PATH="$HOME/.rbenv/bin:$HOME/Library/Android/sdk/platform-tools:$PATH"
eval "$(rbenv init -)"

# Setting ag as the default source for fzf

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules*" --glob "!*xcodeproj/*" --glob "!*xcassets/*" --glob "!*.png" --glob "!*.jpg" --glob "!.*"'

# prompt pure
export ANDROID_HOME=/Users/james/Library/Android/sdk
DISABLE_AUTO_TITLE=true

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
# set -o vi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/james/.sdkman"
[[ -s "/Users/james/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/james/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
source /usr/local/opt/autoenv/activate.sh
