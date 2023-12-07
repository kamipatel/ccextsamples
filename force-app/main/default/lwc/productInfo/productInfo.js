import { LightningElement, api, wire, track} from 'lwc';


export default class ProductInfo extends LightningElement {

@api productId;
@api productCode;
@api productDetails;

get productDetailCode() {
  return this.productDetails?.fields?.ProductCode;
}

}