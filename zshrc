# Path to your oh-my-zsh installation.
export ZSH=/Users/james/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# ZSH_THEME="robbyrussell"
ZSH_THEME="dracula"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
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

export PATH="/Users/james/.rbenv/shims:/Users/james/.rbenv/bin:/Users/james/work/adt-bundle-mac/sdk/tools:/opt/chefdk/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias pull='git pull origin'
alias push='git push origin'
alias checkout='git checkout .'

alias be='bundle exec'
alias bt='bundle exec thin start'
alias rc='bundle exec rails console'
alias gp='git push origin master'
alias gpu='git pull origin master'
alias v='vim'
alias ll='ls -al'
alias 'r'='rails'
alias 'j'='jekyll'
alias 'js'='jekyll serve --watch'
alias autossh='autossh -M $(($RANDOM%6400 + 1024))'
alias resolve="a=\`git diff --name-only --diff-filter=U\`;y=;IFS=$'\n' read -rd '' -a y <<< \"$a\";for i in ${y[@]}; do echo \"$i\"; done"
alias resolve="git diff --name-only --diff-filter=U -z | xargs -0 bash -c '</dev/tty vim \"\$@\"' x"
alias id_rsa_gen='echo ssh-keygen -t rsa -b 4096 -C "your_email@example.com" | pbcopy'
alias cp_id_rsa='cat ~/.ssh/id_rsa.pub | pbcopy'
alias ctags_index='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'
alias jhdownloadmanager='cd ~/apps/JHDownloadManager'
alias cleardns='sudo killall -HUP mDNSResponder'
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
alias fedex_cs_admin='cd ~/apps/fedex/fedex_cs_admin_dashboard'
alias rd2='cd /Users/james/apps/gems/rubify_dashboard_2/rubify-react-form'
alias rg2='cd /Users/james/apps/gems/rubify_dashboard_2/rubify-react-grid && g .'
alias fedex_cs_xcode='open /Users/james/apps/fedex/fedex-apj-cs-ipad/fedex-cs-apj.xcworkspace'
alias samsung_admin='cd ~/apps/samsung_toolbox/samsung-tool-box'
export EDITOR=/usr/local/bin/vim
alias open_new_tab="array=\$(ruby -e 'require \"/Users/james/apps/samsung_toolbox/samsung-tool-box/lib/ec2_ips_getter\";Ec2IpsGetter.new.bash_array'); for ip in ( \$array ); do echo \${ip}; osascript -e 'tell application \"iTerm\" to activate' -e 'tell application \"System Events\" to tell process \"iTerm\" to keystroke \"t\" using command down' -e 'tell application \"System Events\" to tell process \"iTerm\" to keystroke \"ssh ubuntu@\${ip}\"' -e 'tell application \"System Events\" to tell process \"iTerm\" to key code 52'; done"
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
unalias gm

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
source /Users/james/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

