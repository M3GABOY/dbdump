#!/bin/bash
while getopts s:u:d:p: flag
do
    case "${flag}" in
        s) src=${OPTARG};;
        u) username=${OPTARG};;
        d) dst=${OPTARG};;
        p) password=${OPTARG};;
    esac
done
DATE=$(date +"%Y-%m-%d-%H-%M-%S")
mysqldump -u "$username" -p"$password" "$src" | gzip > "${dst}/${src}-${DATE}.sql.gz"

