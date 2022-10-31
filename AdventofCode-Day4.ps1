<# Author : Murtadha Marzouq#>


# Download the file locally
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MurtadhaM/Pipline-Python/main/Input.txt" -OutFile input.txt


$InputText = Get-Content 'input.txt'

$Players  = [System.Collections.ArrayList]::new()




$Players_ArrayList = New-Object -TypeName "System.Collections.ArrayList"


$BingoKeys = $InputText.Split('\n').Get(0)
$PlayerValues =  $InputText.Split('\n').Replace('  ', ' ')

# Removing the first Line
$PlayerValues =  $PlayerValues[1..$PlayerValues.Length ].TrimEnd().TrimStart()



function getPlayers{
    $temp_player = ''
    foreach($p in $PlayerValues){
        if(!$p.Equals('')){

        $temp_player += " "+ $p
        # Write-Host "$p  " -ForegroundColor Blue
        }
        
        if($temp_player.Split(' ').Length -gt 24){
            # Write-Host -Message "The temp player value is = $temp_player" -ForegroundColor Cyan
            $Players_ArrayList.Add($temp_player)
            $temp_player = ''
            # Write-Host 'New Player'  -ForegroundColor Yellow
        } 
     }
     return $Players_ArrayList
}

function isWinning($arrayValue){
    $arrayValue = $arrayValue.Split(' ')
    # True if "X" is found in a row or a column inside $arrayValue
    $win = $false 
    # create a  5x5 array
    $4DArray  = @([System.Collections.ArrayList]::new(),[System.Collections.ArrayList]::new(),[System.Collections.ArrayList]::new(),[System.Collections.ArrayList]::new(),[System.Collections.ArrayList]::new(),[System.Collections.ArrayList]::new())

    For($i=0; $i -lt $arrayValue.Length; $i++){
        $4DArray[$i%5].Add($arrayValue[$i])
    }
    #print the 4D array as a matrix
    For($i=0; $i -lt 5; $i++){
        $row = ''
        For($j=0; $j -lt $4DArray[$i].Count; $j++){
            $row += $4DArray[$i][$j] + ' '
        }

     Write-Host $row  -ForegroundColor Green
     
    } 
    # Col
}

   


function Mark_Number($value){
    $temp_player = ''
for($i=0; $i -lt $Players_ArrayList.Count; $i++) {
    $p = $Players_ArrayList[$i].Split(' ')
    if(!$p.Equals('')){
        if($p.indexOf(($value) -gt 1)){
            
            $p[$p.IndexOf($value)] = 'X'
            
        }
    $temp_player += " "+ $p
    }
    if($temp_player.Split(' ').Length -gt 24){
        $Players_ArrayList[$i] = ($temp_player)
         # Testing if winning
     isWinning($temp_player)

        $temp_player = '' 
    } 
 }


 return $Players_ArrayList
}




function Bingo_manager($limit){

    Write-Host $BingoKeys
    
 
        foreach($Key in $BingoKeys.Split(',')){
            # Write-Host -Message "Parsing Key $Key" -ForegroundColor  Blue
            $temp_out = $(Mark_Number($Key))

             Write-Host -Message "KEYS USED: $Key" -ForegroundColor DarkMagenta
             Write-Host $Players_ArrayList[0] -ForegroundColor Blue
                


        
    }
}



$numberOfPlayers = $(getPlayers)


Bingo_manager(10)

