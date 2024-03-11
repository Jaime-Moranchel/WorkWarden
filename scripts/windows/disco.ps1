# Muestra si el disco puede estar dañado

$VersionWindows=(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').CurrentVersion
$Errores=''

If ($VersionWindows -gt 6.1) 
{
	$ErroresFisicos=(Get-PhysicalDisk | Where-Object -Property HealthStatus -eq 'UnHealthy').FriendlyName -join ','

	if ($ErroresFisicos)
	{
		$Errores='Errores en unidades fisicas: ' + $ErroresFisicos
	}

	$ErroresVolumenes=(Get-Volume | Where-Object {($_.HealthStatus -eq 'UnHealthy' -and $_.DriveType -eq 'Fixed' -and $_.DriveLetter.length -gt 0)}).DriveLetter -join ','

	if ($ErroresVolumenes)
	{
		if ($Errores)
		{
			$Errores=$Errores + '. '
		}

		$Errores=$Errores + 'Errores en volumenes: ' + $ErroresVolumenes
	}

	$Errores
}else 
{
    ''
}
PAUSE
