#!/bin/bash

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
    # centos, ubuntu 모두 있음
	sudo ${package_program} install zsh python-pip ruby
    # ubuntu 에서는 찾을 수 없음
    sudo ${package_program} install ncurses ncurses-devel
	
	# zsh 버전이 낮으면 소스 다운로드 받아 설치하기
    cur_version="$(zsh --version | cut -d" " -f2)"
    compare_version="5.0.0"
    echo 'cur_version='${cur_version}
    echo 'compare_version='${compare_version}
    highest_version="$(printf "${cur_version}\n${compare_version}" | sort -r | head -n1)"
    echo 'highest_version='${highest_version}
    if [ "${highest_version}" == "${compare_version}" ]; then
        echo "${compare_version} > ${cur_version}"
        curl -OL https://sourceforge.net/projects/zsh/files/zsh/5.1/zsh-5.1.tar.gz/download
        mv download zsh-5.1.tar.gz
        tar zxvf zsh-5.1.tar.gz
        cd zsh-5.1
        ./configure && make && sudo make install
        /usr/local/bin/zsh --version
    else
        echo "${compare_version} < ${cur_version}"
    fi
	
else
	echo 'Only OS-X or Linux... exit'
	exit
fi

