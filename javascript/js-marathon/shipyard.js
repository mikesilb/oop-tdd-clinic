// YOUR CODE GOES HERE
let Spaceship = require('./Spaceship');
let CrewMember = require('./Crewmember');
let Rocket = require('./Rocket');
let launchpad = (nameOfShip, listofCrew, addRocketFuel) => {
  console.log("Getting ready to launch!");
  console.log("The name of the ship is " + nameOfShip.name);
  nameOfShip.loadCrew;
  nameOfShip.captain();
  nameOfShip.mountPropulsion(rocket);
  nameOfShip.takeoff();
  nameOfShip.propulsion.addFuel(addRocketFuel);
  nameOfShip.takeoff();
};

let trainCrew = (nameArr) => {
  allCrewMembers = [];

  nameArr.forEach((name => {
    let theName = new CrewMember(name, true);
    allCrewMembers.push(theName);
  }));
  return allCrewMembers;
};

let crewNames = ["Jack", "Jim", "Mike", "Stephanie", "Florence", "Alice" ];
let ourShip = new Spaceship('JAVASHIPT');
let rocket = new Rocket();

launchpad(ourShip, crewNames, 500);
trainCrew(crewNames);
