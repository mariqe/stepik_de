#!/bin/bash

(echo "Отчет о логе веб-сервера"
echo "========================"
all=$(grep -c $ access.log)
echo "Общее количество запросов:	$all"
ip1=$(awk '{a[$1]++}END{for(i in a)print a[i],i}' access.log > ip.log | grep -c $ ip.log)
echo "Количество уникальным IP-адресов:        $ip1"
echo " "
get=$(awk '/GET/ {count++} END {print count}' access.log)
post=$(awk '/POST/ {count++} END {print count}' access.log)
echo "Количество запросов по методам:"
echo "   $get GET"
echo "   $post POST"
echo " "
url=$(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -1)
echo "Самый популярный URL: $url") > report.txt
echo "Отчет сохранен в файл report.txt"
