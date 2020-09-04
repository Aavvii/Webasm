/*
function ___sys_read(fd, buf, count)
{
  
  
  try {  
    var stream = SYSCALLS.getStreamFromFD(fd);
    return FS.readSync(stream, HEAP8,buf, count);
  } catch (e) {
  return -e.errno;
  }
}
*/
function _read_from_prompt()
{
  console.log("Am fost apelat");
  var input = prompt("Scrie un numar","");
  parseInt(input,10);
  return input;
}

// Check for wasm support.
    if (!('WebAssembly' in window)) {
      alert('you need a browser with wasm support enabled :(');
    }

    // Loads a WebAssembly dynamic library, returns a promise.
    // imports is an optional imports object
    /*
    
    function loadWebAssembly(filename, imports) {
      // Fetch the file and compile it
      return fetch(filename)
        .then(response => response.arrayBuffer())
        .then(buffer => WebAssembly.compile(buffer))
        .then(module => {
          // Create the imports for the module, including the
          // standard dynamic library imports
          imports = imports || {};
          imports.env = imports.env || {};
          imports.env.memoryBase = imports.env.memoryBase || 0;
          imports.env.tableBase = imports.env.tableBase || 0;
          if (!imports.env.memory) {
            imports.env.memory = new WebAssembly.Memory({ initial: 256 });
          }
          if (!imports.env.table) {
            imports.env.table = new WebAssembly.Table({ initial: 0, element: 'anyfunc' });
          }
          imports.env.__sys_read = console.log("ceva");
          return new WebAssembly.Instance(module, imports);
        });
    }
    ////////// */

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
            initial: 10,
            maximum: 256,
          }),
          table: new WebAssembly.Table({
            initial: 1,
            maximum: 1,
            element: 'anyfunc',
          }),
          __sys_read: _read_from_prompt,
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
        console.log(instance.exports.main(10));
      }
    );







