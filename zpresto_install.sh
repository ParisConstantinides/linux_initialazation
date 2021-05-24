#! /bin/zsh

#Install zpresto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

#Zplug 
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

echo '# Source Prezto.' >~/.zshrc
echo 'if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then' >> ~/.zshrc
echo '	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"' >> ~/.zshrc
echo 'fi' >> ~/.zshrc


echo '# Customize to your needs...' >> ~/.zshrc	
echo 'source ~/.zplug/init.zsh' >> ~/.zshrc

echo '# Plugins' >> ~/.zshrc

# Plugins
echo 'zplug "plugins/git",   from:oh-my-zsh' >> ~/.zshrc
# OSX plugin
#echo 'zplug "plugins/osx",   from:oh-my-zsh' >> ~/.zshrc
echo 'zplug "zsh-users/zsh-autosuggestions"' >> ~/.zshrc
echo 'zplug "clvv/fasd"' >> ~/.zshrc
echo 'zplug "b4b4r07/enhancd"' >> ~/.zshrc
echo 'zplug "junegunn/fzf"' >> ~/.zshrc
echo 'zplug "Peltoche/lsd"' >> ~/.zshrc
echo 'zplug "g-plane/zsh-yarn-autocompletions"' >> ~/.zshrc
echo 'zplug "romkatv/powerlevel10k", as:theme, depth:1' >> ~/.zshrc
echo 'zplug load' >> ~/.zshrc

source ~/.zshrc && zplug install

echo '# Set the prompt theme to load.' >> ~/.zpreztorc
echo '# Setting it to 'random' loads a random theme.' >> ~/.zpreztorc
echo '# Auto set to 'off' on dumb terminals.' >> ~/.zpreztorc
echo "zstyle ':prezto:module:prompt' theme 'powerlevel10k'" >> ~/.zpreztorc

