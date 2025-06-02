# win-fast-slider
just a slider for just a windows
# Windows PowerShell Image Slideshow Screensaver

This script runs an image or GIF slideshow as a screensaver on Windows using PowerShell.

## Usage

1. In the `a.bat` file, change the following line:

powershell.exe -NoLogo -WindowStyle Hidden -ExecutionPolicy Bypass -File "C:\Users\Taylon\Desktop\slide_show\ShowImageAsScreensaver.ps1"

to
powershell.exe -NoLogo -WindowStyle Hidden -ExecutionPolicy Bypass -File "C:\Users\YourPcName\Desktop\slide_show\ShowImageAsScreensaver.ps1"
where "\YourPcName\" change to your windows operation system user name

Replace `YourPcName` with your actual Windows user account name.

2. In the `ShowImageAsScreensaver.ps1` file, locate the line:
$folder = "C:\Users\Taylon\Desktop\slide_show"


and change it to the path where your images or GIFs are stored.

---

This allows the script to access your media files and run the slideshow correctly.

use ctrl + alt + S for run
