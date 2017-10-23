// Meets Expectations
let bestieGroceryItems = [new GroceryItem("apple", .50, 5), new GroceryItem("avocado", 2.00, 2), new GroceryItem("beer", 2.50, 4), new GroceryItem("kale", 2.00) ];
let bestiesList = new GroceryList("Bestie", bestieGroceryItems);

summary = (GroceryItems) => {
  let sum = 0;
  let output = "Dear Bestie, \n\n";
  output += "I bought you: \n\n";

  GroceryItems.forEach((item => {
    let product = item.price * item.quantity;
    output += item.quantity + " " + item.name + "s" + " - " + "$" + product.toFixed(2) + "\n";
    sum += product;
  }));

  output += "\n\nYou owe me " + sum.toFixed(2)+".";

  return output;
};

console.log(summary(bestieGroceryItems));



// Exceeds Expectations
let inventoryNearMe = {
  banana: 2,
  coffee: 2,
  kale: 5,
  chocolateBar: 5,
  apple: 10,
  potato: 11,
  tomato: 1,
  beer: 3,
  avocado: 1,
  milk: 5
};

let inventoryNearBestie = {
  banana: 2,
  coffee: 2,
  kale: 5,
  chocolateBar: 5,
  apple: 10,
  potato: 11,
  tomato: 1,
  beer: 6,
  avocado: 10,
  milk: 5
};

console.log("\n\nChecking the inventory of inventoryNearBestie");
bestiesList.checkInventory(inventoryNearBestie);
console.log("\n\nChecking the inventory of inventoryNearMe");
bestiesList.checkInventory(inventoryNearMe);
