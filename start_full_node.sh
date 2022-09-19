./geth --datadir full1 --networkid 60801 --syncmode "full" --http --http.api "eth,debug,net,admin" --http.addr 0.0.0.0 --http.port 22016 --http.vhosts "*" --port 30310
./geth --datadir full2 --networkid 60801 --syncmode "full" --http --http.api "eth,debug,net,admin" --http.addr 0.0.0.0 --http.port 22017 --http.vhosts "*" --port 30311
