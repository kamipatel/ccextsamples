public with sharing class PromoDemoCalculator extends CartExtension.PromotionsCartCalculator {

    public static final String DUMMY_PROMOTION_ID = '0c81Q0000004G11QAE'; // CHANGEME
    
    
    public virtual override void calculate(CartExtension.CartCalculateCalculatorRequest request) {
    
        System.debug('In promo calculate request=' + request);
    
        CartExtension.Cart cart = request.getCart();
        resetAllAdjustments(cart);
        System.debug('In promo calculate resetAllAdjustments done');
        applyAdjustments(cart);
        System.debug('In promo calculate applyAdjustments done');
    }
        
    public static void resetAllAdjustments(CartExtension.Cart cart) {
        // remove all cart-level adjustments
        Iterator<CartExtension.CartAdjustmentGroup> cagIter = cart.getCartAdjustmentGroups().iterator();
    
        List<CartExtension.CartAdjustmentGroup> cagToRemove= new List<CartExtension.CartAdjustmentGroup>();
        while(cagIter.hasNext()) {
            cagToRemove.add(cagIter.next());
        }
    
        // remove CartItemAdjustments
        for(CartExtension.CartAdjustmentGroup cag : cagToRemove) {
            cart.getCartAdjustmentGroups().remove(cag);
        }
    
        // remove all cart-item level adjustments
        Iterator<CartExtension.CartItem> ciIter = cart.getCartItems().iterator();
        while(ciIter.hasNext()) {
            CartExtension.CartItem ci = ciIter.next(); // for every cart item, cursor through adjustments
            CartExtension.CartItemPriceAdjustmentList ciaIter = ci.getCartItemPriceAdjustments();
            List<CartExtension.CartItemPriceAdjustment> ciaToRemove= new List<CartExtension.CartItemPriceAdjustment>();
            while(ciaIter.iterator().hasNext()) { // for every adjustment, look for a matching external adjustment
                ciaToRemove.add(ciaIter.iterator().next());
            }
    
            for(CartExtension.CartItemPriceAdjustment cia : ciaToRemove) {
                ci.getCartItemPriceAdjustments().remove(cia);
            }
        }
    
        // remove promotion cart validation output
        Iterator<CartExtension.CartValidationOutput> cvoIter = cart.getCartValidationOutputs().iterator();
    
        List<CartExtension.CartValidationOutput> cvoToRemove = new List<CartExtension.CartValidationOutput>();
        while(cvoIter.hasNext()) {
            cvoToRemove.add(cvoIter.next());
        }
    
        for(CartExtension.CartValidationOutput cvo : cvoToRemove) {
            if (CartExtension.CartValidationOutputTypeEnum.PROMOTIONS == cvo.getType()) {
                cart.getCartValidationOutputs().remove(cvo);
            }
        }
    
    }
    
    public static void applyAdjustments(CartExtension.Cart cart) {
    
    try{
    
        Integer cartsize = cart.getCartItems().size();
        System.debug('In promo calculate applyAdjustments cart size=' + cartsize);
        
        // apply flat 5% discount across all cart items
        Iterator<CartExtension.CartItem> ciIter = cart.getCartItems().iterator();
    
        Decimal pctDiscount = -20;
    
        for ( Integer i = 0; i < cartsize; i++) {
    
            CartExtension.CartItem ci = cart.getCartItems().get(i);
        
            System.debug('In promo calculate applyAdjustments cart ci=' + ci);
            
            Decimal promotionAdjustment = (ci.getSalesPrice() * (pctDiscount/100) * ci.getQuantity());
        
            promotionAdjustment = promotionAdjustment.setScale(2,System.RoundingMode.HALF_DOWN); // currency precision & rounding
        
            System.debug('In promo calculate promotionAdjustment =' + promotionAdjustment);
            
            CartExtension.CartItemPriceAdjustment cia = new CartExtension.CartItemPriceAdjustment(CartExtension.CartAdjustmentTargetTypeEnum.ITEM // AdjustmentTargetType
            ,promotionAdjustment // TotalAmount
            ,CartExtension.PriceAdjustmentSourceEnum.PROMOTION // AdjustmentSource
            ,CartExtension.AdjustmentTypeEnum.ADJUSTMENT_PERCENTAGE // AdjustmentType
            ,pctDiscount // AdjustmentValue
            ,DUMMY_PROMOTION_ID); // PriceAdjustmentCauseId
        
            // Order of how adjustments are applied 
            //cia.setPriority(1);
            cia.setAdjustmentAmountScope(CartExtension.AdjustmentAmountScopeEnum.TOTAL);
            cia.setDescription('PromoDemoCartCalculator');
        
           System.debug('In promo calculate applyAdjustments before add');
           
            ci.getCartItemPriceAdjustments().add(cia);
        
               System.debug('In promo calculate applyAdjustments done');
    
          }

        }
        catch(Exception e){
            System.debug('In promo calculate applyAdjustments exception=' + e.getMessage());
        }
            
    }
    
    }