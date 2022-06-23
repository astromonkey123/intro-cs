---
layout: post
title: This Website Exists Now!
subtitle: The Start of an Adventure
gh-repo: daattali/beautiful-jekyll
gh-badge: [star, fork, follow]
tags: [Announcement],[New],[Exciting]
comments: true
---

I am keeping this here for future reference in case I forget how markdown works.  Here's a link:(https://markdowntutorial.com/)

#Font Modifications:

*Italics*
**Bold**
***Bold Italics***

**Headings:**

# Here is a primary heading
## And a secondary
### And a tertiary

##Headings extended:

#### Fourth
##### Fifth
###### Sixth

##Tables

| Number | Next number | Previous number |
| :------ |:--- | :--- |
| 5 | 6 | 4 |
| 10 | 11 | 9 |
| 7 | 8 | 6 |
| 2 | 3 | 1 |

##Images

![OH-58](https://www.airforce-technology.com/wp-content/uploads/sites/6/2017/11/kiowe.jpg)

![OH-58](https://fullfatthings-keyaero.b-cdn.net/sites/keyaero/files/inline-images/01A%20CroatiaKiowas.jpg){: .mx-auto.d-block :}

Here's a code chunk:

~~~
var foo = function(x) {
  return(x + 5);
}
foo(3)
~~~

And here is the same code with syntax highlighting:

```javascript
var foo = function(x) {
  return(x + 5);
}
foo(3)
```

And here is the same code yet again but with line numbers:

{% highlight javascript linenos %}
var foo = function(x) {
  return(x + 5);
}
foo(3)
{% endhighlight %}

## Boxes
You can add notification, warning and error boxes like this:

### Notification

{: .box-note}
**Note:** This is a notification box.

### Warning

{: .box-warning}
**Warning:** This is a warning box.

### Error

{: .box-error}
**Error:** This is an error box.
