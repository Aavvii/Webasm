(module
  (type $t0 (func (param i32) (result i32)))
  (type $t1 (func (param i32)))
  (type $t2 (func (result i32)))
  (type $t3 (func))
  (type $t4 (func (param i32 i32 i32) (result i32)))
  (type $t5 (func (param i32 i32) (result i32)))
  (type $t6 (func (param i32 i64 i32) (result i64)))
  (type $t7 (func (result i32)))
  (import "env" "__sys_read" (func $env.__sys_read (type $t7)))
  ;;(import "env" "emscripten_resize_heap" (func $env.emscripten_resize_heap (type $t0)))
  ;;(import "env" "__handle_stack_overflow" (func $env.__handle_stack_overflow (type $t3)))
  (import "env" "memory" (memory $env.memory 10 256))
  (import "env" "table" (table $env.table 1 funcref))
  (func $main (type $t0) (param $length i32) (result i32)
  (local $varPointer1 i32)
  (local $var1 i32)
  (local $var2 i32)
  (local $var3 i32)


  call $env.__sys_read    ;;apelul functiei
  call $env.__sys_read    ;;apelul functiei
  call $env.__sys_read    ;;apelul functiei

  i32.add
  i32.add

  )

  (export "main" (func $main) )
)