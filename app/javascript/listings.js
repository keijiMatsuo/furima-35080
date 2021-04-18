function listings (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const inputPrice = itemPrice.value;
    console.log(inputPrice);

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = (Math.floor(inputPrice * 0.1));
    console.log(addTaxPrice);

    const profit = document.getElementById("profit");
    const salesCommission = inputPrice * 0.1
    console.log(salesCommission)
    profit.innerHTML = (Math.floor(inputPrice - salesCommission));
    console.log(profit);
  });
}
window.addEventListener('load', listings);
