# parent.js #

parent.js is jQuery-based show or hide DOM by :radio, :checkbox checked attribute.

## depedencies ##

- [jquery-metadata](http://archive.plugins.jquery.com/project/metadata)
- [Underscore.js](http://underscorejs.org/)

```html
<html>
  <head>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="http://underscorejs.org/underscore-min.js"></script>
    <script src="./lib/jquery-metadata.js"></script>
    <script src="./parent.js"></script>
  </head>
  <body>
    <input type="radio" value="1"/> show
    <input type="radio" value="2"/> hide
    <div class="parent" data="key:['1']">
      hello world
    </div>
  </body>
</html>
```
