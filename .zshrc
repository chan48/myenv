# prezto 사용
source ~/.zprezto/init.zsh

#ZSH_THEME=robbyrussell

#export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1
export PATH=$PATH:$HOME:/opt/local/bin;
export GOPATH=$HOME/workspace/gopath;
export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages 
export EDITOR=vim
export VISUAL=vim

alias sn='pmset displaysleepnow'
alias vi='vim'
alias ll='ls -ahlG'
alias work='cd /Users/ysoftman/workspace'
alias testcode='cd /Users/ysoftman/workspace/test_code'

alias usfsupports='cd /Users/ysoftman/workspace/usf-supports'
alias deploynote='cd /Users/ysoftman/workspace/deploy-note'
alias usfpc='cd /Users/ysoftman/workspace/usf-vagrant/developer/usfpc'
alias usfmo='cd /Users/ysoftman/workspace/usf-vagrant/developer/usfmo'
alias totsearch='cd /Users/ysoftman/workspace/usf-vagrant/developer/shared/to-guest/tot_search'
alias usfconfig='cd /Users/ysoftman/workspace/usf-vagrant/developer/shared/to-guest/usf-config'
alias usfansible='cd /Users/ysoftman/workspace/usf-ansible'
alias usfvagrant='cd /Users/ysoftman/workspace/usf-vagrant'
alias usfclick='cd /Users/ysoftman/workspace/usfclick-go'
alias usfysoftman='cd /Users/ysoftman/workspace/usf-ysoftman'

alias vgs='vagrant global-status'
alias startusfpc='usfpc;vagrant up;popd;'
alias startusfmo='usfmo;vagrant up;popd;'
alias stopusfpc='usfpc;vagrant halt;popd;'
alias stopusfmo='usfmo;vagrant halt;popd;'
alias restartusfpc='usfpc;vagrant reload;popd;'
alias restartusfmo='usfmo;vagrant reload;popd;'
alias destroyusfpc='usfpc;vagrant destroy -f;popd;'
alias destroyusfmo='usfmo;vagrant destroy -f;popd;'

#alias mo-build='ssh usfmo makeall'
alias mo-build='ssh usfmo make -C /hanmail/shared/from-host/tot_search -j 8 all'
alias mo-clean='ssh usfmo makeclean'
alias mo-genconfig='ssh usfmo genconfig'
alias mo-install='ssh usfmo "astop && sleep 1 && makeinstall && astart"'
alias mo-test='ssh usfmo maketest'
alias mo-updatedata='ssh usfmo updatedata'
alias pc-build='ssh usfpc makeall'
alias pc-clean='ssh usfpc makeclean'
alias pc-genconfig='ssh usfpc genconfig'
alias pc-install='ssh usfpc "astop && sleep 1 && makeinstall && astart"'
alias pc-test='ssh usfpc maketest'
alias pc-updatedata='ssh usfpc updatedata'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


