:: Init submodule git Vundle.vim
git submodule init

:: mklink solo esta disponible de Windows7+
:: Make symlink vimfiles
mklink /J %USERPROFILE%\vimfile vimfiles
:: Make symlink _vimrc
mklink /H %USERPROFILE%\_vimrc _vimrc
