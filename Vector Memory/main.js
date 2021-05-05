function _read_int_from_prompt()
{
  console.log("Prompt int");
  var input = prompt("Scrie numarul de elemente din vector","");
  parseInt(input,10);
  return input;
}

let arrInt = [];
let arrIndex=0;

function _read_arr_from_prompt()
{
  console.log("Prompt array");
  var input = prompt("Scrie elementele vectorului","");
  let arrString = input.split(" ");

  arrInt = [];
  for(i=0;i<arrString.length;i++)
  {
    arrInt[i] = parseInt(arrString[i],10);
  }

  console.log(arrInt);
  return 0;
}

function _return_one_element_from_array()
{
  arrElement=arrInt[arrIndex];
  arrIndex++;
  return arrElement;
}


// Check for wasm support.
    if (!('WebAssembly' in window)) {
      alert('you need a browser with wasm support enabled :(');
    }

   function loadWebAssembly(filename, imports = {}) {
    return fetch(filename)
      .then((response) => response.arrayBuffer())
      .then((buffer) => WebAssembly.compile(buffer))
      .then((module) => {
        imports.env = imports.env || {}
        Object.assign(imports.env, {
          memoryBase: 0,
          tableBase: 0,
          memory: new WebAssembly.Memory({
            initial: 1,
            maximum: 1,
          }),
          table: new WebAssembly.Table({
            initial: 1,
            maximum: 1,
            element: 'anyfunc',
          }),
          __sys_read_int: _read_int_from_prompt,
          __sys_read_arr_element: _return_one_element_from_array,
          __sys_read_arr_from_prompt: _read_arr_from_prompt
        })
        return new WebAssembly.Instance(module, imports)
      })
  }

    // Main part of this example, loads the module and uses it.
    loadWebAssembly('main.wasm')
      .then(instance => {
        //var exports = instance.exports; // the exports of that instance
        //var doubler = exports._doubler; // the "doubler" function (note "_" prefix)
        // now we are ready, set up the button so the user can run the code
        console.log(instance.exports.main());
      }
    );


