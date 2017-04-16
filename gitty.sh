#!/usr/bin/env bash 
echo Git Commit Sequence
echo Adding and commiting files...
git add *
git commit
echo Pushing files to website...
git push
echo Sequence done. It may take a few moments for Jekyll to build the files properly.