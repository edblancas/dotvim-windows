:: Init submodule git Vundle.vim
git submodule update --init

:: mklink solo esta disponible de Windows7+
:: Make symlink vimfiles
mklink /J %USERPROFILE%\vimfile vimfiles
:: Make symlink _vimrc
mklink /H %USERPROFILE%\_vimrc _vimrc
:: Make symlink _gvimrc
mklink /H %USERPROFILE%\_gvimrc _gvimrc
