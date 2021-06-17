d=$(date +"%m-%d-%Y %T")
remip=$(awk '{print $7}' unique.log | cut -d ':' -f 1 | sort | uniq --repeated)
if test -z "$remip"
then
echo "No multi port scan detected as on $d"
else
ports=$(awk '{print $7}' unique.log | grep -i $remip | cut -d ':' -f 2)
c=$(echo $ports | xargs | sed -e 's/ /, /g')
s=$(cat unique.log |grep -i $remip | awk '{print $5}' | cut -d ':' -f 1 | uniq --repeated)
echo "$d": " Port scan detected: $s -> $remip on ports $c" > portscan.log
fi