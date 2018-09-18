#!/bin/bash

echo
echo "###################################"
echo "   Sweet Bash Web Scraper Bro!"
echo "###################################"
echo
echo "Internal Links and Directories:"
echo "==================================="
curl "https://$1" 2>/dev/null | grep "href=" | cut -d'"' -f2 | sed "s/https:\/\/$1\//\//g" | sort -u | grep -v "tel:" | grep -v "http" | grep "^/"
echo
echo "Single Files Linked to by the target url"
echo "==================================="
curl "https://$1" 2>/dev/null | grep "href=" | cut -d'"' -f2 | sed "s/https:\/\/$1\//\//g" | sort -u | grep -v "tel:" | grep -v "http" | grep -v "^/"
echo
echo "External Links found on the page:"
echo "==================================="
curl "https://$1" 2>/dev/null | grep "href=" | cut -d'"' -f2 | sed "s/https:\/\/$1\//\//g" | sort -u | grep -v "tel:" | grep "http"
echo
