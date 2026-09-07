#!/bin/bash

case "$1" in

move)
    mv file1.txt documents/
    ;;

rename)
    mv file1.txt file2.txt
    ;;

multiple)
    mv file1.txt file2.txt documents/
    ;;

directory)
    mv source_dir documents/
    ;;

esac
