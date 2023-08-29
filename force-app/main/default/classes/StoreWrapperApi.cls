public with sharing class StoreWrapperApi {
    public StoreWrapperApi() {
    }

    @AuraEnabled(cacheable=false)
    public static void updateCart(String cartId, String status) { 
        try{
        
            System.debug('updateCart called, cartId=' + cartId);
            
            WebCart c = [select Id, Status from WebCart where Id=: cartId];
            c.status = status;
            update c;
            
        }catch (Exception e){
            System.debug('updateCart error=' + e.getMessage());
        }
    }
}