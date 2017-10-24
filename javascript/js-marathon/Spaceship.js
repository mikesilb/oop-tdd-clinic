let Spaceship = class Spaceship {
  constructor(name, crew = [], propulsion){
    this.name = name;
    this.crew = crew;
    this.propulsion = propulsion;
  }
  loadCrew(crewMemberArr){
    crewMemberArr.forEach((crewMember => {
      this.crew.push(crewMember);
      console.log(`${crewMember} has boarded the ship`);
    }));
  }
  captain(){
    let number = this.crew.length;
    let randomNumber = Math.floor(Math.random() * number);
    console.log(`The captain of ${this.name} is ${this.crew[randomNumber]}`);
  }
  mountPropulsion(theRocket){
    this.propulsion = theRocket;
    console.log(`The propulsion has mounted!`);
  }
  takeoff(){
    console.log('\n\n\nAttempting to takeoff')
    this.propulsion.fire();
  }
};

module.exports = Spaceship;
