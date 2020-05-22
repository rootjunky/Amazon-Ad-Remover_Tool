echo off
mode con:cols=80 lines=20
title Amazon Ad Remover
color 0e
echo   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo   "    ___  ____  ____  _____    ____  ___  ____ ____  __  ________  _  _    "
echo   "   / _ \/ _  \/ _  \/_  _/_  / / / / / \/ / //_/\ \/ / / __/ _  \/ \/ \   "
echo   "  / , _/ |_| / |_| / / / / // / /_/ /    /  <    \  /_/ /_/ |_| / ,  , \  "
echo   " /_/|_|\____/\____/ /_/  \___/\____/_/\_/_/\_/   /_/_/___/\____/_/ \/ \_\ "
echo   "                                                                          "
echo   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo.                   RootJunkys Amazon Ad Removal Tool            
echo.--------------------------------------------------------------------------------
echo.
adb\adb.exe kill-server > nul
adb\adb.exe start-server > nul
echo.--------------------------------------------------------------------------------
adb\adb.exe devices
timeout 5 > nul
adb\adb.exe kill-server > nul
cls	
color 0b
echo.--------------------------------------------------------------------------------
echo  First you must turn on ADB DEBUGGING in your Amazon device in settings 
echo  go to about phone then click on build number 7 times to enable 
echo  developer options then in developer options turn on Enable adb option.
echo  also make sure your drivers are installed 
echo.--------------------------------------------------------------------------------
pause
cls
color 0b
echo.--------------------------------------------------------------------------------
echo  waiting for device to connect
echo.--------------------------------------------------------------------------------
adb\adb.exe wait-for-device > nul
adb\adb shell pm uninstall -k --user 0 com.amazon.phoenix
adb\adb shell pm uninstall -k --user 0 com.amazon.widgets
echo.--------------------------------------------------------------------------------
echo  Ads have successfully been removed. Press any key to reboot the phone.
echo  NOTE: If ads are still on phone after reboot then run this script again.
echo.--------------------------------------------------------------------------------
pause
adb\adb reboot
adb\adb kill-server
exit