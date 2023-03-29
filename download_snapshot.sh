# /bin/bash
rm -rf /lotus_tmp/old/*
mv /lotus_tmp/new/* /lotus_tmp/old/
rm -rf /lotus_tmp/*.zst
rm -rf /lotus_tmp/*.car
aria2c -x5 https://snapshots.mainnet.filops.net/minimal/latest.zst -d /lotus_tmp/
sleep 2m
FILE=`ls -p /lotus_tmp/ | grep zst | grep -v aria`
zstd -d /lotus_tmp/$FILE --output-dir-flat=/lotus_tmp/new/
