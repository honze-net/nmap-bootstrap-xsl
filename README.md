# nmap-bootstrap-xsl

A Nmap XSL implementation with Bootstrap.

## How to use

- Add the `nmap-bootstrap.xsl` as stylesheet to your Nmap scan. 
- Example: 

```sh
nmap -sS -T4 -A -sC -oA scanme --stylesheet https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/nmap-bootstrap.xsl scanme.nmap.org scanme2.nmap.org
```

- Open the scanme.xml with your Web browser. It should look like the [`scanme.html sample report`](http://htmlpreview.github.io/?https://github.com/honze-net/nmap-bootstrap-xsl/blob/master/scanme.html).
- Alternatively you can transform the xml to html with

```sh
xsltproc -o scanme.html nmap-bootstrap.xsl scanme.xml
```

- You will need to download the nmap-bootstrap.xsl beforehand.

## Old scans

- You can also format old scans with the xsl stylesheet.
- Insert `<?xml-stylesheet href="https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/nmap-bootstrap.xsl" type="text/xsl"?>` after `<!DOCTYPE nmaprun>`.

## Screenshots

![scanme screenshot 1](https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/scanme-screenshot1.png)

![scanme screenshot 2](https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/scanme-screenshot2.png)

![scanme screenshot 2](https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/scanme-screenshot3.png)

## Demos

- [`HackTheBox - Poison on YouTube`](https://www.youtube.com/watch?v=rs4zEwONzzk&t=56s)
