export PATH=$PATH:$HOME/.local/bin
export GOROOT=/usr/local/go/
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH
export GOPATH=$GOPATH:$HOME/Projects/my_go
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
