param([string]$pwd="")
$putty = Get-ItemProperty "HKCU:\SOFTWARE\SimonTatham\PuTTY\Sessions\*"
$tempSession = $putty.where({$_.pschildname -eq "WinSCP%20temporary%20session"})
$p = $tempSession[0]
$name = $p.PSChildName
$options = " -o "
$destination = " $($p.HostName)"
$port = " -p $($p.PortNumber)"
$log_file = if($p.LogType -ne 0) {" -E `"$($p.LogFileName.replace('&H',$name))`""} 
$login_name = if($p.UserName -ne "") {" -l $($p.UserName)"} else {" -l "+$(read-host -prompt "Username for $($p.hostname):$($p.PortNumber)")}
if($p.PublicKeyFile -ne "") {
    $pemPath = $p.PublicKeyFile.replace('.ppk','.pem')
    $wslPemPath = (bash -c "wslpath -a '$($pemPath)'")
    $wslPpkPath = (bash -c "wslpath -a '$($p.PublicKeyFile)'")
    bash -c "puttygen $wslPpkPath -O private-openssh -o $wslPemPath"
    if($pwd -ne "") {
        $identity_file = " -i $($wslPemPath)"
    } else {
        $identity_file = " -i `"$($pemPath)`""
    }
}
$options += if($p.TCPKeepAlives -ne 0){"TCPKeepAlive"}
$command = if($p.RemoteCommand -ne "") {" $($p.RemoteCommand)"} 
$options=if($options.length -le 4) {$null}
if($pwd -ne "") {
   $pwd = $pwd -replace '[^a-zA-Z0-9]', '\$&'
   $commandline="bash -c `"sshpass -p "+$pwd+" ssh -oStrictHostKeyChecking=accept-new"+$log_file+$password+$identity_file+$login_name+$options+$port+$destination+$command+"`""
   Invoke-Expression $commandline	
} else {
   $commandline="ssh"+$log_file+$password+$identity_file+$login_name+$options+$port+$destination+$command
   Invoke-Expression $commandline
}
