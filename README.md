# winlibs
Windows Visual C++ Libraries.

## ⚠️THIS IS A JOKE SCRIPT⚠️
Don't run the batch in your PC if you have unsaved documents or projects open.
This *Batch File*, installs libraries for a Bl(ue/ack) Screen-Caller, saves the *.exe*
in _%temp%_, and then, the script run the *.exe*

## How to build?
Download the `bsod-caller.cpp` from \source. Then, create a C++ Console App project in Visual Studio. (yes, just 16 lines can do that.)
Set `Release | {TARGET_MACHINE}`
Build. (CTRL + SHIFT + B)

## How the BATCH (Run.bat) works?
Firts, requests admin.
It downloads the needed libraries from this repository. Then, downloads the bsod.exe compiled file to %temp% and run it.

## How to download dependencies only?
Download `dependencies.bat` and run it. It will not download the bsod-caller.

### If you get an alert...
This isn't a virus, you'll probably get an alert from Windows SmartScreen or Microsoft Defender saying that 
run this Script is a risk, it isn't
