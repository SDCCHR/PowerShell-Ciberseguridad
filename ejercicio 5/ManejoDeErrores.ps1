function Validar-Archivo{
    param([string]$Ruta)

    try{
        if(Test-Path $Ruta){
            $contenido = Get-Content $Ruta -ErrorAction Stop
            return "archivo encontrado y accesible: $Ruta"
        }else{
            throw "el archivo no existe"
        }
    }
    catch{
        return "error: $_"
    }
    finally{
        Write-Host "validacion finalizada para: $Ruta" -ForegroundColor Cyan
    }
}
Validar-Archivo -Ruta "C:\archivo_inexistente.txt"
Validar-Archivo -Ruta "$env:USERPROFILE\Desktop\archivo.txt"