(module
    (import "js" "mem" (memory 1)) ;;One page of memory
    (func $createNode (param $nextNode i32) (param $value i32) (result i32) ;;Return new node address, we choose to have parameters in this order to make calling the function easier
        local.get $nextNode
        i32.const 8
        i32.add
        ;; Store value at address
        local.get $value
        i32.store
        ;; Increment address
        local.get $nextNode
        i32.const 12 ;;i32 is 32 bits, or 4 bytes
        i32.add
        ;; Store nextNode at address
        local.get $nextNode
        i32.store

        ;; Increment address
        local.get $nextNode
        i32.const 8
        i32.add
    )
    (func (export "runCode") (local $tempAddress i32) (local $counter i32)
        ;;Create Linked List
        
        i32.const 200000000
        local.set $counter
        i32.const 0 ;;No next address
        local.set $tempAddress
        (loop $l0
            local.get $tempAddress ;;Load address within loop
            local.get $counter ;;Load value
            call $createNode
            local.set $tempAddress
            ;; Decrement counter
            local.get $counter
            i32.const 1
            i32.sub
            local.set $counter
            ;; Branch unless 0
            local.get $counter
            i32.const 0
            i32.gt_u
            br_if $l0
        )

        ;;Iterate through Linked List
        (loop $l1 ;;Define a loop block

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
            i32.gt_u ;;Is tempAddress greater than zero?
            br_if $l1
        )
    )
)