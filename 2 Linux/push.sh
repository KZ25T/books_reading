#!/bin/bash

if [ -z $1 ]; then
	read -p "input your commit log: " LOG
else
	LOG=$1
fi

ADD="git add ."
COMMIT="git commit -m \"$LOG\""
PUSH1="git push origin"
PUSH2="git push GITHUB"

for cmds in "$ADD" "$COMMIT" "$PUSH1" "$PUSH2"
do
	if $cmds 2>/dev/null; then
		echo -e "\033[32msuccess:\033[0m $cmds"
	else 
		ERRVAL=$?
		echo -e "\033[31merror:\033[0m $cmds " >&2
		exit $ERRVAL
	fi
done
