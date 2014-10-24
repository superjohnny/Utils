#!/usr/bin/env bash


echo "Processing header files"
perl -pi -e 's/LVDriving/Utils/g' *.h
perl -pi -e 's/Wunelli/AngryYak/g' *.h

echo "Processing module files"
perl -pi -e 's/LVDriving/Utils/g' *.m
perl -pi -e 's/Wunelli/AngryYak/g' *.m