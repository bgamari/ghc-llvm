;; forward function references are handled like this
define i32 @test_forward() {
  %forward = bitcast i8* @forward to i32 ()*
  %r = call i32 %forward()
  ret i32 %r
}

define i32 @forward$def() {
  ret i32 0
}

@forward = alias bitcast (i32 ()* @forward$def to i8*)

;; forward data references are handled like this
define i32 @test_forward_data() {
  %d = bitcast i8* @forward_data to i32*
  %r = load i32* %d
  ret i32 0
}

@forward_data$def = global i32 0
@forward_data = alias bitcast (i32* @forward_data$def to i8*)

;; non-forward function references require no special treatment
define i32 @test_internal$def() {
  ret i32 0
}

define void @test_back() {
  %r = call i32 @test_internal$def()
  ret void
}

;; external function references are handled like this
define i32 @test_external() {
  %external = bitcast i8* @external to i32 ()*
  %r = call i32 %external()
  ret i32 %r
}

@external = external global i8
