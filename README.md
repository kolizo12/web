# web

Setup a virtual environment using venv on your local machine{OPTIONAL}. 
Git clone the repository to the virutal environment.

Run the command <pre>sh secret.sh</pre> and when prompted, hit enter.
It spits out the url with token to be used for testing later so do save it.

Open the web/docker-compose.yml

Add the token generated above after the url to YOURAPP_ENV.
Please see the example below:
<pre>YOURAPP_ENV: "xxxxxx"</pre>

Then run the command <pre>docker-compose up --build -d</pre>

Open a browser. Preferably not chrome as it doesn't allow self-signed-certificates. 
Browse to the full http url above and use the credentials below to login:
<pre>
username: username
password: password
</pre>
Then open a private browser window to test https with the url. Use the same credentials above.

<pre>
usage

localhost/{TOKEN}
</pre>

DESIGN
<pre>
WEB---------> PROXY
      |          |--> Dockerfile
      |          |--> docker-compose.yml
      |          |--> default.conf
      |          |--> backend-not-found.html
      |          |--> SSL
      |               |--> web.crt
      |                |--> web.key
      |-----> WEB
      |          |--> Dockerfile
      |          |--> docker-compose.yml
      |          |--> index.html
      |-----> README
      |-----> docker-compose.yml
      |-----> secret.sh
</pre>

++++

Short doc describing names, ports, paths, and other aspects we may need to know to use
the solution


<pre>
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                      NAMES
74ced6be57ed        web_proxy           "nginx -g 'daemon of…"   4 hours ago         Up 4 hours          0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   web_proxy_1
e3eae4f50a22        web_app             "nginx -g 'daemon of…"   5 hours ago         Up 5 hours          0.0.0.0:32776->80/tcp                      web_app_1
</pre>


Launching this should generate two containers. The web_proxy is tied to the host at port 80 and 443, while the web_app is exposed at 80 not tied to any host port.

The Dockerfile at the proxy directory accepts an ARG and an ENV which is passed to the defaut.conf of the proxy server and used to subs out the "SECRET" for the token generated.

This part in the Dockerfile is used to generate the password and username

<pre>
/etc/nginx/.htpasswd username password
</pre>

The domain used is server_name localhost.

