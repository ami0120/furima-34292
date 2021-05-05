function calc (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup",()=>{
    tax = parseInt(itemPrice.value * 0.1);
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML = `${tax}円`

    prof = (itemPrice.value) - (tax)
    const priceContent = document.getElementById("profit");
    priceContent.innerHTML = prof
  })
}

window.addEventListener('load',calc);
