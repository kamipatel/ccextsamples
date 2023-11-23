

sfdx org login web -d -a "mydevhub"
sf config set target-dev-hub=dev1@kam.cc1

## Create scratch org with commerce features
sfdx commerce:scratchorg:create -u mystore1@app.demo -a "demoapp" -v dev1@kam.cc1 -w 30 --json

## Open the scartch org
sfdx org open --target-org demoapp

## Create a commerce storefront with products, cms etc
sfdx commerce:store:create -n ev1 -o b2c -b john@johndoe.edu -u mystore1@app.demo -v dev1@kam.cc1

## push the source
sfdx force:source:push -o "demoapp"