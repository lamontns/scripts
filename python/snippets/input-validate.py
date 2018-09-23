#!/usr/bin/python3

import validators
import requests
parser.add_argument('url', type=str, help="The URL of the HTML to analyze")


if(validators.url(url)):
  result_html = requests.get(url).text
  print(result_html)
else:
  print('Invalud URL. Please include full URL including scheme.')

url = args.url
 
if(validators.url(url)):
  print('That was a good URL')
else:
  print('That one wasn\'t so good')


