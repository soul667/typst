#import "@preview/jogs:0.2.3": *

#set page(height: auto, width: auto, fill: black, margin: 1em)
#set text(fill: white)

#let code = ```
function sum() {
  const total = Array.prototype.slice.call(arguments).reduce(function(a, b) {
      return a + b;
  }, 0);
  return total;
}

function string_join(arr) {
  return arr.join(" | ");
}

function return_complex_obj() {
  return {
    a: 1,
    b: "2",
    c: [1, 2, 3],
    d: {
      e: 1,
    },
  };
}

```
#let bytecode = compile-js(code)

#list-global-property(bytecode)

#call-js-function(bytecode, "sum", 6, 7, 8, 9, 10)

#call-js-function(bytecode, "string_join", ("a", "b", "c", "d", "e"),)

#call-js-function(bytecode, "return_complex_obj",)

