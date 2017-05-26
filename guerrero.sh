#!/usr/bin/env bash
args=$1

if [ $args = "upload" ]; then
  echo Beginning commit sequence...
  echo Adding files...
  git add *
  echo Files added.
  clear
  echo Enter your commit message:
  read message
  git commit -m "$message"
  echo Pushing files to website...
  git push
  echo Sequence done. It may take a few moments for Jekyll to build the files properly.
else if [ $args = "download" ]; then
  echo Pulling files and changes...
  git pull
  echo Sequence done.
else if [ $args = "test" ]; then
  echo Making a test server and building Jekyll site: use CTRL+C to stop at any time
  bundle exec jekyll serve
else if [ $args = "ver" ]; then
  echo Guerrero Script
  echo Licensed under GNU GPL v3
  echo 1.0.0
else
  echo Command $args not found
fi
fi
fi
fi
