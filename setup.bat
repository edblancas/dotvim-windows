:: IMPORTANT: RUN IN POWERSHELL
:: Download vim-plug
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"))

:: mklink solo esta disponible de Windows7+
:: Make symlink vimfiles
mklink /J %USERPROFILE%\vimfiles vimfiles
:: Make symlink _vimrc
mklink /H %USERPROFILE%\_vimrc _vimrc
:: Make symlink _gvimrc
mklink /H %USERPROFILE%\_gvimrc _gvimrc
