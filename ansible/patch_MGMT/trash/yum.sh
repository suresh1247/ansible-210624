#!/bin/bash
>list_available.txt
yum check-update 2>/dev/null | awk 'NR>2' 2>/dev/null >> list_available.txt
count = $(cat list_available.txt | wc -l)
# Check if patches are available
if count != 0 ; then
    echo "Non-compliance - Patches available"
else
    echo "Compliance - No patches available"
fi

rm -rf list_available.txt
