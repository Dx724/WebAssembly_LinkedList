class LinkedList {
    constructor(value, next) {
        this.value = value;
        this.next = next;
    }
}

var e3 = new LinkedList(3, null);
var e2 = new LinkedList(2, e3);
var e1 = new LinkedList(1, e2);

var currNode = e1;
while (currNode != null) {
    console.log(currNode.value);
    currNode = currNode.next;
}