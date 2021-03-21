
number=$(apt list --upgradable 2> /dev/null | wc -l)
echo $(expr $number - 1)
