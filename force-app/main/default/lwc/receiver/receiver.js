import { LightningElement, wire, track } from "lwc";
import { CurrentPageReference } from "lightning/navigation";

export default class receiver extends LightningElement { 
  @track displayValue;
  @wire(CurrentPageReference)

  getStateParameters(currentPageReference) {   
    console.debug("Receiver getStateParameters calleds");
    if (currentPageReference) {
      
      var vSSENCTargetURL = "https://www.google.com";

      sessionStorage.setItem('SSENCTargetURL',vSSENCTargetURL);
      this.displayValue =  `TargetURL : ${sessionStorage.getItem('SSENCTargetURL')}`;  

      console.debug("Receiver getStateParameters done");
    }
  }
}