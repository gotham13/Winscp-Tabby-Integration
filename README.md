# Winscp Tabby Integration
One Click SSH From WinSCP To Tabby Using Native Windows OpenSSH and WSL by pulling the Public Keys And Other Stuff From The Default Winscp Temporary Session Created  For Putty By Winscp ( Replacement for open in putty)

# WHY
Putty Integration Works Just Fine But Putty Doesnt Have Tabs So I End Up Opening 1000 New Windows When I Start Working Which Is Entirely My Issue But Its Frustrating

# RANT
* Why was this process so difficult? I was literally Pulling My Hair
* Why puttygen on Windows Doesnt Have A CLI Natively To Convert Certificates FFS. They Provide The [Reason](https://www.chiark.greenend.org.uk/~sgtatham/putty/wishlist/puttygen-batch.html) But WTF . Well WSL FTW
* Why is there no way to pass SSH password automatically on Windows. I mean I know it is not best practice but that doesnt mean there should be no way to do it at all.
Sometimes you cant control these things man. Any way WSL FTW again.
* This one is for WINSCP. Why do you guys pass "Winscp Temporary Session" as the first parameter even though it is not mentioned anywhere.  
I had to write a batch script just to omit the first parameter. Then I had to write a vbscript to run this batch script coz it opened up a terminal first which I didnt like.
* Anyway Learnt Quite A Lot In Two Days

# HOW TO USE
* First Of All Make Sure The Normal Default Putty Integration Is Working For You. 
  Putty Is Needed To Copy The Public Key Paths And Other Stuff From The Temporary Session
* Install [Tabby](https://tabby.sh)
* Clone The Repo
* Replace The Path To Tabby Present In winscp_arg_parser.bat file
* Install Ubuntu WSL And Make It Default ( I dont know if other linux works)
* On The Ubuntu WSL install puttygen/putty and sshpass
* Put This Line In Winscp By Replacing The Path To The File Where The Repo Is Cloned.  

  Go To Preferences > Integration > Applications > Putty/Terminal Client Path And Put  

    [PATH TO CLONED REPO]\winscp_arg_parser.vbs "!P"

# NOTE
* Although it works perfectly on my system . Some System May Face Issues With Permissions And Stuff. You will have to Activate Powershell Script Execution.

# CREDITS
* This [script](https://github.com/Kipjr/powershell/blob/main/Putty2WinTerminal.ps1) was very helpful to get started . 
  I found it on this [issue](https://github.com/microsoft/terminal/issues/10943) .
