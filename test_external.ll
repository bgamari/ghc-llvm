;; here is the definition of a 
define internal i32 @external$def() {
  ret i32 1245123
}

@external = alias bitcast (i32 ()* @external$def to i8*)
