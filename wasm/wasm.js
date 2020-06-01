var importObject = {
    console: {
        log: (value) => console.log(value)
    },
    js: {
        mem: new WebAssembly.Memory({initial: 1}),
        global: new WebAssembly.Global({value: "i32", mutable: true}, 0)
    }
};

WebAssembly.instantiateStreaming(fetch("wasm.wasm"), importObject).then(obj => {
    obj.instance.exports.runCode();
});