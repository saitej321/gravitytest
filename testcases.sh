d=$(date +"%m-%d-%Y %T")
echo "Executing test case#1"
remip=$(awk '{print $7}' unique.log | cut -d ':' -f 1 | sort | uniq --repeated)
if test -z "$remip"
then
echo "No multi port scan detected or unique file is blank"
echo "Test case#1 passed"
else
ports=$(awk '{print $7}' unique.log | grep -i $remip | cut -d ':' -f 2)
c=$(echo $ports | xargs | sed -e 's/ /, /g')
s=$(cat unique.log |grep -i $remip | awk '{print $5}' | cut -d ':' -f 1 | uniq --repeated)
echo "$d": " Port scan detected: $s -> $remip on ports $c"
echo "Test case#1 passed"
fi

#dummy file

sh dummymultiport.sh
echo "Executing test case#2"
remip=$(awk '{print $7}' uniquemultiport.log| cut -d ':' -f 1 | sort | uniq --repeated)
if test -z "$remip"
then
echo "No multi port scan detected or unique file is blank"
echo "Test case#2 passed"
else
ports=$(awk '{print $7}' uniquemultiport.log| grep -i $remip | cut -d ':' -f 2)
c=$(echo $ports | xargs | sed -e 's/ /, /g')
s=$(cat uniquemultiport.log |grep -i $remip | awk '{print $5}' | cut -d ':' -f 1 | uniq --repeated)
echo "$d": " Port scan detected: $s -> $remip on ports $c"
echo "Test case#2 passed"
fi
