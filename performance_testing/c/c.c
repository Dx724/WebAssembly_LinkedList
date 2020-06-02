#include <stdlib.h>
#include <stdio.h>
#include <emscripten.h>

typedef struct LinkedListNode LinkedListNode;

struct LinkedListNode {
    int value;
    LinkedListNode* nextNode;
};

int main() {
    emscripten_run_script("startTime = performance.now();");

    struct LinkedListNode* tempNode = (struct LinkedListNode*) malloc(sizeof(struct LinkedListNode));
    tempNode->value = 500000000;
    tempNode->nextNode = NULL;
    for (int i = 49999999; i > 0; i--) {
        struct LinkedListNode* newNode = (struct LinkedListNode*) malloc(sizeof(struct LinkedListNode));
        newNode->value = i;
        newNode->nextNode = tempNode;
        tempNode = newNode;
    }

    while (tempNode->nextNode != NULL) {
        tempNode = tempNode->nextNode;
    }
    //printf("%d\n", tempNode->value);

    emscripten_run_script("alert('Total Time:' + (performance.now() - startTime));");
    return 0;
}