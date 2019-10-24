#!/usr/bin/env bash
echo 'starting  container'
echo 'mountig azure files'
source /connectFiles.sh
echo 'starting npm'
cd /mnt/nekubetalkinfradiag/data/talk-microservices-hell/ui
npm start