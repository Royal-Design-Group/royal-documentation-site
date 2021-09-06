# Verify deploys

Is a very simple bash script that pings all the production enviroment swap slots.
Essentially you run it when your are deploying something new to production the build has been completed and azure devops is ready to swap slots.

This script checks the pre-production enviroment

You can get the script here:
[royal scripts repository](https://github.com/Royal-Design-Group/royal-scripts/tree/master/Local/verify-deploys)

then you run the script when your production release is done in the phase "stage" but has not yet been approved for release to production deployment.

```shell
❯ ./verify-all-deploys.sh
Which site group do you want to test?
         1) Royaldesign
         2) Rum21
         3) Both
         4) Exit                
         # Where you select 1, 2 or 3
```


