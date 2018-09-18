#!/bin/bash

robots=$target.txt
break="#########################################"

echo
echo
echo -n "Enter Target Domain or IP Address: "
read target
echo -n "Target Output Dir.: "
read output
echo
echo "Targeting: "$target"  Output Location: "$output
read -p "Press <ENTER> to continue..."

if [ -z $target, $output ]; then
	echo
	echo "Target Domain or Output Location NOT Valid..."
	echo "Exiting Now..."
	exit
fi

wget $target/robots.txt -O $output/robots.txt &
sleep 5
cat $output/robots.txt | grep Disallow | awk '{print $2}' > $output/$robots 2>/dev/null
sleep 1 
firefox &
sleep 4

for i in $(cat $output/$robots); do
	firefox -new-tab $target$i &
	sleep 1
done
echo $break
echo "Starting Cleanup"
echo $break
echo "Cleeeaaaaannnniiinnnngggg......"
echo ......
rm $output/robots.txt 2>/dev/null
rm $output/$robots 2>/dev/null
echo $break
echo "Cleanup Complete."
echo $break
