let Spaceship = class Spaceship {
  constructor(name, crew = []){
    this.name = name;
    this.crew = crew;
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
};

module.exports = Spaceship;
