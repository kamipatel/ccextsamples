public with sharing class StoreWrapperApi {
    public StoreWrapperApi() {
    }

    @AuraEnabled(cacheable=true)
    public static void updateCart(String cartId, String status) { 
    
        WebCart c = [select Id, Status from WebCart where Id=: cartId];
        c.status = 'Closed';
        update c;
    }
}
