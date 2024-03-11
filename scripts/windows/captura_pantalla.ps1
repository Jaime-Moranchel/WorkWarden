# Realiza una captura de pantalla
[void][reflection.assembly]::loadwithpartialname("system.windows.forms")
$DemoScreenshot = [System.Windows.Forms.SystemInformation]::VirtualScreen
$WIDTH = $DemoScreenshot.Width
$HEIGHT = $DemoScreenshot.Height
 $LEFTDIM = $DemoScreenshot.Left 
$TOPDIM = $DemoScreenshot.Top
 $BitmapScreenshot = New-Object System.Drawing.Bitmap $WIDTH, $HEIGHT
$FinalScreenshot = [System.Drawing.Graphics]::FromImage($BitmapScreenshot)
$FinalScreenshot.CopyFromScreen($LEFTDIM, $TOPDIM, 0, 0, $BitmapScreenshot.Size)
$FinalFile = 'C:\Users\smr201\demo.bmp' 
$BitmapScreenshot.Save($FinalFile) 
