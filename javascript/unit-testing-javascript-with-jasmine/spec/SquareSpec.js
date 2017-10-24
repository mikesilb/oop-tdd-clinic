describe("Square", () => {
  describe("new Square()", () => {
    it("takes a value for the length of a side", () => {
      let square = new Square(5)
      expect(square).toBeDefined()
    })

    it("takes optional values for the center point", () => {
      let square = new Square(5, 1, 2)
      expect(square).toBeDefined()
      expect(square.x).toEqual(1)
      expect(square.y).toEqual(2)
    })

    it("defaults to the origin point", () => {
      let square = new Square(5)
      expect(square.x).toEqual(0)
      expect(square.y).toEqual(0)
    })
  })

  describe("#length", () => {
    it("returns the value of the length of the square", () => {
      let square = new Square(5)
      expect(square.length).toEqual(5)
    })
  })

  describe("#width", () => {
    it("returns the value of the width of the square", () => {
      let square = new Square(5)
      expect(square.width).toEqual(5)
    })
  })

  describe(".diameter()", () => {
    it("returns the length of the diameter (or diagonal)", () => {
      let square = new Square(5)
      expect(square.diameter()).toBeCloseTo(7.071)
    })
  })

  describe(".perimeter()", () => {
    it("returns the sum of the four sides", () => {
      let square = new Square(5)
      expect(square.perimeter()).toEqual(20)
    })
  })

  describe(".area()", () => {
    it("returns 25 when the side is 5", () => {
      let square = new Square(5)
      expect(square.area()).toEqual(25)
    })

    it("returns 100 when the side is 10", () => {
      let square = new Square(10)
      expect(square.area()).toEqual(100)
    })
  })

  describe(".containsPoint()", () => {
    it("returns true for a point within the square", () => {
      let square = new Square(1)
      expect(square.containsPoint(0, 0)).toBe(true)
    })

    it("returns true for a point on the edge of a square", () => {
      let square = new Square(1)
      expect(square.containsPoint(0.5, 0.5)).toBe(true)
    })

    it("returns false for points outside of the square", () => {
      let square = new Square(1)
      expect(square.containsPoint(4, 3)).toBe(false)
      expect(square.containsPoint(1, 0)).toBe(false)
      expect(square.containsPoint(0, -1)).toBe(false)
      expect(square.containsPoint(-1, 0)).toBe(false)
      expect(square.containsPoint(0, 1)).toBe(false)
      expect(square.containsPoint(1, 1)).toBe(false)
      expect(square.containsPoint(1, -1)).toBe(false)
      expect(square.containsPoint(-1, -1)).toBe(false)
      expect(square.containsPoint(-1, 1)).toBe(false)
    })
  })
})
