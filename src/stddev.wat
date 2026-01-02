(module $stddev.wasm
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func))
  (func $malloc_wasm (type 0) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    i32.const 0
    i32.load offset=1024
    local.tee 1
    local.get 0
    i32.add
    i32.store offset=1024
    local.get 1)
  (func $__init__ (type 1)
    i32.const 0
    i32.const 0
    i32.load offset=66576
    i32.store offset=1024)
  (func $fibo (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 2
        i32.shl
        local.tee 1
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      i32.const 0
      i32.load offset=1024
      local.tee 2
      local.get 1
      i32.add
      i32.store offset=1024
      local.get 2
      local.set 1
    end
    local.get 1
    local.set 3
    i32.const 1
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.const 1
      i32.le_s
      br_if 0 (;@1;)
      local.get 3
      i64.const 4294967297
      i64.store align=4
      block  ;; label = @2
        local.get 0
        i32.const 2
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const -2
        i32.add
        local.set 2
        local.get 3
        local.set 1
        local.get 3
        i32.const 4
        i32.add
        i32.load
        local.set 4
        loop  ;; label = @3
          local.get 1
          local.tee 1
          i32.const 8
          i32.add
          local.get 1
          i32.load
          local.get 4
          i32.add
          local.tee 4
          i32.store
          local.get 2
          i32.const -1
          i32.add
          local.tee 5
          local.set 2
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 4
          local.set 4
          local.get 5
          br_if 0 (;@3;)
        end
      end
      local.get 3
      local.get 0
      i32.const 2
      i32.shl
      i32.add
      i32.const -4
      i32.add
      i32.load
      local.set 1
    end
    local.get 1)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 66576))
  (export "memory" (memory 0))
  (export "malloc_wasm" (func $malloc_wasm))
  (export "__init__" (func $__init__))
  (export "fibo" (func $fibo)))
