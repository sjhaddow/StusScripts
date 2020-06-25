$serviceName = "CatoNetworksVPNService"
$status = Get-Service CatoNetworksVPNService | Select-Object Status
$starttype = Get-Service CatoNetworksVPNService | Select-Object StartType

If ( (Get-Service $serviceName).Status -ne "Running") {
	Set-Service $serviceName -StartupType Manual
    Start-Service $serviceName
	$status = Get-Service CatoNetworksVPNService | Select-Object Status
	$starttype = Get-Service CatoNetworksVPNService | Select-Object StartType	
	Write-Output "$serviceName is started."
	Write-Output "$status"
	Write-Output "$starttype"
	Start-Process -filepath "C:\Program Files (x86)\Cato Networks\Cato Client\CatoClient.exe"
	}
else {
	Set-Service $serviceName -StartupType Disabled
    Stop-Service $serviceName
	$status = Get-Service CatoNetworksVPNService | Select-Object Status
	$starttype = Get-Service CatoNetworksVPNService | Select-Object StartType	
	Write-Output "$serviceName is stopped."
	Write-Output "$status"
	Write-Output "$starttype"
	Stop-Process -name CatoClient
	}
pause 