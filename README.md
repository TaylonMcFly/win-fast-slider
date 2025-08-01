# ShowImageAsScreensaver

This PowerShell script creates a fullscreen window that cyclically displays images from a specified folder as a slideshow (screensaver).

---

## What to Configure

1. **Path to the images folder**

   In the script, find this line:

   `$folder = "C:\Users\Taylon\Desktop\slide_show"`

   Replace the path with the folder where your images are stored.

2. **Image change interval**

   By default, it is set to 5 seconds:

   `$timer.Interval = [TimeSpan]::FromSeconds(5)`

   Change the number 5 to the desired number of seconds.

3. **Path to the script in the batch file**

   Your batch file command:

   `powershell.exe -NoLogo -ExecutionPolicy Bypass -File "C:\Users\taylo\Desktop\github\win-fast-slider-main\ShowImageAsScreensaver.ps1"`

   Make sure the path to the .ps1 file is correct.

---

## How to Create a Shortcut and Assign a Hotkey (e.g., Ctrl+S)

1. Create a shortcut to your `.bat` file (for example, `a.bat`):

   - Right-click on `a.bat` → Create shortcut.
   - Rename the shortcut, for example, `ShowImageShortcut.lnk`.

2. Assign a hotkey:

   - Right-click the shortcut → Properties.
   - In the Shortcut key field, assign a hotkey, for example, `Ctrl + Alt + S`.

     > Note: Windows requires Ctrl+Alt+<key> combination; single Ctrl+S alone is not allowed.

3. Place the shortcut where convenient (e.g., Desktop).

4. Now pressing `Ctrl+Alt+S` will launch your batch file, which runs the PowerShell script.

---

## Additional Notes

- You can pin the shortcut to Taskbar or Start Menu for easier access.
- To run the script silently without opening a console window, you can modify the PowerShell launch command with `-WindowStyle Hidden` or create a shortcut directly to the `.ps1` file using PowerShell.
