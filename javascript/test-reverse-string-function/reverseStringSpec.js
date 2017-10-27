describe('reverseString', () => {
  // your tests, here
  it("takes an empty string and returns it", () => {
      let emptystring = '';
      expect(reverseString(emptystring)).toBe('');
    });
  it("takes a string of a single letter and returns it", () => {
      let singlestring = 'a';
      expect(reverseString(singlestring)).toBe('a');
    });
  it("takes a string of one word and reverses it", () => {
      let word1 = 'testing';
      let word2 = 'ghost';
      expect(reverseString(word1)).not.toBe('testing');
      expect(reverseString(word1)).toBe('gnitset');
      expect(reverseString(word2)).not.toBe('ghost');
      expect(reverseString(word2)).toBe('tsohg');

    });
  it("takes a string of two words and reverses it", () => {
      let phrase = 'Hey you';
      expect(reverseString(phrase)).not.toBe('Hey you');
      expect(reverseString(phrase)).toBe('uoy yeH');
    });
  it("includes punctuation and number", () => {
      let punct = '()*34;& []<7';
      expect(reverseString(punct)).not.toBe('()*34;& []<7');
      expect(reverseString(punct)).toBe('7<][ &;43*)(');
    });
});
