function listings (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const inputPrice = itemPrice.value;

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = (Math.floor(inputPrice * 0.1));

    const profit = document.getElementById("profit");
    const salesCommission = inputPrice * 0.1
    console.log(salesCommission)
    profit.innerHTML = (Math.floor(inputPrice - salesCommission));
  });
}
window.addEventListener('load', listings);
