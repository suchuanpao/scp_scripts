#!/usr/bin/env python3
# coding=utf-8
from bs4 import BeautifulSoup
import urllib.request as urlrq
import urllib

def openurl_and_getsoup(url):
    web = urlrq.urlopen(url)
    return BeautifulSoup(str(web.read().decode("utf-8")),"lxml")

website = "https://www.jianguoyun.com"
url = website + "/s/downloads/linux"
soup = openurl_and_getsoup(url)

nodes = soup.find_all("a", class_="linux-link")
for node in nodes:
    text = node.get_text();
    if "32-bit" in text and "ubuntu" in node.get('href'):
        print(website+node.get('href'))
        #try:
        #    with open("test.bin", "wb") as fd:
        #        f = urlrq.urlopen(website+node.get('href'))
        #        fd.write(f.read())
        #    #urlrq.urlretrieve(website+node.get('href', "/home/suchp/suchp_familly/yum/script/test.bin"))
        #except Exception as e:
        #    print(e.args)

#linux_package_link = soup.select('a[class=linux-link]')
#soup.img['src']#可以获取一个图片的url
#print(type(linux_package_link))
#print(linux_package_link[0].get_text())
#print(linux_package_link)
#print(all_img)
