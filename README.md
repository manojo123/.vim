# Manojo's VIM Configuration 

### Requirements
- Composer
- Vundle (Or Any Plugin installer)


### Installation

```
cd ~
sudo apt install vim
sudo rm -R ~/.vim && sudo rm ~/.vimrc
git clone https://github.com/manojo123/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.vim/.vimrc ~/.vimrc
sudo apt install exuberant-ctags
sudo apt install silversearcher-ag
sudo apt install fonts-firacode
composer global require friendsofphp/php-cs-fixer
```

Make sure you have the global composer binaries directory in your path. Otherwise:
```
export PATH="$PATH:$HOME/.composer/vendor/bin"
```

After Installation, open vim and type
```
:PluginInstall
```

### Resources

- Manojai powerful theme with modified php.vim modules
- Vim NERDTree
- Vim CtrlP Extended with hotkeys and ignore syntaxes
- Vim Vinegar
- Sublime Text hotkeys
- CTags
- SilverSearcher Ag
- Greplace
- Easy splitscreen maps
- PHP Advanced Snippets
- Surround Techniques 
- Namespace Importation
- Special Hotkeys
- AutoCompletion Tools
- Sort By Text Length
- PHP CS Fixer
- BlockCodes AutoCompletions
- Ultisnips
- Fixed all conflicts between plugins
