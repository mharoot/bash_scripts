#/!bin/bash

# Checks if the variable passed as a string is empty.
function isEmpty() {
	if [ -z $1 ]; then
		return 0 # empty
	fi
	return 1 # not empty
}

# Check if the staging directory exits.
function isStagingDirectory() {
	echo ""
	git checkout $1
	if [ $? -eq 1 ]; then
		printf "\nSorry, $1 is not among your staging directory choices.  Please make sure you type the branch name correctly.  You have the following choices:\n"
		printList
		printf "\npress q to quit or type the name of the staging directory you wish to assign as the head.\n"
		read sd
		if [ "$sd" == "q" ]; then
			return 0
		else
			main "$sd"
		fi
	fi

}

# Prints all the branches in the staging directory.
function printList() {
	git branch -av >branch_list.txt
	printf "\n%s\n" "$(cat branch_list.txt)"
	rm branch_list.txt
}



function main() {
	isEmpty "$1"
	if [ $? -eq 0 ]; then
		printf "\nThe current head branch was not switched.\n\n"
	else
		isStagingDirectory "$1"
	fi
}

# run program
printList
printf "\nType the name of the staging directory if you wish to switch the current branch head.\n"
read stagingDirectory
isEmpty "$stagingDirectory"
if [ $? -eq 0 ]; then
	 printf "\nThe current head branch was not switched.\n\n"
else
	 isStagingDirectory "$stagingDirectory"
fi
