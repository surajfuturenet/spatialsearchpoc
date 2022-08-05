import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {
  connect() {
  }

  search(e) {
  	//console.log(e);
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
    	const conservationsearch = document.getElementById("conservationsearch");
    	//console.log(conservationsearch);
    	if(conservationsearch != undefined)
    	{
    		conservationsearch.click();
    	}
      //this.element.requestSubmit()

    }, 500)
  }

}
