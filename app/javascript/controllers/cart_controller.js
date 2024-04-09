import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {

    console.log("cart controller initialized")
    const cart = JSON.parse(localStorage.getItem("cart"))
    if (!cart) {
      return
    }

    let total = 0
    for (let i=0; i < cart.length; i++) {
      const item = cart[i]
      total += item.price * item.quantity
      const div = document.createElement("div")
      div.classList.add("mt-2")
      div.innerText = `Item: ${item.name} - $${item.price} - Size: ${item.size} - Quantity: ${item.quantity}`
      const deleteButton = document.createElement("button")
      deleteButton.innerText = "Remove from Cart"
      console.log("item.id: ", item.id)
      deleteButton.value = JSON.stringify({id: item.id, size: item.size})
      deleteButton.classList.add("bg-gray-500", "rounded", "text-white", "px-2", "py-1", "ml-2", "hover:bg-red-600", "focus:outline-none", "focus:ring-2", "focus:ring-gray-500", "focus:ring-opacity-50")
      deleteButton.addEventListener("click", this.removeFromCart)
      div.appendChild(deleteButton)
      this.element.prepend(div)
    }

    const totalEl = document.createElement("div")
    totalEl.innerText= `Total: $${total/100.0}`
    let totalContainer = document.getElementById("total")
    totalContainer.appendChild(totalEl)
  }
  clear() {
    localStorage.removeItem("cart")
    window.location.reload()
  }
  removeFromCart(e) {
    const cart = JSON.parse(localStorage.getItem("cart"))
    const id = e.target.value
    const index = cart.findIndex(item => item.id === id)
    cart.splice(index, 1)
    localStorage.setItem("cart", JSON.stringify(cart))
    window.location.reload()
  }
  checkout() {
    console.log("checkout")
    const cart = JSON.parse(localStorage.getItem("cart"))
    const payload = {
      authenticity_token: "",
      cart: cart
    }
    const scrfToken = document.querySelector("[name='csrf-token']").content
    fetch ("/checkout", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": scrfToken
      },
      body: JSON.stringify(payload)
      }).then((response) => {
      if (response.ok) {
        window.location.href = body.url
      }
      else {
        const errorEl = document.createElement("div")
        errorEl.innerText = `There was an error processing your order. ${body.error}`
        let errorContainer = document.getElementById("errorContainer")
        errorContainer.appendChild(errorEl)
      }
    })
  }
}
