## Instructions

Your millennial bestie needs you to pick up some groceries. Let's create a program that will list what we need to pick up! Your bestie told you that you need **5 apples**, **2 avocados**, and **4 beers**, but they forgot to tell you how much **kale** to get. Each apple costs **$0.50**, each avocado costs **$2.00**, each beer cost **$2.50**, and each bunch of kale is **$2.00**.

### Getting Set Up

```no-highlight
$ et get grocery-list-basic-javascript
$ cd grocery-list-basic-javascript
```

Open the `index.html` file in your browser. In the browser, open up the JavaScript console. You will be saving your code in main.js and GroceryItem.js. Then, you can refresh the page in order to see your changes.

**Note:** Because we're running this in the javacsript console in Chrome, you do **not** need to add `module.exports = GroceryItem` or `require('./GroceryItem')`. We have required the appropriate files in the `index.html` file provided so that it works with the javascript console. If you choose to complete the Exceeds portion of this assignment, you will need to uncomment out line 15 from `index.html`.

## Meeting Expectations Requirements

* Create a `GroceryItem` class within the `src/GroceryItem.js` file.
* A new `GroceryItem` should take three arguments, the name of the item, the price of the item, and the quantity.
* If the quantity is omitted when creating a new `GroceryItem`, it should default to `1`.
* In `main.js` there is an **array** called `bestieGroceryItems` that contains 4 `GroceryItem` objects. In `main.js` create a `summary` function that takes 1 argument, an **array** of `GroceryItems`. When you call `console.log(summary(bestieGroceryItems));` your function should print out the following to the console exactly:

```no-highlight
Dear Bestie,

I bought you:

5 apples - $2.50
2 avocados - $4.00
4 beers - $10.00
1 kale - $2.00

You owe me $18.50.
```

### Tips

* Focus on meeting one requirement at a time.
* Use the JavaScript console in your browser and `console.log` statements to
  troubleshoot your code.
* **DO NOT** start the requirements necessary to Exceed Expectations until you
  have completed the requirements necessary to Meet Expectations.

## Exceeding Expectations Requirements

Extract the logic for handling "Grocery Lists" into its own class.

Your app must satisfy the following requirements:

* In the `src` directory you'll find a `GroceryList.js` file.
* In `GroceryList.js` create a `GroceryList` class that takes 2 arguments, the `name` of the person the list belongs to, and an array of `GroceryItem`s. Like so:
```javascript
let bestieGroceryItems = [new GroceryItem("apple", .50, 5), new GroceryItem("avocado", 2.00, 2), new GroceryItem("beer", 2.50, 4), new GroceryItem("kale", 2.00) ]
let bestiesList = new GroceryList("Bestie", bestieGroceryItems)
```
* In the `main.js` under the Exceeds Expectations section there are 2 inventory objects, each with a list of the groceries available at local bodegas, the bodega located near you and the bodega near your bestie.
* In your `GroceryList` class, create a `checkInventory` method that checks to see if your local bodega has enough of each `GroceryItem` on a `GroceryList` for you to get everything on your list. Your `checkInventory` method should take 1 argument, an object literal that contains the inventory of whichever bodega you are planning to go to.
```javascript
bestiesList.checkInventory(inventoryNearBestie)
bestiesList.checkInventory(inventoryNearMe)
```
* If the bodega has enough of everything on the list, your method should print out the following in the console:
```no-highlight
The bodega has it all! You can get everything on your list here
```
* If the bodega doesn't have enough of everything on the list, your method should print out a message that tells you what items the bodega doesn't have enough of in the console like so:
```no-highlight
Sorry the bodega doesn't have enough of the following:
  - beer
  - avocado
You'll have to go someplace else to get these.
```
* In `main.js` create a `GroceryList` object called `bestiesList` using the list of groceries your bestie gave you and use the `checkInventory` method you created to see if everything on the list is available at both bodegas so that you can decide which bodega to shop at.
