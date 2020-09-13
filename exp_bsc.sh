#!/bin/bash
# Pablo Morales
# bash script to convert matlab files

echo '----- boring -----'

PATH_TOMAT="/Applications/(your_MATLAB_ver)/bin/matlab"
if [ $# -eq 0 ]; then
	echo "No arguments provided"
	exit 1
fi
target_dir=$1
echo "($# args) Directory: $target_dir"

for entry in "$target_dir"/*
# rename files to introduce some regularity
counter=1
do
	mv $entry "file $i"
	counter=counter+1
done

exit 1

for i in {23..24}
do
	target="$target_dir/file $i"
	#echo $target
	sed -i '' 's|target_dir|'"$target"'|g' convert2csv.m
	$PATH_TOMAT -nodisplay -nosplash -nodesktop -r "run(./convert2csv.m);exit;"
	echo "gotta move those $i son!"
	#mv SS"$i"* /Users/pablomorales/Desktop/FB2L/Data/DTCPA_Data/SS"$i"
	echo "resetting .m file"
	sed -i '' 's|'"$target"'|target_dir|g' convert2csv.m
done
