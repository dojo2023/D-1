'use strict'

const form = document.getElementById("form");
const button = document.getElementById("button");

form.addEventListener("input", update);
form.addEventListener("change", update);

function update() {
    const isRequired = form.checkValidity();

    if (isRequired) {
      button.disabled = false;
      button.style.opacity = 1;
      button.style.cursor = "pointer";
      return;
    }
  }