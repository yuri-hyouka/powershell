$nDays = 15
$Extensions = "*.bak"

[String[]]$dias = "Friday", "Monday", "Thursday", "Tuesday", "Wednesday"
[String[]]$periodos = "dia", "noite"

foreach ($dia in $dias){

    foreach ($periodo in $periodos){
    
        $logPath =  "D:\Backup\Financiar\$dia\$periodo"
        $Files = Get-Childitem $LogPath -Include $Extensions -Recurse | Where {$_.LastWriteTime -le (Get-Date).AddDays(-$nDays)}
        foreach ($File in $Files) 
            {
                if ($File -ne $NULL)
                {
                    write-host $File.FullName -ForegroundColor "DarkRed"
                    Remove-Item $File.FullName | out-null
            	}
            }               
    }
    
}