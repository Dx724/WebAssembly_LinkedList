#include <stdlib.h>
#include <stdio.h>

typedef struct LinkedListNode LinkedListNode;

struct LinkedListNode {
    int value;
    LinkedListNode* nextNode;
};

int main() {
    struct LinkedListNode* first = (struct LinkedListNode*) malloc(sizeof(struct LinkedListNode));
    struct LinkedListNode* second = (struct LinkedListNode*) malloc(sizeof(struct LinkedListNode));
    struct LinkedListNode* third = (struct LinkedListNode*) malloc(sizeof(struct LinkedListNode));

    first->value = 1;
    first->nextNode = second;

    second->value = 2;
    second->nextNode = third;

    third->value = 3;
    third->nextNode = NULL;

    struct LinkedListNode* current = first;
    while (current != NULL) {
        printf("%i\n", current->value);
        current = current->nextNode;
    }

    return 0;
}