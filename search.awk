BEGIN {
	FS=",";
}
{
	for(i=1;i<=NF;i++) {
		if(match($i,"\"Gaze Quality\"")) {
			print "Found"
			printf("Column %d is Gaze Quality\n", i);
		} else {
			#print $i
			#printf("Not Found %d \n", i);
		}
	}
	exit 0
}
END {
    print "Done"
}
