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
    #($arrayValue[21..24].ForEach(  {$_ -eq "X"})) || ( $arrayValue[16..20].ForEach(  {$_ -eq "X"}) )|| $arrayValue[15..19].ForEach(  {$_ -eq "X"}) || $arrayValue[10..14].ForEach(  {$_ -eq "X"}) ||  $arrayValue[5..9].ForEach(  {$_ -eq "X"}) || $arrayValue[0..4].ForEach(  {$_ -eq "X"})
    $win = $arrayValue[0] -eq ("X")  && $arrayValue[10].Equals("X") && $arrayValue[15].Equals("X") && $arrayValue[20].Equals('X') && $arrayValue[25] -eq "X" 
    write-host "Columns Status: " 
    Write-Host (($arrayValue[21..24].ForEach(  {$_ -eq "X"})) || ( $arrayValue[16..20].ForEach(  {$_ -eq "X"}) )|| $arrayValue[15..19].ForEach(  {$_ -eq "X"}) || $arrayValue[10..14].ForEach(  {$_ -eq "X"}) ||  $arrayValue[5..9].ForEach(  {$_ -eq "X"}) || $arrayValue[0..4].ForEach(  {$_ -eq "X"}))
$win2=   ($arrayValue[1]  -eq $arrayValue[6]  -eq $arrayValue[11]  -eq $arrayValue[16]  -eq $arrayValue[21] ) || ($arrayValue[2]  -eq $arrayValue[7]  -eq $arrayValue[12]  -eq $arrayValue[17]  -eq $arrayValue[22] ) || ($arrayValue[3]  -eq $arrayValue[8]  -eq $arrayValue[13]  -eq $arrayValue[18]  -eq $arrayValue[23] ) ||($arrayValue[4]  -eq $arrayValue[9]  -eq $arrayValue[14] -eq $arrayValue[19] -eq $arrayValue[24] ) ||   (($arrayValue[21..24].ForEach(  {$_ -eq "X"})) || ( $arrayValue[16..20].ForEach(  {$_ -eq "X"}) )|| $arrayValue[15..19].ForEach(  {$_ -eq "X"}) || $arrayValue[10..14].ForEach(  {$_ -eq "X"}) ||  $arrayValue[5..9].ForEach(  {$_ -eq "X"}) || $arrayValue[0..4].ForEach(  {$_ -eq "X"}))
#   
    Write-Host    "$(($arrayValue[0]  -eq $arrayValue[5]  -eq $arrayValue[10]  -eq $arrayValue[15] -eq $arrayValue[20] -eq $arrayValue[25] -eq "X" ) || ($arrayValue[1]  -eq $arrayValue[6]  -eq $arrayValue[11]  -eq $arrayValue[16]  -eq $arrayValue[21] ) || ($arrayValue[2]  -eq $arrayValue[7]  -eq $arrayValue[12]  -eq $arrayValue[17]  -eq $arrayValue[22] ) || ($arrayValue[3]  -eq $arrayValue[8]  -eq $arrayValue[13]  -eq $arrayValue[18]  -eq $arrayValue[23] ) ||($arrayValue[4]  -eq $arrayValue[9]  -eq $arrayValue[14] -eq $arrayValue[19] -eq $arrayValue[24] ))"  -ForegroundColor Cyan

    # Stop if winning and inform the user
    if($win.Equals("True")){
        Write-Host -Message "Won with Array $arrayValue" -ForegroundColor red

        Write-Host $Players_ArrayList[$arrayValue] -ForegroundColor Yellow
        exit
    }

    Write-Host "Status: $win" -ForegroundColor Yellow
    
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

