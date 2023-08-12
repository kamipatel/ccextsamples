sfdc commands
====================
export SFDX_NPM_REGISTRY=
sfdx config:set org-api-version=58.0

kamlesh.patel-6rey@force.com


## Register extenstions
=======================
# List
Commerce_Domain_Cart_Summary
Commerce_Domain_Tax_CartCalculator
Commerce_Domain_Shipping_CartCalculator
Commerce_Domain_Pricing_Service
Commerce_Domain_Promotions_CartCalculator
Commerce_Domain_Inventory_CartCalculator
COMMERCE_DOMAIN_INVENTORY_SERVICE
protected static final String COMMERCE_DOMAIN_INVENTORY_SERVICE_EPN = “Commerce_Domain_Inventory_Service”
Commerce_Domain_Pricing_CartCalculator 

# Get Apex classes
sfdx force:data:soql:query -q "SELECT Id,Name FROM ApexClass ORDER BY CreatedDate DESC"

# Register Payment gateway
sfdx force:data:record:create -s PaymentGatewayProvider -v "ApexAdapterID=01pB00000065Ss1IAE DeveloperName=SalesforceAdapter MasterLabel=SalesforceAdapter IdempotencySupported=Yes"

# Lists extensions
sfdx commerce:extension:points:list -u kamlesh.patel-6rey@force.com

# Register
sfdx commerce:extension:register -u kamlesh.patel-6rey@force.com -e Commerce_Domain_Pricing_Service -a PricingServiceSample -r PricingServiceSample

sfdx commerce:extension:register -u kamlesh.patel-6rey@force.com -e Commerce_Domain_Inventory_Service -a CommerceInvServiceSample -r KamInventoryService

sfdx commerce:extension:register -u kamlesh.patel-6rey@force.com -e Commerce_Domain_Inventory_CartCalculator -a CommerceInventoryCalculator -r KamInventoryCalculator


# Map 
sfdx commerce:extension:map -u kamlesh.patel-6rey@force.com --registered-extension-name KamInventoryService -n ev1
sfdx commerce:extension:map -u kamlesh.patel-6rey@force.com --registered-extension-name KamInventoryCalculator -n ev1
sfdx commerce:extension:map -u kamlesh.patel-6rey@force.com --registered-extension-name PricingServiceSample -n ev1


# Unmap
Commerce_Domain_Pricing_Service
sfdx commerce:extension:unmap -u kamlesh.patel-6rey@force.com --registered-extension-name Commerce_Domain_Pricing_Service -n ev1
