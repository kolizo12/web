# web

After downloading the repo
run the secret.sh 


sh secret.sh 


It spits out the url with token
open the web/docker-compose.yml
add the token to YOURAPP_ENV
 
 
 YOURAPP_ENV: "xxxxxx"
 
 docker-compose up --build -d
 
 username: username
 
 
 password: password


usage

localhost/{TOKEN}
