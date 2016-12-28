#!/usr/local/bin/zsh

# zsh 설치
if [ $(uname) == 'Darwin' ]; then
	echo 'OSX Environment'
	brew install zsh
elif [ $(uname) == 'Linux' ]; then
	echo 'Linux Environment'
	# yum 실행보기 
	yum --version
	# yum 실행후 exit code 0(SUCCESS) 이라면 사용할수 있다.
	package_program=""
	if [ $? == 0 ]; then
		package_program="yum -y"
	else
		package_program="apt-get"
	fi
	sudo ${package_program} zsh
else
	echo 'Only OS-X or Linux... exit'
	exit
fi

rm -rfv ~/.zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm -fv ~/.zprezto/runcoms/zpreztorc
cp -fv zpreztorc ~/.zprezto/runcoms/zpreztorc

#echo 'source ~/.zprezto/init.zsh' >> ~/.zshrc
source ~/.zprezto/init.zsh
