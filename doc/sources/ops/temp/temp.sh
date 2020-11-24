grep "href=" index.html|cut -d"/" -f 3|sort -u
cat list.txt|sort -u

for url in $(cat list.txt); do host $url; done
cat index.html|grep "window\[\'"|cut –d "/" –f 3|sort –u >temp.txt

nc -nv 52.74.125.220 443

nc -nlvp 4444
nc -nv 52.74.125.4444 < /usr/bin/wget

ifconfig eth0 |grep inet
nc -nlvp 4444

ncat -l 8080