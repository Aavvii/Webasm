(module
  (type $t0 (func (param i32)))
  (import "js" "mem" (memory $js.mem 10 256))
  (type $t1 (func (param i32)))
  (func $exported_func (type $t1) (param $lenght i32)
  (local $arrPointer i32)
  (local $temp i32)
  (local $index i32)
    
  i32.const 0
  local.set $arrPointer

  local.get $arrPointer
  i32.load
  local.set $temp

  i32.const 0
  local.set $index

  local.get $lenght
  i32.const 4
  i32.mul
  local.set $lenght

  i32.const 0
  local.get $lenght
  i32.ne

  if $I0
    loop $_WHILE1
      local.get $arrPointer
      i32.load

      i32.const 97
      i32.ge_u
      if $I1
        local.get $arrPointer
        i32.load
        i32.const 122
        i32.le_u
        if $I1
          local.get $arrPointer
          i32.load
          i32.const -32
          i32.add 
          local.set $temp

          local.get $arrPointer
          local.get $temp
          i32.store
        end
      end

      local.get $arrPointer
      i32.const 4
      i32.add
      local.set $arrPointer

      i32.const 4
      local.get $index
      i32.add
      local.set $index

      local.get $lenght
      local.get $index

      i32.ge_u
      br_if $_WHILE1
    end
  end

  )
  (export "exported_func" (func $exported_func))
)
