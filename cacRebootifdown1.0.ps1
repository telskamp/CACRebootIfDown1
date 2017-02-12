
$base = "https://panel.cloudatcost.com/api/v1"
$cp = $base + "/cloudpro"
$email = "your-cac-email-adress@here.com"
$Apikey = "Your CAC Api key here"
$login = "?key="+ $apikey+ "&login=" + $email
$listservers = $base +"/listservers.php"+$login 
$listtemplates = $base +"/listtemplates.php"+$login 
$listtasks = $base +"/listtasks.php"+$login 
$powerop = $base +"/powerop.php"
$renameserver = $base +"/renameserver.php"+$login 
$rdns = $base +"/rdns.php"+$login 
$console = $base +"/console.php"+$login 
$runmode = $base +"/runmode.php"+$login 
$build = $cp +"/build.php"+$login
$delete = $cp +"/delete.php"+$login 
$resources = $cp +"/resources.php"+$login 



#fetch list of servers
$iplist = (Invoke-RestMethod -uri $listservers |Select-Object -ExpandProperty data |select ip, sid, hostname)
#ing each server and reboot upon failure
Foreach ($IP in $iplist){ 
    if ((Test-NetConnection $IP.ip|Select-Object -ExpandProperty pingsucceeded) -eq -0){
              Write-Output "ping for $ip failed trying to (re)boot"
             $hostname = $ip.hostname
             $ipa = $ip.ip

                write-output "resetting $hostname with ip $ipa"

                $body = @{ 
key = $apikey
login = $email
sid = $IP.sid
action = "reset"
}
                Invoke-RestMethod -uri $powerop -body $body -Method Post
                     }
    
    }

