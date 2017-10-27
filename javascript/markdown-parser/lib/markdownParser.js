var markdownParser = (text) => {
  let result1 = parseHeadlineH2(text)
  let result2 = parseDoubleAsterisk(result1)
  let result3 = parseUnderscore(result2)
  let result4 = parseHeadlineH1(result3)
  // your code, here
  return result4
}

let parseDoubleAsterisk = (text) => {
  let marker = '**'
  let markersEncountered = 0
  let locationOfMarker = text.indexOf(marker)

  while(locationOfMarker >= 0) {
    markersEncountered++
    let textBeforeMarker = text.substring(0, locationOfMarker)
    let textAfterMarker = text.substring(locationOfMarker + marker.length, text.length)
    let tag = markersEncountered % 2 === 0 ? '</strong>' : '<strong>'
    text = `${textBeforeMarker}${tag}${textAfterMarker}`
    locationOfMarker = text.indexOf(marker)
  }

  return text
}

let parseUnderscore = (text) => {
  let marker = '_'
  let markersEncountered = 0
  let locationOfMarker = text.indexOf(marker)

  while(locationOfMarker >= 0) {
    markersEncountered++
    let textBeforeMarker = text.substring(0, locationOfMarker)
    let textAfterMarker = text.substring(locationOfMarker + marker.length, text.length)
    let tag = markersEncountered % 2 === 0 ? '</em>' : '<em>'
    text = `${textBeforeMarker}${tag}${textAfterMarker}`
    locationOfMarker = text.indexOf(marker)
  }

  return text
}

let parseHeadlineH1 = (text) => {
  let marker = '#'
  let markersEncountered = 0
  let locationOfMarker = text.indexOf(marker)

  while(locationOfMarker >= 0) {
    markersEncountered++
    let textBeforeMarker = text.substring(0, locationOfMarker)
    let textAfterMarker = text.substring(locationOfMarker + marker.length, text.length)
    let tag = markersEncountered % 2 === 0 ? '</h1>' : '<h1>'
    text = `${textBeforeMarker}${tag}${textAfterMarker}`
    locationOfMarker = text.indexOf(marker)
  }

  return text
}

let parseHeadlineH2 = (text) => {
  let marker = '##'
  let markersEncountered = 0
  let locationOfMarker = text.indexOf(marker)

  while(locationOfMarker >= 0) {
    markersEncountered++
    let textBeforeMarker = text.substring(0, locationOfMarker)
    let textAfterMarker = text.substring(locationOfMarker + marker.length, text.length)
    let tag = markersEncountered % 2 === 0 ? '</h2>' : '<h2>'
    text = `${textBeforeMarker}${tag}${textAfterMarker}`
    locationOfMarker = text.indexOf(marker)
  }

  return text
}
