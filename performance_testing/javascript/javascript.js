startTime = performance.now();

class LinkedList { //Node: class declarations in JavaScript are hoisted
    constructor(value, next) {
        this.value = value;
        this.next = next;
    }
}

tempNode = new LinkedList(500000000, null);
for (var i = 49999999; i > 0; i--) {
    tempNode = new LinkedList(i, tempNode);
}

while (tempNode.next != null) {
    //console.log(tempNode.value);
    tempNode = tempNode.next;
}

console.log("Total Time:" + (performance.now() - startTime));