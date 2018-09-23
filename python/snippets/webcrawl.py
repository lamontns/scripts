#!/usr/bin/python3

import sys
import requests
import re
import urlparse

def requests(target_url):
	try:
		return requests.get("https://"+target_url)
	
	except requests.exceptions.ConnectionError:
		pass


def extract_links(target_url):
	response = request(target_url)
	return re.findall('(?:href="(,*?)"', response.content)


def crawl(target_url):
	href_links = extract_links(target_url)
	for link in href_links:
		link = urlparse.urljoin(target_url, link)
		if "#" in link:
			link = link.split("#")[0]
	
		if target_url in link and link not in target_links:
			target_links.append(link)
			print(link)
			crawl(link)


def main():
	target_url = sys.argv[1]
	target_links = []
	crawl(target_url)

main()
sys.exit(0)
