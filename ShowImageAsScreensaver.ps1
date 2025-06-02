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

# Папка с изображениями (замени на свою)
$folder = "C:\Users\Taylon\Desktop\slide_show"

# Берём все файлы с расширениями изображений и гифок
$extensions = '*.jpg', '*.JPG', '*.jpeg', '*.JPEG', '*.png', '*.PNG', '*.gif', '*.GIF', '*.bmp', '*.BMP', '*.tiff', '*.TIFF', '*.ico', '*.ICO', '*.webp', '*.WEBP'
$files = Get-ChildItem -Path $folder -File -Recurse | Where-Object {
    $_.Extension -match '\.(jpg|jpeg|png|gif|bmp|tiff|ico|webp)$'
} | Sort-Object Name

if ($files.Count -eq 0) {
    Write-Error "В папке '$folder' не найдено изображений."
    exit
}

$index = 0

# Обработчики выхода
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
        # Если ошибка с загрузкой — просто пропускаем это изображение и идём дальше
        ShowNextImage
    }
}

# Показываем первое изображение вручную (индекс -1, чтобы первый вызов ShowNextImage установил 0)
$global:index = -1
ShowNextImage

$timer = New-Object System.Windows.Threading.DispatcherTimer
$timer.Interval = [TimeSpan]::FromSeconds(5)
$timer.Add_Tick({
    ShowNextImage
})
$timer.Start()

$window.ShowDialog()
