#!/usr/bin/env bash 
echo Git Commit Sequence
echo Adding files...
git add *
echo Enter your commit message:
read message
git commit -m "$message"
echo Pushing files to website...
git push
echo Sequence done. It may take a few moments for Jekyll to build the files properly.