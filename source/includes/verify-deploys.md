# Verify deploys

Is a very simple bash script that pings all the production enviroment swap slots.
Essentially you run it when your are deploying something new to production the build has been completed and azure devops is ready to swap slots.

This script checks the pre-production enviroment
```shell
❯ ./verify-all-deploys.sh
Which site group do you want to test?
         1) Royaldesign
         2) Rum21
         3) Both
         4) Exit                ...
```