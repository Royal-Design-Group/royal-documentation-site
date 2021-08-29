# Enviroments

Most secrets and domain specfic values are managed with various .env files 
in `royal-web/env`
Env files are used as global variables with domain specific values to control features that are used in some domains

values in these files can be passed into the client side of the applications by using the prefix `REACT_APP`

ex: `REACT_APP_TRUSTPILOT_LINK=https://no.trustpilot.com/`

prod/ = production enviroments
stage/ = development enviroments

shared enviroment variables (non domain specific) are placed in files named `common`

each application also has a local .env is used for local development the local .env file override the others during development. 

enviroment files found in 
```shell
Project root/
   env/
      r21/
         prod/
         stage/


      royaldesign/
         prod/
         stage/
```
for each domain there is a corresponding .env file in both `prod/` and `stage/`