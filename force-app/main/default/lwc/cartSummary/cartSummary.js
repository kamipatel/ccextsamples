import { LightningElement, wire, api } from 'lwc';

import { CartItemsAdapter, CartSummaryAdapter  } from 'commerce/cartApi';

export default class CartSummary extends LightningElement {

    @api cartSubTotal;
    @api cartPromotion;
    @api cartShipping;
    @api cartTax;
    @api cartTotal;
    @api cartOriginalTotal;
    @api cartId;
    
    @wire(CartSummaryAdapter)
    cartSummaryHandler(response) {
        if (response.data) {
            console.debug('cartSummaryHandler=' + JSON.stringify(response.data));
            this.cartId = response.data.cartId;
        }
    }
    
    @wire(CartItemsAdapter)
    cartItemsHandler(response) {
        if (response.data) {
            console.debug('cartItemsHandler=' +JSON.stringify(response.data));
            this.cartId = response.data.cartId;
        }
    }

}