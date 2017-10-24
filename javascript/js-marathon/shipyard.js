// YOUR CODE GOES HERE
let Spaceship = require('./Spaceship');
let CrewMember = require('./Crewmember');
let Rocket = require('./Rocket');
let launchpad = (nameOfShip, listofCrew, addRocketFuel) => {
  console.log("Getting ready to launch!");
  console.log("The name of the ship is " + nameOfShip.name);
  nameOfShip.loadCrew(crewNames);
  nameOfShip.captain();
  nameOfShip.mountPropulsion(rocket);
  countdown(10);
  let intervalID1 = setTimeout(() => {
    nameOfShip.takeoff();
  }, 13000);
  let intervalID2 = setTimeout(() => {
    nameOfShip.propulsion.addFuel(addRocketFuel);
  }, 17000);
  let intervalID3 = setTimeout(() => {
    countdown(10);
  }, 19000);
  let intervalID4 = setTimeout(() => {
    nameOfShip.takeoff();
  }, 31000);
};


let trainCrew = (nameArr) => {
  allCrewMembers = [];

  nameArr.forEach((name => {
    let theName = new CrewMember(name, true);
    allCrewMembers.push(theName);
  }));
  return allCrewMembers;
};

let countdown = (seconds, fn) => {
  let interval1 = setTimeout(() => {
    if (seconds===0) {
    console.log('BLAST OFF');
    }
  else {
    console.log(seconds);
    countdown(seconds - 1);
    }
  }, 1000);

};




let crewNames = ["Jack", "Jim", "Mike", "Stephanie", "Florence", "Alice" ];
let ourShip = new Spaceship('JAVASHIPT');
let rocket = new Rocket();

launchpad(ourShip, crewNames, 500);
trainCrew(crewNames);
