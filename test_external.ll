;; here is the definition of an external function
define internal i32 @external$def() {
  ret i32 1245123
}

@external = alias bitcast (i32 ()* @external$def to i8*)

;; here is the definition of external data
@external_data$def = global i32 66666

@external_data = alias bitcast (i32* @external_data$def to i8*)
