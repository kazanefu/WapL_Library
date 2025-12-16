; ModuleID = 'wapl_module'
source_filename = "wapl_module"

@str_0 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@str_1 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@str_2 = private unnamed_addr constant [4 x i8] c"Yes\00", align 1
@str_3 = private unnamed_addr constant [3 x i8] c"No\00", align 1
@str_4 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@str_5 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@println_fmt_6 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

declare i64 @strtol(ptr, ptr, i32)

declare double @atof(ptr)

declare i32 @printf(ptr, ...)

declare i32 @sprintf(ptr, ptr, ...)

declare ptr @realloc(ptr, i64)

declare ptr @malloc(i64)

declare void @free(ptr)

declare i32 @scanf(ptr, ...)

define i32 @_TOPLEVEL_() {
entry:
  ret i32 0
}

declare i32 @printf.1(ptr, ...)

declare i32 @sprintf.2(ptr, ptr, ...)

define ptr @bool_to_str(i1 %b) {
entry:
  %b1 = alloca i1, align 1
  store i1 %b, ptr %b1, align 1
  %ret_val = alloca ptr, align 8
  %b2 = load i1, ptr %b1, align 1
  br i1 %b2, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.merge

if.else:                                          ; preds = %entry
  br label %if.merge

if.merge:                                         ; preds = %if.else, %if.then
  %if.result = phi ptr [ @str_0, %if.then ], [ @str_1, %if.else ]
  ret ptr %if.result
}

define ptr @yes_no(i1 %b) {
entry:
  %b1 = alloca i1, align 1
  store i1 %b, ptr %b1, align 1
  %ret_val = alloca ptr, align 8
  %b2 = load i1, ptr %b1, align 1
  br i1 %b2, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.merge

if.else:                                          ; preds = %entry
  br label %if.merge

if.merge:                                         ; preds = %if.else, %if.then
  %if.result = phi ptr [ @str_2, %if.then ], [ @str_3, %if.else ]
  ret ptr %if.result
}

define ptr @null() {
entry:
  %ret_val = alloca ptr, align 8
  %p = alloca ptr, align 8
  store ptr null, ptr %p, align 8
  %p1 = load ptr, ptr %p, align 8
  ret ptr %p1
}

define i32 @main() {
entry:
  %ret_val = alloca i32, align 4
  %calltmp = call i32 @_TOPLEVEL_()
  %ans = alloca i64, align 8
  store i64 0, ptr %ans, align 4
  %n = alloca i64, align 8
  store i64 0, ptr %n, align 4
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_4, ptr %n)
  %ans1 = load i64, ptr %ans, align 4
  %fmt_buf = alloca [128 x i8], align 1
  %sprintf = call i32 (ptr, ptr, ...) @sprintf(ptr %fmt_buf, ptr @str_5, i64 %ans1)
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_6, ptr %fmt_buf)
  ret i32 0
}
