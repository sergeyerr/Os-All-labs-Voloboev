param($len = "100024", $pass = "C:\Users\Сергей\Desktop", $prog = "C:\WINDOWS\system32\notepad.exe")
If((Test-Path $pass) -and (Test-Path $prog) -and ((Get-Item $prog).Extension -eq ".exe")) {
    Set-Location $pass
    $text = ""
    Get-ChildItem | Where-Object {$_.Length -lt $len} | ForEach-Object { $text += $_.CreationTime.DateTime + " " + $_.Name + "`r`n"} >output.txt
    #New-Item -Name output.txt -Value $text -Force
    & $prog "output.txt"
}
Else {write("check your input")}
