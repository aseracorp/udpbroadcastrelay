#!/bin/bash
echo `date` "starting udpbroadcastrelay"



echo `date` "building interface list"

interfaces=$(ip a | awk '/MULTICAST/{gsub(/[@:].*$/, "", $2); print $2}')
ilist=""

for i in $interfaces
do
    echo `date` "interface discovered: ${i}"
    ilist="${ilist} --dev ${i}"
done

i=1
rule=RULE$i
while [ -n "${!rule}" ]; do
    echo `date` "start task  with following settings: --id $i$ilist ${!rule}"
    ./udpbroadcastrelay -f --id $i$ilist ${!rule}
    ((i++))
    rule=RULE$i
done

sleep infinity