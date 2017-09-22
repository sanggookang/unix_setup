# USAGE:   sh SCRIPT.sh TEST_FILE CHECK_FILE
TEST_FILE=$1
CHECK_FILE=$2

## for each line in TEST_FILE
while read line ; do

    ## check if line exist in CHECK_FILE; then assign result to variable
    X=$(grep "^${line}$" ${CHECK_FILE})


    ## if variable is blank (meaning TEST_FILE line not found in CHECK_FILE)
    ## print 'false' and exit
    if [[ -z $X ]] ; then
        echo 'false'
        exit
    fi

done < ${TEST_FILE}

## if script does not exit after going through each line in TEST_FILE,
## then script will print true
echo 'true'
