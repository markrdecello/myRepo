#!/bin/bash
#
# ASSIGNMENT ONE:
#
# This script downloads a zip file with wget.
# Then makes sure that the download was successful
# Then verifies the integrity of the zipFile
# Then unzips the file
# Then makes sure the unzip was successful
# Then deletes the zipFile, as the unzipped contents have been extracted
# Then counts the cumulative number of words in all the 
#   .txt files in the unzipped directory.
# Then reports back the number of words found.
#
# You need to fill in the blanks I've left.
#

wget https://github.com/melvyniandrag/lorem/archive/master.zip
# TODO1: verify that the return value of wget was 0.
# This indicates that wget successfully got the data at $zipURL
if [ $echo $? -ne 0 ]
then
	echo "Error downloading file"
	exit 1;
else
	echo "Successful!"
fi

 expectedSum=213b8d4956b9243af7d13d0f2a8ef8d3
	    # TODO2 : pipe "md5sum $zipName" to cut. 
	    # Pass the proper parameters to cut so that just the md5sum is extracted from the output.
	    # ( If you run "md5sum Filename" you will see it returns more than just the md5sum )
	    # Side Note: notice that the output of 'md5sum' is 'piped' to 'cut'. This chaining of
	    # calls is standard practice in bash scripting
 computedSum=$(md5sum master.zip | cut -d" " -f1)

	    # TODO3 : check if the $expectedSum and $computedSum are not equal.
	    # Notice that expectedSum and computedSum are not numeric, they are strings. 
	    # i.e. notice that there are letters in expectedSum. You must use string comparisons.
 if [ "$expectedSum" != "$computedSum" ]
then
	echo "Bad md5sum found"
	exit 1;
else
	echo "md5sum match!"
fi

unzip master.zip
			# TODO4 : Verify that the return code of unzip was 0.
if [ $echo $? -ne 0 ]
then
	echo "Unable to unzip"
	exit 1;
else
	echo "Unzipped!"
fi
rm master.zip
				    #
				    # TODO5 : Use 'cat' and 'wc' to count the number of words
				    # in ALL the .txt files under $unzippedName. Store the output
				    # in the variable wordCount. Hint: use a pipe.
wordCount=$(cat lorem-master/*.txt | wc -w)
echo "Found $wordCount many words."
