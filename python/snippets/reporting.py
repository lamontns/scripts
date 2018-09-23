#!/usr/bin/python3


"""
<html>
<head>
  <title>Example</title>
  <!-- key: 421523eof56 -->
</head>
<body>
  <h1>Hi!</h1>
 
    <form action="/post.php" >
      Usernme  <input type="text" name="username" />
      Password <input type="text" name="password" />
    </form>
</body>
</html>
"""

from bs4 import BeautifulSoup
from bs4 import Comment

if(validators.url(url)):
  result_html = requests.get(url).text
  parsed_html = BeautifulSoup(result_html, 'html.parser')
  forms           = parsed_html.find_all('form')


from urllib.parse import urlparse

forms      = parsed_html.find_all('form')
for form in forms:
      if((form.get('action').find('https') < 0) and (urlparse(url).scheme != 'https')):
        form_is_secure = False
        print(form_is_secure)



report = ''
url = args.url

for form in forms:
      if((form.get('action').find('https') < 0) and (urlparse(url).scheme != 'https')):
        report += 'Form Issue: Insecure form action ' + form.get('action') + ' found in document\n'

print(report)


comments    = parsed_html.find_all(string=lambda text:isinstance(text,Comment))

for comment in comments:
      if(comment.find('key: ') > -1):
        report += 'Comment Issue: Key is found in the HTML comments, please remove\n'


password_inputs = parsed_html.find_all('input', { 'name' : 'password'})

  for password_input in password_inputs:
      if(password_input.get('type') != 'password'):
        report += 'Input Issue: Plaintext password input found. Please change to password type input\n'


if(report == ''):
  print('Nice job! Your HTML document is secure!')
else:
  print('Vulnerability Report is as follows:\n')
  print('==================================\n\n')
  print(report)



"""
config.yml

forms: true
comments: true
passwords: true
"""
config = {'forms': True, 'comments': True, 'passwords': True}
 
if(args.config):
  print('Using config file: ' + args.config)
  config_file = open(args.config, 'r')
  config_from_file = yaml.load(config_file)
  if(config_from_file):
    config = config_from_file

if(config['forms']):
    for form in forms:
      if((form.get('action').find('https') < 0) and (urlparse(url).scheme != 'https')):
        report += 'Form Issue: Insecure form action ' + form.get('action') + ' found in document\n'
 
  if(config['comments']):
    for comment in comments:
      if(comment.find('key: ') > -1):
        report += 'Comment Issue: Key is found in the HTML comments, please remove\n'
 
  if(config['passwords']):
    for password_input in password_inputs:
      if(password_input.get('type') != 'password'):
        report += 'Input Issue: Plaintext password input found. Please change to password type input\n'



parser.add_argument('--config', help='Path to configuration file')

args = parser.parse_args()

if(args.config):
  print('Using config file: ' + args.config)
  config_file = open(args.config, 'r')


config = {'forms': True, 'comments': True, 'passwords': True}
 
if(args.config):
  print('Using config file: ' + args.config)
  config_file = open(args.config, 'r')
  config_from_file = yaml.load(config_file)
  if(config_from_file):
    config = { **config, **config_from_file }


parser.add_argument('-o', '--output', help='Report file output path')

if(report == ''):
  report += 'Nice job! Your HTML document is secure!\n'
else:
  header =  'Vulnerability Report is as follows:\n'
  header += '==================================\n\n'
 
  report = header + report
 
print(report)
 
if(args.output):
  f = open(args.output, 'w')
  f.write(report)
  f.close
  print('Report saved to: ' + args.output)



