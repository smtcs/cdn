# Summit CDN
[![Build Status](https://img.shields.io/travis/smtcs/cdn.svg?style=flat)](https://travis-ci.org/smtcs/cdn) [![Code Climate](https://img.shields.io/codeclimate/github/smtcs/cdn.svg?style=flat)](https://codeclimate.com/github/smtcs/cdn) [![Test Coverage](https://img.shields.io/codeclimate/coverage/github/smtcs/cdn.svg?style=flat)](https://codeclimate.com/github/smtcs/cdn) [![Dependency Status](https://img.shields.io/gemnasium/smtcs/cdn.svg?style=flat)](https://gemnasium.com/smtcs/cdn)

Summit Computer Science CDN (Content Delivery Network).

## Description

This is a cdn where everyone from the Summit Public Schools Computer Science Expidition can use the same versions of libraries to avoid conflicts.

This server is powered by [sinatra](http://sinatrarb.com/) with [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) enabled so you can use it for link and script tags.

#### Tests

I wrote a lot of tests for this application so I know that everything works as it should, if you would like to see a lot of green and all the tests I wrote go to [this](http://cdn.smtcs.rocks/test) link for the tests.

## List of frameworks

| Framework       | CSS | JS  | HTML |
|-----------------|-----|-----|------|
| Skeleton        | Yes | No  | No   |
| Bootstrap       | Yes | Yes | No   |
| Materialize     | Yes | Yes | No   |
| Simple.css      | Yes | No  | No   |
| jQuery          | No  | Yes | No   |
| Highlight.js    | Yes | Yes | No   |
| Polymer         | No  | Yes | Yes  |
| Photoswipe      | No  | Yes | No   |
| Hashquery       | No  | Yes | No   |
| Font Awesome    | Yes | No  | No   |

### Skeleton

- [Website & Documentation](http://getskeleton.com/)

Skeleton is a great css framework if you are just starting to use css fameworks. It has a lot of the basics that are included in every framework.

- [v2.0 CSS](http://cdn.smtcs.rocks/sk.css) 11.0 KB

```html
<link rel="stylesheet" href="http://cdn.smtcs.rocks/sk.css">
```

### Bootstrap

- [Website](http://getbootstrap.com)
- [Documentation - css](http://getbootstrap.com/css/)
- [Documentation - components](http://getbootstrap.com/components/)
- [Documentation - javascript](http://getbootstrap.com/javascript/)

Bootstrap is a frontend framework that is very popular for things like its [grid system](http://getbootstrap.com/css/#grid) which helps you layout your webpage.

- [v3.3.1 CSS](http://cdn.smtcs.rocks/bs/bs.css) 21.2 KB
- [v3.3.1 JS](http://cdn.smtcs.rocks/bs/bs.js) 65.9 KB
- [v3.3.1 Theme](http://cdn.smtcs.rocks/bs/theme.css) 22.3 KB
- [v2.3.2 CSS](http://cdn.smtcs.rocks/bs/bs.css?v=2.3) 125 KB
- [v2.3.2 JS](http://cdn.smtcs.rocks/bs/bs.js?v=2.3) 60.8 KB

```html
<link rel="stylesheet" href="http://cdn.smtcs.rocks/bs/bs.css"> <!-- For v3.3.1 -->
<link rel="stylesheet" href="http://cdn.smtcs.rocks/bs/theme.css"> <!-- For v3.3.1 -->
<script src="http://cdn.smtcs.rocks/bs/bs.js"></script> <!-- For v3.3.1 -->

<link rel="stylesheet" href="http://cdn.smtcs.rocks/bs/bs.css?v=2.3"> <!-- For v2.3.2 -->
<script src="http://cdn.smtcs.rocks/bs/bs.js?v=2.3"></script> <!-- For v2.3.2 -->
```

### Materialize

- [Website](http://materializecss.com/)
- [Documentation - css](http://materializecss.com/components.html)
- [Documentation - javascript](http://materializecss.com/javascript.html)

Materialize is a front end framework just like Bootstrap that follows the google's material design principals.

- [v0.91 CSS](http://cdn.smtcs.rocks/md/md.css) 146 KB
- [v0.91 JS](http://cdn.smtcs.rocks/md/md.js) 240 KB

```html
<link rel="stylesheet" href="http://cdn.smtcs.rocks/md/md.css">
<script src="http://cdn.smtcs.rocks/md/md.js"></script>
```

### Simple.css

- [Website & Documentation](http://simplecss.algorithm.dk/)

Simple.css is a simple css framework for just starting out a project with.

- [v0.0.1 CSS](http://cdn.smtcs.rocks/sm.css) 3.7 KB

```html
<link rel="stylesheet" href="http://cdn.smtcs.rocks/sm.css">
```

### jQuery

- [Website](http://jquery.com/)
- [Documentation](http://api.jquery.com/)

jQuery is a javascript framework that strives to be albe to use one function for all the browser APIs.

- [v2.1.1 JS](http://cdn.smtcs.rocks/jq/2.js) 242 KB
- [v1.11.1 JS](http://cdn.smtcs.rocks/jq/1.js) 276 KB

```html
<script src="http://cdn.smtcs.rocks/jq/2.js"></script> <!-- For v2.1.1 -->
<script src="http://cdn.smtcs.rocks/jq/1.js"></script> <!-- For v1.11.1 -->
```

### Hightlight.js

- [Website](https://highlightjs.org/)
- [Documentation](https://highlightjs.org/usage/)

Highlight.js is a javascript library that allows you to highlight code on webpages.

- [v8.4 JS](http://cdn.smtcs.rocks/hl/hl.js) 67.6 KB
- [Many Styles](https://highlightjs.org/static/demo/)

```html
<link rel="stylesheet" href="http://cdn.smtcs.rocks/hl/default.css">
<!-- You can replace default with any of the styles from the list -->
<script src="http://cdn.smtcs.rocks/hl/hl.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
```

### Polymer

- [Website](https://polymer-project.org/)
- [Documentation](https://www.polymer-project.org/docs/polymer/polymer.html)
- [Elements](https://www.polymer-project.org/docs/elements/)

Polymer is this new thing that allows you to use these things called web components which allow you to create your own html elements with js to back them up.

- [v0.5.1 HTML](http://cdn.smtcs.rocks/pl/pl.html) 82.2 KB
- [v0.5.1 Webcomponents.js](http://cdn.smtcs.rocks/pl/wc.js) 42.6 KB
- [Many Elements](https://www.polymer-project.org/docs/elements/)

```html
<link rel="import" href="http://cdn.smtcs.rocks/pl/pl.html">
<script src="http://cdn.smtcs.rocks/pl/wc.js"></script> <!-- Compatability with Older browsers -->

<link rel="import" href="http://cdn.smtcs.rocks/polymer/paper-button/paper-button.html">
<!-- Replace paper-button with any polymer element in the docs, link above-->
```

### Photoswipe

- [Website](http://photoswipe.com/)
- [Documentation](http://photoswipe.com/documentation/getting-started.html)

Photoswipe is a javascript library that allows you for a super lightweight lightbox that has no dependencies.

- [v4.0.0 CSS](http://cdn.smtcs.rocks/ps/ps.css) 2.9 KB
- [v4.0.0 JS](http://cdn.smtcs.rocks/ps/ps.js) 85.5 KB
- [v4.0.0 UI](http://cdn.smtcs.rocks/ps/ps-ui.js) JS 19.0 KB
- [v4.0.0 Default CSS](http://cdn.smtcs.rocks/ps/skin/skin.css) 10.1 KB

```html
<link rel="stylesheet" href="http://cdn.smtcs.rocks/ps/ps.css">
<link rel="stylesheet" href="http://cdn.smtcs.rocks/ps/skin/skin.css"> <!-- optional -->

<script src="http://cdn.smtcs.rocks/ps/ps.js"></script>
<script src="http://cdn.smtcs.rocks/ps/ps-ui.js"></script>
```

### Hash Query

Hashquery is a library that allows you to store data in the url easily

- [v1.0.0 JS](http://cdn.smtcs.rocks/hq.js)

```html
<script src="http://cdn.smtcs.rocks/hq.js"></script>
```

### Font Awesome

- [Website](http://fontawesome.io/)
- [List of Icons](http://fontawesome.io/icons/)
- [Examples of Use](http://fontawesome.io/examples/)

Font awesome is an awesome css icon set that is free for you to use.

- [v4.2.0 CSS](http://cdn.smtcs.rocks/fa/fa.css) 26.3 KB

```html
<link rel="stylesheet" href="http://cdn.smtcs.rocks/fa/fa.css">
```

## Framework request

If you need to request any new framework please just hop into the [#summitcs](http://irc.smtcs.rocks) irc channel
