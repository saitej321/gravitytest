#!/bin/bash
awk 'function hextodec(str,ret,n,i,k,c){
    ret = 0
    n = length(str)
    for (i = 1; i <= n; i++) {
        c = tolower(substr(str, i, 1))
        k = index("123456789abcdef", c)
        ret = ret * 16 + k
    }
    return ret
}

function getIP(str,ret){
    ret=hextodec(substr(str,index(str,":")-2,2));
    for (i=5; i>0; i-=2) {
        ret = ret"."hextodec(substr(str,i,2))
    }
    ret = ret":"hextodec(substr(str,index(str,":")+1,4))
    return ret
}
NR > 1 {{if(NR==2)local=getIP($2);remote=getIP($3)}{print local" -> "remote}}' tcptest.txt | sort | uniq > 'multiportscanoutput.log'
cat multiportscan* | gawk '{ print strftime("%Y-%m-%d %H:%M:%S")": New connection: ", $0 }' > uniquemultiport.log
