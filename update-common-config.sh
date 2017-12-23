#!/bin/sh

grep -A999999 "##### COMMON SECTION START #####" .config > configs/common.in
