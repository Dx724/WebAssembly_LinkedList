(module
    (import "console" "log" (func $log (param i32))) ;;Import console log function
    (import "js" "mem" (memory 1)) ;;One page of memory
    (global $currentAddress (import "js" "global") (mut i32)) ;;Location for next node
    (func $createNode (param $nextNode i32) (param $value i32) (result i32) ;;Return new node address, we choose to have parameters in this order to make calling the function easier
        ;; Store value at address
        global.get $currentAddress
        local.get $value
        i32.store
        ;; Increment address
        global.get $currentAddress
        i32.const 4 ;;i32 is 32 bits, or 4 bytes
        i32.add
        global.set $currentAddress
        ;; Store nextNode at address
        global.get $currentAddress
        local.get $nextNode
        i32.store
        ;; Increment address
        global.get $currentAddress
        i32.const 4
        i32.add
        global.set $currentAddress
        ;; Return address of node just created
        global.get $currentAddress
        i32.const 8
        i32.sub
    )
    (func (export "runCode") (local $tempAddress i32)
        ;;Create Linked List
        ;; Start LinkedList at address 0 (although already initialized in wasm.js)
        i32.const 0
        global.set $currentAddress
        ;; Create LinkedList
        i32.const -1 ;;No next address
        i32.const 3 ;;Third value
        call $createNode ;;Returns address of third node
        i32.const 2 ;;Second value
        call $createNode ;;Returns address of second node
        i32.const 1 ;;First value
        call $createNode

        local.set $tempAddress ;;Store address of node 1 (with value 1) to local variable

        ;;Iterate through Linked List
        (loop $l1 ;;Define a loop block
            ;; Read and print node value
            local.get $tempAddress ;;Get address to read from
            i32.load ;;Read value from memory
            call $log ;;Print to console log

            ;; Increment tempAddress
            local.get $tempAddress
            i32.const 4
            i32.add

            ;; Set tempAddress to next address
            i32.load ;;Read next address
            local.set $tempAddress

            ;;Continue loop if next address is non-negative
            local.get $tempAddress
            i32.const 0
            i32.ge_s ;;Is tempAddress greater than or equal to zero?
            br_if $l1
        )
    )
)