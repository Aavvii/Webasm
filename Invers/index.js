var input = prompt("Scrie un numar apoi verifica consola.","");
parseInt(input,10);

fetch('main.wasm').then(response =>
  response.arrayBuffer()
).then(bytes =>
  WebAssembly.instantiate(bytes)
).then(results => {
  console.log(results.instance.exports.main(input));
});