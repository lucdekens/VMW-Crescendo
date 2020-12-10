#Requires -Version 7.0
#Requires -RunAsAdministrator

#region VMware Tools debug levels

$getDebugConfig = @{
  '$schema' = './Microsoft.PowerShell.Crescendo.Schema.json'
  'Verb' = 'Get'
  'Noun' = 'ToolsDebugSetting'
  'OriginalName' = "$($env:ProgramFiles)\VMware\VMware Tools\VMwareToolboxCmd.exe"
  'Description' = 'Retrieve the debug levels for VMware Tools'
  'OriginalCommandElements' = 'logging','level','get'
  'Parameters' = @(
    @{
      'Name' = 'Svc'
      'OriginalName' = 'vmsvc'
      'ParameterType' = 'switch'
      'Description' = 'Primary VMware Tools service'
    },
    @{
      'Name' = 'Vss'
      'OriginalName' = 'vmvss'
      'ParameterType' = 'switch'
      'Description' = 'Volume Shadow Copy service'
    },
    @{
      'Name' = 'Resolution'
      'OriginalName' = 'vmresset'
      'ParameterType' = 'switch'
      'Description' = 'Resolution Set Tool'
    },
    @{
      'Name' = 'Tray'
      'OriginalName' = 'vmtray'
      'ParameterType' = 'switch'
      'Description' = 'The Tray icon in Windows'
    },
    @{
      'Name' = 'User'
      'OriginalName' = 'vmusr'
      'ParameterType' = 'switch'
      'Description' = 'The VMware Tools user service'
    },
    @{
      'Name' = 'Toolbox'
      'OriginalName' = 'toolbox'
      'ParameterType' = 'switch'
      'Description' = 'Toolbox UI'
    },
    @{
      'Name' = 'ToolBoxCmd'
      'OriginalName' = 'toolboxcmd'
      'ParameterType' = 'switch'
      'Description' = 'Toolbox command line'
    }
  )
  'OutputHandlers' = @(
        @{
            'ParameterSetName' = 'Default'
            'Handler' = {
              $service,$level = $args[0].Split('=')
              New-Object -TypeName PSObject -Property @{
                "$($service -replace '.level','')" = $level.Trim(' ')
              }
            }
        }
  )
}
$getDebugConfig | ConvertTo-Json | Set-Content -Path "$PSScriptRoot\getdebug.json"

$setDebugConfig = @{
  '$schema' = './Microsoft.PowerShell.Crescendo.Schema.json'
  'Verb' = 'Set'
  'Noun' = 'ToolsDebugSetting'
  'OriginalName' = "$($env:ProgramFiles)\VMware\VMware Tools\VMwareToolboxCmd.exe"
  'Description' = 'Retrieve the debug levels for VMware Tools'
  'OriginalCommandElements' = 'logging', 'level', 'set'
  'Parameters' = @(
    @{
      'Name' = 'Svc'
      'OriginalName' = 'vmsvc'
      'ParameterType' = 'switch'
      'Description' = 'Primary VMware Tools service'
    },
    @{
      'Name' = 'Vss'
      'OriginalName' = 'vmvss'
      'ParameterType' = 'switch'
      'Description' = 'Volume Shadow Copy service'
    },
    @{
      'Name' = 'Resolution'
      'OriginalName' = 'vmresset'
      'ParameterType' = 'switch'
      'Description' = 'Resolution Set Tool'
    },
    @{
      'Name' = 'Tray'
      'OriginalName' = 'vmtray'
      'ParameterType' = 'switch'
      'Description' = 'The Tray icon in Windows'
    },
    @{
      'Name' = 'User'
      'OriginalName' = 'vmusr'
      'ParameterType' = 'switch'
      'Description' = 'The VMware Tools user service'
    },
    @{
      'Name' = 'Toolbox'
      'OriginalName' = 'toolbox'
      'ParameterType' = 'switch'
      'Description' = 'Toolbox UI'
    },
    @{
      'Name' = 'ToolBoxCmd'
      'OriginalName' = 'toolboxcmd'
      'ParameterType' = 'switch'
      'Description' = 'Toolbox command line'
    },
    @{
      'Name' = 'Level'
      'OriginalName' = ''
      'ParameterType' = 'string'
      'Mandatory' = $true
#      'AdditionalParameterAttributes' = "[ValidateSet('error', 'critical', 'warning', 'info', 'message', 'debug')]"
      'Description' = 'New debug level'
    }
    )
    }
$setDebugConfig | ConvertTo-Json | Set-Content -Path "$PSScriptRoot\setdebug.json"

$sCrecendo = @{
  ConfigurationFile = "$($PSScriptRoot)\getdebug.json", "$($PSScriptRoot)\setdebug.json"
  ModuleName = "$($PSScriptRoot)\ToolsDebug.psm1"
  Force = $true
  Confirm = $false
  Verbose = $true
}
Export-CrescendoModule @sCrecendo

Import-Module "$PSScriptRoot\ToolsDebug.psm1" -Force

# A sample run

Get-ToolsDebugSetting -Vss
Set-ToolsDebugSetting -Vss -Level debug
Get-ToolsDebugSetting -Vss

#endregion
