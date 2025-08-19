$usuarios = get-LocalUser
$sinlogon = @()
$conlogon = @()
foreach ($u in $usuarios){
    if (-not $u.lastLogon){
        $sinlogon +="$($u.Name): Estado = $($u.Enabled), Ultimo acceso = NUNCA"
    } else{
          $conlogon += "$($u.Name): Estado = $($u.Enabled), Ultimo acceso = $($u.lastlogon)"
    }
}
#para guardar en archivos separados 

$sinlogon | Out-File -FilePath "$env:USERPROFILE\Desktop\usuarios_sin_logon.txt"
$conlogon | Out-File -FilePath "$env:USERPROFILE\Desktop\usarios_con_logon.txt"

#para mostrarlo en pantalla
Write-Output "`n Usuarios que NUNCA han iniciado sesion: "
$sinlogon | ForEach-Object { Write-Output $_}
Write-Output "`n Usuarios que SIan iniciado sesion: "
$conlogon | ForEach-Object { Write-Output $_ }