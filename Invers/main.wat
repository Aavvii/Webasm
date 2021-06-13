(module
  (func $main (param $p0 i32) (result i32)
    (local $inv i32) (local $temp i32)
    i32.const 0
    local.set $inv
	  local.get $p0
	  local.set $temp
    loop $_while1
      local.get $inv
      i32.const 10
      i32.mul
      local.get $temp
      i32.const 10
      i32.rem_u
      i32.add
      local.set $inv
      local.get $temp
      i32.const 10
      i32.div_u
      local.set $temp
      local.get $temp
      i32.const 0
      i32.gt_u
      br_if $_while1
    end
    local.get $inv
  )
  (export "main" (func $main) )
)
