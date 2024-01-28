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

function pft {
    FILTER=$1
    shift
    p --filter "*"$FILTER"*" test -- $@
}

#region Git / Github
alias g='git'

function gacmp {
    g a . && g cm $1 && g push
}

function gcmp {
    g cm $1 && g push
}

alias gpr='gh pr'
alias gprl='gh pr list'
alias gprc='gh pr checkout'
alias gprv='gh pr view'
alias gprvw='gh pr view -w'
#endregion

alias cs='chezmoi status'
alias cra='chezmoi re-add'
alias ccd='chezmoi cd'

alias prune_git_branches_merged_to_main='git checkout -q main && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base main $branch) && [[ $(git cherry main $(git commit-tree $(git rev-parse "$branch^{tree}") -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

alias n='nvim'
alias nv='nvim'
function zn {
    z $1 && n
}

function zc {
    z $1 && code . && cd -
}

function zcr {
    z $1 && code -r .
}

alias pchgacmp='pch && gacmp'

alias ls='eza --icons -a'
alias ll='eza --icons -lag --header'
alias mkdir='mkdir -p'

alias srv='simple-http-server'

alias cl='clear'
alias c='code'
alias cr='code -r'

alias cdp='cd $(git rev-parse --show-toplevel)'
alias fcd='cd $(fd -t d | fzf)'

alias bench_ts='pnpm exec tsc --generateTrace traceDir && pnpm dlx @typescript/analyze-trace traceDir'
alias ccl='cargo clippy'
