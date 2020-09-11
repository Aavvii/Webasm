var memory = new WebAssembly.Memory({initial:10, maximum:100});

function printChar(arg)
{
  console.log(String.fromCharCode(arg));
}

var importObject = {
  js: { mem: memory },
  env: {_printLetter: arg => printChar(arg)}
};

var str;
str = prompt("Scrieti o propozitie","");

WebAssembly.instantiateStreaming(fetch('main.wasm'), importObject )
.then(results => {
  var i32 = new Uint32Array(memory.buffer);

  console.log(" Stringul initial: ");
  console.log(str);

  for (var i = 0; i < str.length; i++) {
    i32[i] = str[i].charCodeAt(0);
  }

  console.log(" Afisarea din webassembly: ");
  results.instance.exports.exported_func(str.length);
  


});

//console.log(Memory.prototype.buffer);