import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="link-shortener"
export default class extends Controller {
  connect() {
    const form = document.getElementById("linkShorterForm");
    console.log('form: ', form);

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
        alert("successfully created Link shortener");
      } else {
        alert(data.error || "Submission failed");
      }
    });
  }
}
