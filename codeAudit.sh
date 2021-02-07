#!/bin/bash

dir=$1
div='------------------------------------'


echo "[*] Checking PHP with Regex:"
echo $div

egrep -r "(\\w*{0}\\w*)\\(.*?\\)" $1/.

echo
echo

echo "[*] Checking PHP for Possible XXE:"
echo $div

grep -r "loadXML" $1/.
grep -r "DOMDocument" $1/.

echo
echo

echo "[*] Checking PHP Command Injection:"
echo $div

declare -a cmdInj=("eval" "system" "shell_exec" "exec" "passthru")
for x in ${cmdInj[*]}; do
  echo "[!] Checking $x..."
  grep -r "$x" $1/.
  echo
done

echo
echo

echo "[*] Checking PHP Deserialization:"
echo $div

grep -r "unserialize" $1/.

echo
echo

echo "[*] Checking PHP :"
echo $div

grep -r "get_file_contents" $1/.
grep -r "include" $1/.

echo
echo

echo "[*] Checking PHP SQL Injection:"
echo $div

declare -a sqli=("mysql_query" "pg_query" "odbc_exec" "mssql_query")
for x in $sqli; do
  echo "[!] Checking $x..."
  grep -r "$x" $1/.
  echo
done

echo
echo

echo "[*] Checking PHP SSRF:"
echo $div

grep -r "curl_setopt" $1/.
grep -r "curl_exec" $1/.

echo
echo

echo $div
echo "....JAVA CHECKS...."
echo $div

echo
echo "XXE"
declare -a xxe=("DocumentBuilderFactory" "SAXParser" "SAXParserFactory")
for x in ${xxe[*]}; do
  echo "[!] Checking $x..."
  grep -r "$x" $1/.
  echo
done

echo
echo "Command Injection"
declare -a javaCmdInj=("Runtime.exec" "ProcessBuilder")
for x in ${javaCmdInj[*]}; do
  echo "[!] Checking $x..."
  grep -r "$x" $1/.
  echo
done

echo
echo "Deserialization"
declare -a javaDeserialize=("readObject" "XMLDecoder" "InputObjectStream" "XStream")
for x in ${javaDeserialize[*]}; do
  echo "[!] Checking $x..."
  grep -r "$x" $1/.
  echo
done

echo
echo "Spring Boot Expression Language Injection"

grep -r "SpelExpressionParser" $1/.

echo

echo $div
echo MORE THINGS TO IMPLEMENT
echo $div
echo
echo real_escape_string

queryDB
query
sql
santitize
grep for url variables related to sensitive requests

php display errors directive:
  /etc/php5/apache2/php.ini
  display_errors = On

  # $_user_location = 'public';

var names like `query` or `qry` or functions containing the word `search` can explain how the application handles user-controlled data

```php
#search for `function *search*` or `function .*search.*`

# DB logging
sudo tail –f /var/log/mysql/mysql.log

## PHP Magic Quotes have been deprecated since version 5.4.0

#! session tokens are interesting to keep track of

# setting up a server to use another server as its dedicated mail server:
`sudo cat /etc/postfix/transport`
  ...
  offsec.local smtp:[192.168.121.106]:587
  ...

  `sudo postmap /etc/postfix/transport`

Java web applications use a deployment descriptor file named `web.xml` to determine how URLs map to servlets, which URLs require auth*, etc.

# Java in jar files -> grep -ir `^.*?query.*?select.*?` . --color


