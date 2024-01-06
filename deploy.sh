#!/bin/bash

lftp -u $REMOTE_USERNAME,$REMOTE_PASSWORD -e "mirror -R . /wae02; exit" ftp://wae.ztschranz.at:8020
