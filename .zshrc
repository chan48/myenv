# prezto 사용
source ~/.zprezto/init.zsh

#ZSH_THEME=robbyrussell

#export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=1
export GOPATH=$HOME/workspace/gopath
export PATH=$PATH:$HOME:/opt/local/bin:$GOPATH/bin
export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages 
export EDITOR=vim
export VISUAL=vim

# for osx
alias sn='pmset displaysleepnow'
alias vi='vim'
alias ll='ls -ahlG'
alias work='cd ~/workspace'
alias testcode='cd ~/workspace/test_code'

alias usfsupports='cd ~/workspace/usf-supports'
alias deploynote='cd ~/workspace/deploy-note'
alias usfpc='cd ~/workspace/usf-vagrant/developer/usfpc'
alias usfmo='cd ~/workspace/usf-vagrant/developer/usfmo'
alias totsearch='cd ~/workspace/usf-vagrant/developer/shared/to-guest/tot_search'
alias usfconfig='cd ~/workspace/usf-vagrant/developer/shared/to-guest/usf-config'
alias usfansible='cd ~/workspace/usf-ansible'
alias usfvagrant='cd ~/workspace/usf-vagrant'
alias usfclick='cd ~/workspace/usfclick-go'
alias usfysoftman='cd ~/workspace/usf-ysoftman'

alias vgs='vagrant global-status'
alias startusfpc='usfpc;vagrant up;popd;'
alias startusfmo='usfmo;vagrant up;popd;'
alias stopusfpc='usfpc;vagrant halt;popd;'
alias stopusfmo='usfmo;vagrant halt;popd;'
alias restartusfpc='usfpc;vagrant reload;popd;'
alias restartusfmo='usfmo;vagrant reload;popd;'
alias destroyusfpc='usfpc;vagrant destroy -f;popd;'
alias destroyusfmo='usfmo;vagrant destroy -f;popd;'

# for local vagrant server
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

# for ysoftman test server
alias mobuild='totsearch &&
scp -r ./src hanadmin@ysoftman4:~/src/mo_tot_search/ &&
ssh ysoftman4 "make -C ~/src/mo_tot_search -j 8 all"
'

alias moclean='ssh ysoftman4 "make -C ~/src/mo_tot_search clean"'

alias mogenconfig='usfconfig &&
./generator/generate.sh mo test &&
rsync -av ./out/mo_tot_search/test/ hanadmin@ysoftman4:/daum/conf/mo_tot_search/
'

alias moinstall='ssh ysoftman4 "astop && sleep 1 && 
make -C ~/src/mo_tot_search -e SERVICE_NAME=mo_tot_search -e TARGET_DIR=/daum/service/mo_tot_search install &&
astart"
'

alias motest='ssh ysoftman4 "make -C ~/src/mo_tot_search test"'

alias moupdatedata='ssh hanadmin@ysoftman4 "rm -rf /daum/data/tmp && mkdir -p /daum/data/tmp && 
/daum/data/download_data.py -d mo -z test -t /daum/data/tmp && 
rsync -rlpgoDc --delete /daum/data/tmp/ /daum/data/mo_tot_search"
'

alias pcbuild='totsearch &&
scp -r ./src hanadmin@ysoftman3:~/src/pc_tot_search/ &&
ssh ysoftman3 "make -C ~/src/pc_tot_search -j 8 all"
'

alias pcclean='ssh ysoftman3 "make -C ~/src/pc_tot_search clean"'

alias pcgenconfig='usfconfig &&
./generator/generate.sh pc test &&
rsync -av ./out/pc_tot_search/test/ hanadmin@ysoftman3:/daum/conf/pc_tot_search/
'

alias pcinstall='ssh ysoftman3 "astop && sleep 1 && 
make -C ~/src/pc_tot_search -e SERVICE_NAME=pc_tot_search -e TARGET_DIR=/daum/service/pc_tot_search install &&
astart"
'

alias pctest='ssh ysoftman3 "make -C ~/src/pc_tot_search test"'

alias pcupdatedata='ssh hanadmin@ysoftman3 "rm -rf /daum/data/tmp && mkdir -p /daum/data/tmp && 
/daum/data/download_data.py -d pc -z test -t /daum/data/tmp && 
rsync -rlpgoDc --delete /daum/data/tmp/ /daum/data/pc_tot_search"'





[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
