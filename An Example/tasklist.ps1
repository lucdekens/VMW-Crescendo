#Requires -Version 7.0

#region An example

$taskConfig = @{
  '$schema' = './Microsoft.PowerShell.Crescendo.Schema.json'
  'Verb' = 'Get'
  'Noun' = 'TaskList'
  'OriginalName' = 'tasklist'
  'OriginalCommandElements' = @("/V")
  'OutputHandlers' = @(
        @{
            'ParameterSetName' = 'Default'
            'Handler' = {
              $labels = $args[0][1]
              $index = 0
              $fieldInfo = $args[0][2].Split(' ') | ForEach-Object -Process {
                @{
                  start = $index
                  length = $_.Length
                }
                $index += $_.Length + 1
              }
              $args[0] | Select-Object -skip 3 -PipelineVariable row | ForEach-Object -Process {
                $obj = [ordered]@{}
                $fieldInfo | ForEach-Object -Process {
                  $obj.Add($labels.SubString($_.start,$_.length).Trim(' '),$row.SubString($_.start,$_.length).Trim(' '))
                }
                New-Object -TypeName PSObject -Property $obj
              }
            }
        }
  )
}
#$sampleConfig.OriginalCommandElements = $ExecutionContext.InvokeCommand.ExpandString($sampleConfig.OriginalCommandElements)

$taskConfig | ConvertTo-Json | Set-Content -Path "$PSScriptRoot\tasklist.json"

Export-CrescendoModule -ConfigurationFile "$PSScriptRoot\tasklist.json" -ModuleName "$PSScriptRoot\TaskList.psm1" -Force -Confirm:$false

#Import-Module "$PSScriptRoot\TaskList.psm1" -Force
#Get-TaskList
#Get-TaskList | Export-Csv -Path "$PSScriptRoot\tasklist.csv" -NoTypeInformation -UseCulture
#endregion
