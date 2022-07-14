import { Controller } from "@hotwired/stimulus"
export default class extends Controller {

  static targets = ["navstate", "iconOpen", "iconClose", "buttonContainer"]

  toggle(){
    let currentState = this.navstateTarget.dataset.show !== "off";
    if (currentState){
      this.navstateTarget.classList.remove("hide");
      this.iconOpenTarget.classList.add("hide");
      this.iconCloseTarget.classList.remove("hide");
      this.buttonContainerTarget.classList.add("is-open");
    }else{
      this.navstateTarget.classList.add("hide");
      this.iconOpenTarget.classList.remove("hide");
      this.iconCloseTarget.classList.add("hide");
      this.buttonContainerTarget.classList.remove("is-open");
    }
    currentState = !currentState
    if(currentState){
      this.navstateTarget.dataset.show = "on"
    }else{
      this.navstateTarget.dataset.show = "off"
    }
  }

}
