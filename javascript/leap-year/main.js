class Year {
  constructor(theYear) {
    this.theYear = theYear;
  }
  isLeapYear() {
    if (this.theYear % 4 !== 0) {
      return false;
    }
    else if (this.theYear % 100 !== 0) {
      return true;
    }
    else if (this.theYear % 400 !== 0) {
      return false;
    }
    else {
      return true;
    }
  }
}

let allYears = [];
let allLeapYears = [];

for (x=2000 ; x < 2101 ; x++) {
  allYears.push(new Year(x));
}

let element = document.getElementById("main");
allYears.forEach((Year => {
  if (Year.isLeapYear()) {
    allLeapYears.push(Year);
    element.innerHTML += Year.theYear + "\t" ;
  }
}));
