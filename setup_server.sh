#!/bin/bash

while getopts "h?s:n:u:" opt; do
  case "$opt" in
    n) APP_NAME=$OPTARG
      ;;
    u) USER_NAME=$OPTARG
      ;;
   esac
done

echo "APP NAME";
echo $APP_NAME;

