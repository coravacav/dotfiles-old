## NPM
alias n = npm
alias ni = n i
alias nr = n run

## PNPM
alias p = pnpm
alias pi = p i
alias pch = p changeset
alias pe = p exec
alias px = p dlx
alias pc = p pc
alias dev = p dev
def pf [filter: string, ...rest: string] { pnpm --filter $"*($filter)*" $rest }

alias g = git
alias gm = g merge
alias gp = g pull
alias gc = g checkout
alias ga = g add
alias gcm = g commit -m
alias grh = g reset --hard
def gac [...rest: any] { ga .; git commit $rest }
def gacm [...rest: any] { ga .; gcm $rest }
def gb [] {
    git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(align:45)%(color:yellow)%(refname:short)%(color:reset)%(end) %(color:red)%(objectname:short)%(color:reset) %(contents:subject)'
}

alias c = code
alias cr = code -r

def zc [dir: string] { z $dir; c . }
def zcr [dir: string] { z $dir; cr . }
def gacmp [message: string] { ga .; gcm $message; g push }
def gcmp [message: string] { gcm $message; g push }
