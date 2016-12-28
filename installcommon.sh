#!/bin/sh

# zsh pip brew ruby .. 기본 프로그램 설치
if [ $(uname) == 'Darwin' ]; then
	echo 'OSX Environment'
    # brew 설치
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# zsh 설치
	brew install zsh
	# pip 설치
	sudo easy_install pip
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
	sudo ${package_program} install zsh python-pip ruby
else
	echo 'Only OS-X or Linux... exit'
	exit
fi

