import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="link-shortener"
export default class extends Controller {
  static targets = ['lookupCode'];
  
  connect() {
    const form = document.getElementById("linkShorterForm");

    form.addEventListener("submit", async (e) => {
      e.preventDefault();
      const formData = new FormData(form);

      const response = await fetch(form.action, {
        method: "POST",
        body: formData,
        headers: {
          "Accept": "application/json"
        }
      });

      const data = await response.json();

      if (response.ok) {
        // console.log('data: ', data.lookup_code);
        this.lookupCodeTarget.textContent = data.shortened_url
        alert("successfully created Link shortener");
        form.reset();
      } else {
        alert(data.error || "Submission failed");
      }
    });
  }
}
