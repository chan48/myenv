#!/bin/sh
# ysoftman
# restore my settings

# add git alias
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status

# install common programs
sh installcommon.zsh
#chsh -s /usr/local/bin/zsh
zsh ./installprezto.sh

# restore brew, pip programs
sh ./installbybrew.sh
sh ./installbypip.sh

# restore shell settings
cp -fv ./.bash ~/.bashrc
cp -fv ./.zshrc ~/.zshrc

# backup vimrc
cp -fv ./.vimrc ~/.vimrc

# restore .ssh settings
# 보안사항으로 실제 필요할때만 사용하자
# cp -fv ./.ssh/* ~/.ssh

# restore hosts settings
# 보안사항으로 실제 필요할때만 사용하자
#sudo cp -fv hosts /etc/hosts

# install vimplugin
sh ./installvimplugin.sh

if [[ $(uname) == 'Darwin' ]]; then

    if [ -e '/Applications/iTerm.app' ]; then
        echo "file exists /Applications/iTerm.app"
    else
        # download and install iterm2
        wget https://iterm2.com/downloads/stable/iTerm2-3_0_12.zip
        tar zxvf iTerm2-3_0_12.zip
        sudo cp -Rv "iTerm.app" /Applications
        rm -rfv "iTerm.app" "iTerm2-3_0_12.zip"
    fi

    if [ -e '/Applications/SourceTree.app' ]; then
        echo "file exists /Applications/SourceTree.app"
    else
        # download and install sourcetree
        wget https://downloads.atlassian.com/software/sourcetree/SourceTree_2.4c.zip
        tar zxvf SourceTree_2.4c.zip
        sudo cp -Rv "SourceTree.app" /Applications
        rm -rfv "SourceTree.app" "SourceTree_2.4c.zip"
    fi

    if [ -e '/Applications/Visual Studio Code.app' ]; then
        echo "file exists /Applications/Visual Studio Code.app"
    else
        # download and install vscode
        wget https://az764295.vo.msecnd.net/stable/7ba55c5860b152d999dda59393ca3ebeb1b5c85f/VSCode-darwin-stable.zip
        tar zxvf VSCode-darwin-stable.zip
        sudo cp -Rv "Visual Studio Code.app" /Applications
        rm -rfv "Visual Studio Code.app" "VSCode-darwin-stable.zip"
        # restore vscode settings
        cp -fv ./.vscode/*.json ~/Library/Application\ Support/Code/User/ 
        # restore vscode extension
        sh ./install_vscode_extension.sh
    fi


    if [ -e '/Applications/Slack.app' ]; then
        echo "file exists /Applications/Slack.app"
    else
        # download and install slack
        wget https://downloads.slack-edge.com/mac_releases/Slack-2.3.3-macOS.zip
        tar zxvf Slack-2.3.3-macOS.zip
        sudo cp -Rv ".app" /Applications
        rm -rfv "Slack.app" "Slack-2.3.3-macOS.zip"
    fi

    if [ -e '/Applications/Google Chrome.app' ]; then
        echo "file exists /Applications/Google Chrome.app"
    else
        # download and install chrome
        wget https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
        hdiutil mount googlechrome.dmg
        sudo cp -Rv "/Volumes/Google Chrome/Google Chrome.app" /Applications
        hdiutil unmount "/Volumes/Google Chrome"
        rm -rfv "googlechrome.dmg"
    fi
fi
