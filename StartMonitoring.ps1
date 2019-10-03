 Param (
	[string]$Path = "C:\Temp"
	)

### Look for any files from the path mentioned above
    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = $Path
    $watcher.Filter = "*.*"
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true  

### DEFINE ACTIONS AFTER AN EVENT IS DETECTED
	$action = { 
                $A = Start-Process -FilePath C:\Users\arsivana\Desktop\Arun\Project\MGM\test.bat -Wait -passthru;$a.ExitCode
              } 


### Events to be watched 
    Register-ObjectEvent $watcher "Created" -Action $action
    Register-ObjectEvent $watcher "Changed" -Action $action
    Register-ObjectEvent $watcher "Deleted" -Action $action
    Register-ObjectEvent $watcher "Renamed" -Action $action
    while ($true) {sleep 2}