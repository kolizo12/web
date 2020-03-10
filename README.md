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
