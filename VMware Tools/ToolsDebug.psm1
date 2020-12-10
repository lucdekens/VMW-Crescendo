# Module created by Microsoft.PowerShell.Crescendo
Function Get-ToolsDebugSetting
{
[CmdletBinding()]

param(
[Parameter()]
[switch]$Svc,
[Parameter()]
[switch]$Vss,
[Parameter()]
[switch]$Resolution,
[Parameter()]
[switch]$Tray,
[Parameter()]
[switch]$User,
[Parameter()]
[switch]$Toolbox,
[Parameter()]
[switch]$ToolBoxCmd
    )

BEGIN {
    $__PARAMETERMAP = @{
        Svc = @{ OriginalName = 'vmsvc'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        Vss = @{ OriginalName = 'vmvss'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        Resolution = @{ OriginalName = 'vmresset'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        Tray = @{ OriginalName = 'vmtray'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        User = @{ OriginalName = 'vmusr'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        Toolbox = @{ OriginalName = 'toolbox'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        ToolBoxCmd = @{ OriginalName = 'toolboxcmd'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
    }

    $__outputHandlers = @{
        Default = @{ StreamOutput = $False; Handler = { 
              $service,$level = $args[0].Split('=')
              New-Object -TypeName PSObject -Property @{
                "$($service -replace '.level','')" = $level.Trim(' ')
              }
             } }
    }
}
PROCESS {
    $__commandArgs = @(
        "logging"
        "level"
        "get"
    )
    $__boundparms = $PSBoundParameters
    $MyInvocation.MyCommand.Parameters.Values.Where({$_.SwitchParameter -and $_.Name -notmatch "Debug|Whatif|Confirm|Verbose" -and ! $PSBoundParameters[$_.Name]}).ForEach({$PSBoundParameters[$_.Name] = [switch]::new($false)})
    if ($PSBoundParameters["Debug"]){wait-debugger}
    foreach ($paramName in $PSBoundParameters.Keys|Sort-Object {$__PARAMETERMAP[$_].OriginalPosition}) {
        $value = $PSBoundParameters[$paramName]
        $param = $__PARAMETERMAP[$paramName]
        if ($param) {
            if ( $value -is [switch] ) { $__commandArgs += $value.IsPresent ? $param.OriginalName : $param.DefaultMissingValue }
            elseif ( $param.NoGap ) { $__commandArgs += "{0}""{1}""" -f $param.OriginalName, $value }
            else { $__commandArgs += $param.OriginalName; $__commandArgs += $value |Foreach-Object {$_}}
        }
    }
    $__commandArgs = $__commandArgs|Where-Object {$_}
    if ($PSBoundParameters["Debug"]){wait-debugger}
    if ( $PSBoundParameters["Verbose"]) {
         Write-Verbose -Verbose -Message C:\Program Files\VMware\VMware Tools\VMwareToolboxCmd.exe
         $__commandArgs | Write-Verbose -Verbose
    }
    $__handlerInfo = $__outputHandlers[$PSCmdlet.ParameterSetName]
    if (! $__handlerInfo ) {
        $__handlerInfo = $__outputHandlers["Default"] # Guaranteed to be present
    }
    $__handler = $__handlerInfo.Handler
    if ( $PSCmdlet.ShouldProcess("C:\Program Files\VMware\VMware Tools\VMwareToolboxCmd.exe")) {
        if ( $__handlerInfo.StreamOutput ) {
            & "C:\Program Files\VMware\VMware Tools\VMwareToolboxCmd.exe" $__commandArgs | & $__handler
        }
        else {
            $result = & "C:\Program Files\VMware\VMware Tools\VMwareToolboxCmd.exe" $__commandArgs
            & $__handler $result
        }
    }
  } # end PROCESS

<#


.DESCRIPTION
Retrieve the debug levels for VMware Tools

.PARAMETER Svc
Primary VMware Tools service


.PARAMETER Vss
Volume Shadow Copy service


.PARAMETER Resolution
Resolution Set Tool


.PARAMETER Tray
The Tray icon in Windows


.PARAMETER User
The VMware Tools user service


.PARAMETER Toolbox
Toolbox UI


.PARAMETER ToolBoxCmd
Toolbox command line



#>
}

Function Set-ToolsDebugSetting
{
[CmdletBinding()]

param(
[Parameter()]
[switch]$Svc,
[Parameter()]
[switch]$Vss,
[Parameter()]
[switch]$Resolution,
[Parameter()]
[switch]$Tray,
[Parameter()]
[switch]$User,
[Parameter()]
[switch]$Toolbox,
[Parameter()]
[switch]$ToolBoxCmd,
[Parameter(Mandatory=$true)]
[string]$Level
    )

BEGIN {
    $__PARAMETERMAP = @{
        Svc = @{ OriginalName = 'vmsvc'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        Vss = @{ OriginalName = 'vmvss'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        Resolution = @{ OriginalName = 'vmresset'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        Tray = @{ OriginalName = 'vmtray'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        User = @{ OriginalName = 'vmusr'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        Toolbox = @{ OriginalName = 'toolbox'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        ToolBoxCmd = @{ OriginalName = 'toolboxcmd'; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [switch]; NoGap = $False }
        Level = @{ OriginalName = ''; OriginalPosition = '0'; Position = '2147483647'; ParameterType = [string]; NoGap = $False }
    }

    $__outputHandlers = @{ Default = @{ StreamOutput = $true; Handler = { $input } } }
}
PROCESS {
    $__commandArgs = @(
        "logging"
        "level"
        "set"
    )
    $__boundparms = $PSBoundParameters
    $MyInvocation.MyCommand.Parameters.Values.Where({$_.SwitchParameter -and $_.Name -notmatch "Debug|Whatif|Confirm|Verbose" -and ! $PSBoundParameters[$_.Name]}).ForEach({$PSBoundParameters[$_.Name] = [switch]::new($false)})
    if ($PSBoundParameters["Debug"]){wait-debugger}
    foreach ($paramName in $PSBoundParameters.Keys|Sort-Object {$__PARAMETERMAP[$_].OriginalPosition}) {
        $value = $PSBoundParameters[$paramName]
        $param = $__PARAMETERMAP[$paramName]
        if ($param) {
            if ( $value -is [switch] ) { $__commandArgs += $value.IsPresent ? $param.OriginalName : $param.DefaultMissingValue }
            elseif ( $param.NoGap ) { $__commandArgs += "{0}""{1}""" -f $param.OriginalName, $value }
            else { $__commandArgs += $param.OriginalName; $__commandArgs += $value |Foreach-Object {$_}}
        }
    }
    $__commandArgs = $__commandArgs|Where-Object {$_}
    if ($PSBoundParameters["Debug"]){wait-debugger}
    if ( $PSBoundParameters["Verbose"]) {
         Write-Verbose -Verbose -Message C:\Program Files\VMware\VMware Tools\VMwareToolboxCmd.exe
         $__commandArgs | Write-Verbose -Verbose
    }
    $__handlerInfo = $__outputHandlers[$PSCmdlet.ParameterSetName]
    if (! $__handlerInfo ) {
        $__handlerInfo = $__outputHandlers["Default"] # Guaranteed to be present
    }
    $__handler = $__handlerInfo.Handler
    if ( $PSCmdlet.ShouldProcess("C:\Program Files\VMware\VMware Tools\VMwareToolboxCmd.exe")) {
        if ( $__handlerInfo.StreamOutput ) {
            & "C:\Program Files\VMware\VMware Tools\VMwareToolboxCmd.exe" $__commandArgs | & $__handler
        }
        else {
            $result = & "C:\Program Files\VMware\VMware Tools\VMwareToolboxCmd.exe" $__commandArgs
            & $__handler $result
        }
    }
  } # end PROCESS

<#


.DESCRIPTION
Retrieve the debug levels for VMware Tools

.PARAMETER Svc
Primary VMware Tools service


.PARAMETER Vss
Volume Shadow Copy service


.PARAMETER Resolution
Resolution Set Tool


.PARAMETER Tray
The Tray icon in Windows


.PARAMETER User
The VMware Tools user service


.PARAMETER Toolbox
Toolbox UI


.PARAMETER ToolBoxCmd
Toolbox command line


.PARAMETER Level
New debug level



#>
}

Export-ModuleMember -Function Get-ToolsDebugSetting, Set-ToolsDebugSetting
