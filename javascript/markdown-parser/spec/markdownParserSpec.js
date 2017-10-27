describe('markdownParser', () => {
  describe('italic text', () => {
    it('translates "_text_" to "<em>text</em>"', () => {
      let result = markdownParser('_text_')
      expect(result).toBe('<em>text</em>')
    })
    it('parses multiple italic phrases', () => {
      let text = "Writing _legible_ code is _difficult_."
      let result = markdownParser(text)
      expect(result).toMatch('<em>legible</em>')
      expect(result).toMatch('<em>difficult</em>')
    })
  })

  describe('bold text', () => {
    it('translates "**text**" to "<strong>text</strong>"', () => {
      let result = markdownParser('**text**')
      expect(result).toBe('<strong>text</strong>')
    })

    it('parses multiple bold phrases', () => {
      let text = "Writing **legible** code is **difficult**."
      let result = markdownParser(text)
      expect(result).toMatch('<strong>legible</strong>')
      expect(result).toMatch('<strong>difficult</strong>')
    })
  })

  describe('headings', () => {
    it('translates "#text#" to "<h1>text</h1>"', () => {
      let resulth1 = markdownParser('#text#')
      expect(resulth1).toBe('<h1>text</h1>')
    })

    it('translates "##text##" to "<h2>text</h2>"', () => {
      let resulth2 = markdownParser('##text##')
      expect(resulth2).toBe('<h2>text</h2>')
    })

    it('parses multiple headliners', () => {
      let text1 = "Writing #legible# code is #difficult#."
      let text2 = "Writing ##legible## code is ##difficult##."
      let result1 = markdownParser(text1)
      let result2 = markdownParser(text2)
      expect(result1).toMatch('<h1>legible</h1>')
      expect(result1).toMatch('<h1>difficult</h1>')
      expect(result2).toMatch('<h2>legible</h2>')
      expect(result2).toMatch('<h2>difficult</h2>')

    })

  })

})
