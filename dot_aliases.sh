## NPM
alias ni='npm i'
alias nr='npm run'

## PNPM
alias p='pnpm'
alias pi='p i'
alias pch='p changeset'
alias pe='p exec'
alias px='p dlx'
alias pc='p pc'
alias dev='p dev'
function pf {
    FILTER=$1
    shift
    p --filter "*"$FILTER"*" $@
}

alias g='git'
alias gm='g merge'
alias gp='g pull'
alias gps='g push'
alias gd='g diff'
alias gc='g checkout'
alias gs='g status'
alias gch='gc HEAD --'
alias ga='g add'
alias gac='ga . && git commit'
alias gcm='g commit -m'
alias gacm='ga . && gcm'
alias grh='g reset --hard'

function gb {
    git for-each-ref \
        --sort=-committerdate \
        refs/heads/ \
        --format='%(HEAD) %(align:45)%(color:yellow)%(refname:short)%(color:reset)%(end) %(color:red)%(objectname:short)%(color:reset) %(contents:subject)'
}

alias prune_git_branches_merged_to_main='git checkout -q main && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base main $branch) && [[ $(git cherry main $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

alias n='nvim'
alias nv='nvim'
function zn {
    z $1 && n
}

function gacmp {
    ga . && gcm $1 && g push
}

function gcmp {
    gcm $1 && g push
}

alias pchgacmp='pch && gacmp'

alias ls='exa --icons -a'
alias ll='exa --icons -lag --header'
alias mkdir='mkdir -p'

alias srv='simple-http-server'

