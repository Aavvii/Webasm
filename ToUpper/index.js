var memory = new WebAssembly.Memory({initial:10, maximum:100});

var importObject = {
  imports: { imported_func: arg => console.log(arg) }
};

var str;
str = prompt("Scrieti o propozitie apoi verificati consola","");
/*
str= str.split(" ");

let arrInt = [];

for (var i = 0; i < str.lenght; i++) {
  arrInt[i]=parseInt(str[i],10);
}
*/

WebAssembly.instantiateStreaming(fetch('main.wasm'), { js: { mem: memory } })
.then(results => {
  var i32 = new Uint32Array(memory.buffer);

  console.log(" Stringul initial: ");
  console.log(str);

  for (var i = 0; i < str.length; i++) {
    i32[i] = str[i].charCodeAt(0);
  }
  console.log(" Uint32Array initial: ");
  console.log(i32);

  results.instance.exports.exported_func(str.length);
  
  console.log(" Uint32Array final: ");
  console.log(i32);

  let strUpper = [];
  for (var i = 0; i < str.length; i++) {
    strUpper += String.fromCharCode(i32[i]);
  }
  console.log("Afisare finala");
  console.log(strUpper);

  alert("Stringul rezultat este: " + strUpper);
});

//console.log(Memory.prototype.buffer);