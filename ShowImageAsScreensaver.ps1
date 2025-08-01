
---

Full translated and cleaned PowerShell script with English comments:

```powershell
Add-Type -AssemblyName PresentationFramework, WindowsBase, PresentationCore

$window = New-Object System.Windows.Window
$window.WindowStyle = 'None'
$window.WindowState = 'Maximized'
$window.Topmost = $true
$window.Background = [System.Windows.Media.Brushes]::Black
$window.Cursor = 'None'

$image = New-Object System.Windows.Controls.Image
$image.Stretch = 'UniformToFill'
$window.Content = $image

# Folder with images (change to your folder)
$folder = "C:\Users\Taylon\Desktop\slide_show"

# Get all image files extensions
$extensions = '*.jpg', '*.JPG', '*.jpeg', '*.JPEG', '*.png', '*.PNG', '*.gif', '*.GIF', '*.bmp', '*.BMP', '*.tiff', '*.TIFF', '*.ico', '*.ICO', '*.webp', '*.WEBP'
$files = Get-ChildItem -Path $folder -File -Recurse | Where-Object {
    $_.Extension -match '\.(jpg|jpeg|png|gif|bmp|tiff|ico|webp)$'
} | Sort-Object Name

if ($files.Count -eq 0) {
    Write-Error "No images found in folder '$folder'."
    exit
}

$index = 0

# Close window on key press or mouse click
$window.Add_KeyDown({ $window.Close() })
$window.Add_MouseDown({ $window.Close() })

function ShowNextImage {
    if ($files.Count -eq 0) { return }

    $global:index = ($global:index + 1) % $files.Count
    $imgPath = $files[$global:index].FullName

    try {
        $bitmap = New-Object System.Windows.Media.Imaging.BitmapImage
        $bitmap.BeginInit()
        $bitmap.UriSource = [Uri]$imgPath
        $bitmap.CacheOption = 'OnLoad'
        $bitmap.EndInit()
        $image.Source = $bitmap
    }
    catch {
        # If loading error occurs, skip this image and go to next
        ShowNextImage
    }
}

# Show first image manually (index -1 so first call sets index 0)
$global:index = -1
ShowNextImage

$timer = New-Object System.Windows.Threading.DispatcherTimer
$timer.Interval = [TimeSpan]::FromSeconds(5)
$timer.Add_Tick({
    ShowNextImage
})
$timer.Start()

$window.ShowDialog()
