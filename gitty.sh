#!/usr/bin/env bash
echo Gitty 1.0
echo Copyright 2017 | Marquis Kurt.
echo Licensed under GNU GPL v3.
echo
echo Beginning commit sequence...
echo Adding files...
git add *
echo Enter your commit message:
read message
git commit -m "$message"
echo Pushing files to website...
git push
echo Sequence done. It may take a few moments for Jekyll to build the files properly.
