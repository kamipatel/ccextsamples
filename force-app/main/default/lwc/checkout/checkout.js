import { LightningElement, wire, api, track } from 'lwc';
import { CartItemsAdapter, CartSummaryAdapter  } from 'commerce/cartApi';
import updateCart from '@salesforce/apex/StoreWrapperApi.updateCart';
import { NavigationMixin } from "lightning/navigation";

export default class checkout extends NavigationMixin(LightningElement){
    @track cartId;       
    @track varSSENCTargetURL;       
    @wire(CartSummaryAdapter)
    
    cartSummaryHandler(response) {
        if (response.data) {
            console.debug('cartSummaryHandler=' + JSON.stringify(response.data));
            console.debug('cartId=' + response.data.cartId);
            
            //this.cartId = response.data.cartId;
            this.cartId = response.data.cartId;
            console.debug('cartSummaryHandler= cartId updated');
        }
    }
    
    handleClick(event) {
        console.debug('handleClick called this.cartId=' + this.cartId);
        console.debug('Target URL =' + sessionStorage.getItem('SSENCTargetURL'));
        this.varSSENCTargetURL = sessionStorage.getItem('SSENCTargetURL');
        var newstatus = 'Closed';
        
        /*
        updateCart({cartId:this.cartId, status:newstatus})
        .then(result =>{
            console.debug('updateCart3.1 success');
            console.debug('updateCart3.1 success, result=' + result);
            const config = {
                type: 'standard__webPage',
                attributes: {
                    url: `${sessionStorage.getItem('SSENCTargetURL')}`
                }
            };
            this[NavigationMixin.Navigate](config);                   
        })
        .catch(error =>{
            this.errorMsg = error;
            console.debug('updateCart error=' + error);
        })
        */
    }
}