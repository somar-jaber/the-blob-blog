---
layout: "base-layout.njk"
title: "Make static files accessible through URL in 11ty"
tags: ["ComputerScience"]
---

Eleventy allows only the default supported files to be copied to the output folder(by default it is "_site") the folder which will be
your website.

So by that the other static files like .txt , .css , .bat , etc will be ignored on the building process.
To make Eleventy allow them will use :
```js
// allowing unsupported formats to not make 11ty ignore them.
eleventyConfig.setTemplateFormats([
    "md",
    "pdf", // `pdf` is not a registered template syntax file extension
    "txt",
]);
```

Then we pass the file name to another method to allow coping it:
```js
eleventyConfig.addPassthroughCopy("myfile.pdf"); 
```
This will allow coping the file "myfile.pdf" to the output folder
by that it will take the URL of "localhost:your_port:/myfile.pdf".



*[source article](https://www.11ty.dev/docs/copy/)*