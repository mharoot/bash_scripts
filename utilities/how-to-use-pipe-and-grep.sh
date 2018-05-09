#!/bin/bash

# list all files with the extension .mp4
# pipe that input through our grep filter "String"
# think of this as MySQL query using LIKE %String%
ls *.mp4 | grep "moinca"
