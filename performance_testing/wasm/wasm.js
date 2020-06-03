var mem = new WebAssembly.Memory({initial: 32767});
mem.grow(62500 - 32767 - 366);


var importObject = {
    js: {
        mem: mem
    },
    console: {log: console.log}
};

WebAssembly.instantiateStreaming(fetch("wasm.wasm"), importObject).then(obj => {
    startTime = performance.now();
    obj.instance.exports.runCode();
    console.log("Total Time:" + (performance.now() - startTime));
});