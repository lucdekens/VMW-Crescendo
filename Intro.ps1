#Requires -Version 7.0

$moduleName = 'Microsoft.PowerShell.Crescendo'

#region Make sure latest version is installed

$mod = Get-Module -Name $moduleName -ListAvailable
if (-not $mod){
  Install-Module -Name $moduleName
}
else{
  $gallery = Find-Module -Name $moduleName
  if([Version]$gallery.Version -gt $mod.Version){
    Update-Module -Name $moduleName
  }
}
#endregion

#region Explore module
Get-Command -Module $moduleName
#endregion