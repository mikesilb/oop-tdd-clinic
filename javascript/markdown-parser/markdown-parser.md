### Introduction

**Markdown** is a plain-text document format that can be translated into HTML.
By following some simple rules, we can write a document in a text editor, and
then, run that document through a **parser** to create HTML.

| Plain-text Markdown         | HTML                      |
| --------------------------- | ------------------------- |
| `*italic text*`             | *italic text*             |
| `**bold text**`             | **bold text**             |
| `[Link](http://google.com)` | [Link](http://google.com) |

To familiarize yourself with Markdown syntax, work through the following short
[tutorial](http://commonmark.org/help/tutorial/).

In this challenge, you will create a **Markdown Parser**, which will take
plain-text and convert it to HTML.

### Getting Started

```no-highlight
$ et get markdown-parser
$ cd markdown-parser
$ open index.html
```

Some tests and code have been written to get you started. `open specRunner.html`
to see the results of the existing test suite.

### Instructions

Write code and tests for each of the following markdown rules.

* Single underscores `_` around a phrase should result in emphasis tags:  `_phrase_` translates to `<em>phrase</em>`.
* Double asterisks `**` around a phrase should result in strong tags: `**phrase**` translates to `<strong>phrase</strong>`. (This has been completed for you.)
* A single pound-sign (or octothorp, or hashtag) `#` at the start of a line will result in a heading tag: `# Title` translates to `<h1>Title</h1>`.
* Two pound-signs `#` at the start of a line will result in a heading tag: `## Title` translates to `<h2>Title</h2>`.

**Note:** It is not necessary to implement full markdown support! However, if
you would enjoy the challenge of implementing full markdown support, go for it!

A full list of all markdown symbols can be found, [here](http://commonmark.org/help/).

### Resources

* [Markdown - Wikipedia](https://en.wikipedia.org/wiki/Markdown)
* [CommonMark Specification](http://commonmark.org/help/)
