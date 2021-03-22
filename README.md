# nmap-bootstrap-xsl

Have a nice interface for checking the result of your Nmap scans. This software must not be used by military or secret service organisations.

## How to use

### 1. New Nmap scan
- Add the `nmap-bootstrap.xsl` as stylesheet to your Nmap scan with the ``--stylesheet`` argument :

  ```sh
  nmap -sS -T4 -A -sC -oA scanme --stylesheet https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/nmap-bootstrap.xsl scanme.nmap.org scanme2.nmap.org
  ```

- Direclty open the file ``scanme.xml`` with your web browser, it will be formatted correctly. It should look like the [`scanme.html` sample report](http://htmlpreview.github.io/?https://github.com/honze-net/nmap-bootstrap-xsl/blob/master/scanme.html).

### 2. With a previously-run scan (with XML output)

If you have a nmap scan already run, with its output as XML, you can apply the formatting template to it.

You'll have 2 options :
 - convert this XML to a HTML file
 - keep the XML but apply the stylesheet to it

#### Build an HTML file for sharing
You have thus to transform the XML to HTML with the following command :

```sh
xsltproc -o scanme.html nmap-bootstrap.xsl scanme.xml
```
You will need to download the ``nmap-bootstrap.xsl``stylesheet beforehand.

#### Add the stylesheet to the XML file

Insert

  ```
  <?xml-stylesheet href="https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/nmap-bootstrap.xsl" type="text/xsl"?>
  ```
  after `<!DOCTYPE nmaprun>` inside the XML file.

## Screenshots

### Scan report
![scanme screenshot 1](https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/scanme-screenshot1.png)

### Detailed overview
![scanme screenshot 2](https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/scanme-screenshot2.png)

### Summary table
![scanme screenshot 2](https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/scanme-screenshot3.png)

## Demos

- [`HackTheBox - Poison on YouTube`](https://www.youtube.com/watch?v=rs4zEwONzzk&t=56s)
