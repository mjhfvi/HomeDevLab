nmap -v -p $PORT -A -oN nmap-$SERVER-$PORT.xml --script=vulners $SERVER
nmap -script nmap-vulners/ -sV $SERVER -p$PORT -oN nmap-$SERVER-$PORT.xml

docker run --rm -p 80:80 -p 24:25 -p 21:21 -p 22:22 -p 23:23 -p 25:25 -p 110:111  -p 139:139 -p 446:445 -p 510:512 -p 511:513 -p 514:514 -p 512:512 -p 513:513 -p 1097:1099 -p 1524:1524 -p 3311:3306 -p 3632:3632 -p 5432:5432 -p 5900:5900 -p 6000:6000 -p 6667:6667 -p 6697:6697 -p 8009:8009 -p 8180:8180 -p 8787:8787 -p 36301:36301 -p 40783:40783 -p 69:69 -p 137:137 -p 138:138 -p 161:161 cyberacademylabs/metasploitable2
