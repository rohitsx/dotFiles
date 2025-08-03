#!/bin/bash

TEMP=$(sensors 2>/dev/null | grep 'Tctl:' | awk '{print $2}')
echo "$TEMP"
