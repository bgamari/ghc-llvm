;; forward function references are handled like this
define i32 @test_forward() {
  %forward = bitcast i8* @forward to i32 ()*
  %r = call i32 %forward()
  ret i32 %r
}

define i32 @forward$def() {
  ret i32 88888
}

@forward = alias bitcast (i32 ()* @forward$def to i8*)


;; forward data references are handled like this
define i32 @test_forward_data() {
  %d = bitcast i8* @forward_data to i32*
  %r = load i32* %d
  ret i32 %r
}

@forward_data$def = global i32 123456
@forward_data = alias bitcast (i32* @forward_data$def to i8*)


;; non-forward function references
define i32 @internal$def() {
  ret i32 987234
}

define i32 @test_internal() {
  ;; we can bypass the alias if we have already seen the symbol
  %r = call i32 @internal$def()
  ret i32 %r
}

;; but we still need to provide the alias for external users
@internal = alias bitcast (i32 ()* @internal$def to i8*)


;; external function references are handled like this
define i32 @test_external() {
  %external = bitcast i8* @external to i32 ()*
  %r = call i32 %external()
  ret i32 %r
}

@external = external global i8


;; external data references are handled like this
define i32 @test_external_data() {
  %external_data = bitcast i8* @external_data to i32*
  %r = load i32* %external_data
  ret i32 %r
}

@external_data = external global i8