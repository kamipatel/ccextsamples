public with sharing class PromoDemoCalculator extends CartExtension.PromotionsCartCalculator {

public static final String DUMMY_PROMOTION_ID = '01tB0000003ojZkIAI'; // CHANGEME

/*
public override void calculate(CartExtension.CartCalculationRequest request) {
    CartExtension.Cart cart = request.getCart();
    resetAllAdjustments(cart);
    applyAdjustments(cart);
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
        Iterator<CartExtension.CartItemAdjustment> ciaIter = ci.getCartItemAdjustments().iterator();
        List<CartExtension.CartItemAdjustment> ciaToRemove= new List<CartExtension.CartItemAdjustment>();
        while(ciaIter.hasNext()) { // for every adjustment, look for a matching external adjustment
            ciaToRemove.add(ciaIter.next());
        }

        for(CartExtension.CartItemAdjustment cia : ciaToRemove) {
            ci.getCartItemAdjustments().remove(cia);
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
    // apply flat 5% discount across all cart items
    Iterator<CartExtension.CartItem> ciIter = cart.getCartItems().iterator();

    Decimal pctDiscount = -5;

    while(ciIter.hasNext()) {

        CartExtension.CartItem ci = ciIter.next();

        Decimal promotionAdjustment = (ci.getSalesPrice() * (pctDiscount/100) * ci.getQuantity());

        promotionAdjustment = promotionAdjustment.setScale(2,System.RoundingMode.HALF_DOWN); // currency precision & rounding

        CartExtension.CartItemAdjustment cia = new CartExtension.CartItemAdjustment(CartExtension.CartAdjustmentTargetTypeEnum.ITEM // AdjustmentTargetType
        ,promotionAdjustment // TotalAmount
        ,CartExtension.PriceAdjustmentSourceEnum.PROMOTION // AdjustmentSource
        ,CartExtension.AdjustmentTypeEnum.ADJUSTMENT_PERCENTAGE // AdjustmentType
        ,pctDiscount // AdjustmentValue
        ,DUMMY_PROMOTION_ID); // PriceAdjustmentCauseId

        // Order of how adjustments are applied 
        cia.setPriority('1');
        cia.setAdjustmentAmountScope(CartExtension.AdjustmentAmountScopeEnum.TOTAL);
        cia.setDescription('PromoDemoCartCalculator');

        ci.getCartItemAdjustments().add(cia);
    }
}
*/
}