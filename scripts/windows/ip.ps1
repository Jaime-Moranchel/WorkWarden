# Muestra información de las interfaces de red
Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled=true" |
    Select-Object -ExpandProperty IPAddress |
    Where-Object { $_ -match '\d+\.\d+\.\d+\.\d+' }
