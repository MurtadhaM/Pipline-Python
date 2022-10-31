foreach($row in $2Darray){
        foreach($col in $row){
            Write-Host -Message $col -ForegroundColor Green
        }
        Write-Host -Message ' ' -ForegroundColor Green
    }