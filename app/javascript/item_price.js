window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const priceTax = document.getElementById("add-tax-price");
  const priceProfit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = Math.floor(inputValue * 0.1);
    const profitDom = Math.floor(inputValue - addTaxDom);

    if (addTaxDom < 1) {
      priceTax.innerHTML = 0;
    } else {
      priceTax.innerHTML = addTaxDom;
    }

    if (profitDom < 1) {
      priceProfit.innerHTML = 0;
    } else {
      priceProfit.innerHTML = profitDom;
    }

  })
});