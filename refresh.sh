#!/bin/bash

echo Check delta between local and remote repo

#echo listing differences and calculating word count for the if condition
DIFFPULL=$(git fetch && git diff HEAD..@{u} | wc -m)

if [ "$DIFFPULL" != "0" ]; then
	echo There are updates in the remote repo -> executing pull
	#executing a force pull disregarding local changes
	git fetch
	git reset --hard HEAD
	git merge
fi

echo end of script