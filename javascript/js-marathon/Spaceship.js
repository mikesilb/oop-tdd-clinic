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
};

module.exports = Spaceship;
