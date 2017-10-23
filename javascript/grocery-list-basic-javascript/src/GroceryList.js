// For Exceeds Expectations Only
class GroceryList{
  constructor(name, groceryItemArr){
    this.name = name;
    this.groceryItemArr = groceryItemArr;
  }
  checkInventory(bodegasInventory) {
    let anythingmissing = false;
    this.groceryItemArr.forEach((item => {
      let theItem = item.name;
      for (let key in bodegasInventory) {
          if (bodegasInventory.hasOwnProperty(key)) {
              if (theItem == key) {
                  if (item.quantity > bodegasInventory[key]) {
                    anythingmissing = true;
                    console.log("Sorry the bodega doesn't have enough of the following:");
                    console.log(theItem);
                  }
              }
          }
      }
    }));
    if (anythingmissing === true) {
      console.log("You'll have to go someplace else to get these.")
    }
    else {
      console.log("The bodega has it all! You can get everything on your list here")
    }
  }
}
