(() => {
  let markdownInput = document.getElementById('markdown-input')
  let markdownRendered = document.getElementById('markdown-rendered')
  
  let updateRenderedMarkdown = (event) => {
    markdownRendered.innerHTML = markdownParser(event.target.value)
  }

  markdownInput.oninput = updateRenderedMarkdown
})()
