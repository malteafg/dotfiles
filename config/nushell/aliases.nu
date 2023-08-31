def l [] { ls -a | sort-by type }
alias v = nvim

# Git aliases ##################################################################
alias g = git
alias gs = git status

alias gcl = git clone

alias gc = git commit -v
alias gca = git commit -v --all
alias gcm = git commit -v -m
alias gcam = git commit -v --all -m

alias gp = git push
alias gpu = git push -u

alias gl = git pull
alias glr = git pull --rebase

alias ga = git add
alias gaa = git add --all
alias gau = git add --update

alias gb = git branch
alias gbl = git branch --list
alias gbd = git branch --delete
alias gbr = git branch --remote

alias gwl = git worktree list
alias gwa = git worktree add
alias gwr = git worktree remove
alias gwrf! = git worktree remove --force

alias gco = git checkout
alias gcb = git checkout -b
alias gcH! = git checkout HEAD --

alias gd = git diff
alias gdw = git diff --word-diff

alias gf = git fetch
alias gfo = git fetch origin

alias gm = git merge

alias gr = git reset
alias grh! = git reset --hard

alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue

alias grm = git rm

alias go = git remote
alias goa = git remote add
alias gor = git remote rm
