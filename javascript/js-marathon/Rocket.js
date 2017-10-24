let Rocket = class Rocket {
  constructor(fuel = 0) {
    this.fuel = fuel;
  }
  addFuel(amountToAdd){
    this.fuel += amountToAdd;
    console.log(`The rocket now has ${this.fuel} fuel.`);
  }
  fire(){
    if (this.fuel > 0) {
      this.fuel -= 1;
      console.log('POWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW');
      return true;
    }
    else {
      console.log('The rocket engines failed to fire');
      return false;
    }
  }
};

module.exports = Rocket;
