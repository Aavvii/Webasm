(module
  (type $t0 (func (param i32) (result i32)))
  (type $t1 (func (param i32)))
  (type $t2 (func (result i32)))
  (type $t3 (func))
  (type $t4 (func (param i32 i32 i32) (result i32)))
  (type $t5 (func (param i32 i32) (result i32)))
  (type $t6 (func (param i32 i64 i32) (result i64)))
  (type $t7 (func (result i32)))
  (import "env" "__sys_read_int" (func $env.__sys_read_int (type $t7)))
  (import "env" "__sys_read_arr_element" (func $env.__sys_read_arr_element (type $t7)))
  (import "env" "__sys_read_arr_from_prompt" (func $env.__sys_read_arr_from_prompt (type $t7)))
  ;;(import "env" "emscripten_resize_heap" (func $env.emscripten_resize_heap (type $t0)))
  ;;(import "env" "__handle_stack_overflow" (func $env.__handle_stack_overflow (type $t3)))
  (import "env" "memory" (memory $env.memory 10 256))
  (import "env" "table" (table $env.table 0 anyfunc))
  (func $main (type $t2) (result i32)
  (local $varPointer1 i32)
  (local $nrOfElements i32)
  (local $arrayStart i32)
  (local $index i32)
  (local $max i32)
  (;
  ;;Aleg un loc de unde vreau sa inceapa vectorul. 64 pare ok dar nu am un motiv specific sa il aleg
  i32.const 64
  set_local $varPointer1
  ;;local.set $arrayStart

  ;;Apelez functia din JS care cere un int ce reprezinta lungimea vectorului
  call $env.__sys_read_int
  set_local $nrOfElements

  ;;Inmultesc lungimea vectorului cu 4 pentru a afla dimensiunea in octeti
  i32.const 4
  get_local $nrOfElements
  i32.mul
  set_local $nrOfElements

  ;;Apelez functia din JS care imi citeste tot vectorul de la tastatura si il pastreaza intr-o variabila globala
  call $env.__sys_read_arr_from_prompt
  drop ;; Functia returneaza 0, iar acel 0 nu ma intereseaza. Il sterg.

  ;;Setez indexul vectorului ca fiind 0
  i32.const 0
  set_local $index

  ;;Parcurg vectorul.
  loop $_FOR1
    ;;Iau pointerul vectorului si ii adun indexul pentru a merge la zona corecta de memorie
    get_local $varPointer1
    get_local $index
    i32.add
    ;;Iau valoarea si o pun in vector
    call $env.__sys_read_arr_element
    i32.store

    ;;Adun 4 la index pentru a merge la elementul al doilea
    get_local $index
    i32.const 4
    i32.add
    set_local $index

    ;;Verific daca indexul a ajuns inca egal cu lungimea maxima
    get_local $nrOfElements
    get_local $index
    ;;Daca indexul maxim este in continuare mai mare sau egal, merg la inceputul forului
    i32.gt_u
    br_if $_FOR1 ;; IF TRUE then LABEL, else BREAK
  end

  ;;resetez indexul
  i32.const 0
  set_local $index

  ;;Aici o sa calculez maximul
  i32.const 0
  set_local $max

  ;;Parcurg din nou vectorul
  loop $_FOR2
    get_local $varPointer1
    get_local $index
    i32.add
    ;;Iau elementul din vector si il adun in suma
    i32.load
    get_local $max
    i32.gt_u
    if $I1
      get_local $varPointer1
      get_local $index
      i32.add
      i32.load
      set_local $max
    end

    get_local $index
    i32.const 4
    i32.add
    set_local $index

    get_local $nrOfElements
    get_local $index
    i32.gt_u
    br_if $_FOR2
  end

  ;;In stiva trebuie sa ramana doar maximul.
  get_local $max
  return
   ;)
  i32.const 12
  i32.const 42
  i32.store
  i32.const 12
  i32.load
  )

  (export "main" (func $main) )
)