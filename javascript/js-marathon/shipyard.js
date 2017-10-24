// YOUR CODE GOES HERE
let Spaceship = require('./Spaceship');
let CrewMember = require('./Crewmember');
let launchpad = (nameOfShip, listofCrew) => {
  console.log("Getting ready to launch!");
  console.log("The name of the ship is " + nameOfShip.name);
  nameOfShip.loadCrew(crewNames);
  nameOfShip.captain();
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

launchpad(ourShip);
trainCrew(crewNames);
