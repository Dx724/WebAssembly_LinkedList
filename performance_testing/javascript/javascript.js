startTime = performance.now();

class LinkedList { //Node: class declarations in JavaScript are hoisted
    constructor(value, next) {
        this.value = value;
        this.next = next;
    }
}

tempNode = new LinkedList(200000000, null);
for (var i = 199999999; i > 0; i--) {
    tempNode = new LinkedList(i, tempNode);
}

while (tempNode.next != null) {
    //console.log(tempNode.value);
    tempNode = tempNode.next;
}

console.log("Total Time:" + (performance.now() - startTime));