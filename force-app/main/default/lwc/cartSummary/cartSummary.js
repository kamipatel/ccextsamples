import { LightningElement, wire, api, track } from 'lwc';

import { CartItemsAdapter, CartSummaryAdapter  } from 'commerce/cartApi';
import updateCart from '@salesforce/apex/StoreWrapperApi.updateCart';

export default class CartSummary extends LightningElement {

    @api cartSubTotal;
    @api cartPromotion;
    @api cartShipping;
    @api cartTax;
    @api cartTotal;
    @api cartOriginalTotal;
    
    @track cartId;
    
    
    @wire(CartSummaryAdapter)
    cartSummaryHandler(response) {
        if (response.data) {
            console.debug('cartSummaryHandler=' + JSON.stringify(response.data));
            console.debug('cartId=' + response.data.cartId);
            
            this.cartId = response.data.cartId;
            console.debug('cartSummaryHandler= cartId updated');
        }
    }
    
    handleClick(event) {
        console.debug('handleClick called this.cartId=' + this.cartId);
        var status = 'Closed';
        updateCart(this.cartId, status)
        .then(result =>{
            console.debug('updateCart success');;
        })
        .catch(error =>{
            this.errorMsg = error;
            console.debug('updateCart error=' + error);;
        })
    }

    /*
    @wire(CartItemsAdapter)
    cartItemsHandler(response) {
        if (response.data) {
            console.debug('cartItemsHandler=' +JSON.stringify(response.data));
            //this.cartId = response.data.cartId;
        }
    }
*/

}