#!/bin/bash

websites=("https://google.com" "https://facebook.com" "https://twitter.com" "https://notExistedSite.com")

log_file="status.log"

> "$log_file"

for website in "${websites[@]}"; do
    response=$(curl -Ls -o /dev/null -w "%{http_code}" "$website")
    if echo "$response" | grep -q 200; then
        status="[$website] is UP"
    else
        status="[$website] is DOWN"
    fi
    echo "$status" >> "$log_file"
done

echo "Results have been logged in $log_file"