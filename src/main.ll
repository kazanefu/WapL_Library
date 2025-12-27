; ModuleID = 'wapl_module'
source_filename = "wapl_module"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-wasi"

%Box = type { ptr, i32 }
%Option = type { i1, ptr }
%Iterator = type { ptr, ptr, ptr, i32 }
%VecT = type { ptr, i32, i32, i32 }
%Slice = type { ptr, i32 }
%StrSlice = type { ptr, i32 }
%String = type { ptr, i32, i32 }
%timespec = type { i64, i64 }
%KeyMap = type { ptr, i32, i32, i32 }
%Entry = type { %String, ptr }
%Complex = type { double, double }
%Result = type { i1, ptr, ptr }

@str_0 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@str_1 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@str_2 = private unnamed_addr constant [4 x i8] c"Yes\00", align 1
@str_3 = private unnamed_addr constant [3 x i8] c"No\00", align 1
@str_4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@str_5 = private unnamed_addr constant [13 x i8] c"Hello World!\00", align 1
@println_fmt_6 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_7 = private unnamed_addr constant [13 x i8] c"Hello World!\00", align 1
@str_8 = private unnamed_addr constant [24 x i8] c"Error:unexpected unwrap\00", align 1
@println_fmt_9 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@println_fmt_10 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_11 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@str_12 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@str_13 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@str_14 = private unnamed_addr constant [10 x i8] c"%1000000s\00", align 1
@str_15 = private unnamed_addr constant [25 x i8] c"The TextFile is Too Long\00", align 1
@println_fmt_16 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_17 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@println_fmt_18 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_19 = private unnamed_addr constant [28 x i8] c"KeyMap_insert: miss realloc\00", align 1
@println_fmt_20 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_21 = private unnamed_addr constant [28 x i8] c"KeyMap_insert: miss realloc\00", align 1
@println_fmt_22 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_23 = private unnamed_addr constant [8 x i8] c"\1B[2J\1B[H\00", align 1
@println_fmt_24 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_25 = private unnamed_addr constant [13 x i8] c"c = %g + %gi\00", align 1
@println_fmt_26 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_27 = private unnamed_addr constant [25 x i8] c"Error:unexpected unwrap?\00", align 1
@println_fmt_28 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@println_fmt_29 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@stdin = external externally_initialized global ptr
@str_30 = private unnamed_addr constant [8 x i8] c"IOError\00", align 1
@str_31 = private unnamed_addr constant [7 x i8] c"(%s:)\0A\00", align 1
@str_32 = private unnamed_addr constant [7 x i8] c"hello\0A\00", align 1

declare i32 @strtol(ptr, ptr, i32)

declare double @atof(ptr)

declare i32 @printf(ptr, ...)

declare i32 @sprintf(ptr, ptr, ...)

declare ptr @realloc(ptr, i32)

declare ptr @malloc(i32)

declare void @free(ptr)

declare i32 @scanf(ptr, ...)

declare i32 @printf.1(ptr, ...)

declare i32 @sprintf.2(ptr, ptr, ...)

declare void @exit(i32)

define ptr @bool_to_str(i1 %b) {
entry:
  %b1 = alloca i1, align 1
  store i1 %b, ptr %b1, align 1
  %ret_val = alloca ptr, align 4
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
  %ret_val = alloca ptr, align 4
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
  %ret_val = alloca ptr, align 4
  %p = alloca ptr, align 4
  store ptr null, ptr %p, align 4
  %p1 = load ptr, ptr %p, align 4
  ret ptr %p1
}

define void @VOID() {
entry:
  ret void
}

define %Box @Box(ptr %src, i32 %elem_size) {
entry:
  %src1 = alloca ptr, align 4
  store ptr %src, ptr %src1, align 4
  %elem_size2 = alloca i32, align 4
  store i32 %elem_size, ptr %elem_size2, align 4
  %ret_val = alloca %Box, align 8
  %elem_size3 = load i32, ptr %elem_size2, align 4
  %malloc_call = call ptr @malloc(i32 %elem_size3)
  %value = alloca ptr, align 4
  store ptr %malloc_call, ptr %value, align 4
  %box = alloca %Box, align 8
  store %Box zeroinitializer, ptr %box, align 4
  %value4 = load ptr, ptr %value, align 4
  %src5 = load ptr, ptr %src1, align 4
  %elem_size6 = load i32, ptr %elem_size2, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %value4, ptr align 1 %src5, i32 %elem_size6, i1 false)
  %value7 = load ptr, ptr %value, align 4
  %box8 = load %Box, ptr %box, align 4
  %access = getelementptr inbounds nuw %Box, ptr %box, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  store ptr %value7, ptr %access, align 4
  %elem_size9 = load i32, ptr %elem_size2, align 4
  %box10 = load %Box, ptr %box, align 4
  %access11 = getelementptr inbounds nuw %Box, ptr %box, i32 0, i32 1
  %getmembervalue12 = load i32, ptr %access11, align 4
  store i32 %elem_size9, ptr %access11, align 4
  %box13 = load %Box, ptr %box, align 4
  ret %Box %box13
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #0

define ptr @Box_open(%Box %box) {
entry:
  %box1 = alloca %Box, align 8
  store %Box %box, ptr %box1, align 4
  %ret_val = alloca ptr, align 4
  %box2 = load %Box, ptr %box1, align 4
  %access = getelementptr inbounds nuw %Box, ptr %box1, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  ret ptr %getmembervalue
}

declare ptr @popen(ptr, ptr)

declare i32 @fread(ptr, i32, i32, ptr)

declare i32 @pclose(ptr)

declare i32 @system(ptr)

define i32 @exec(ptr %cmd) {
entry:
  %cmd1 = alloca ptr, align 4
  store ptr %cmd, ptr %cmd1, align 4
  %ret_val = alloca i32, align 4
  %cmd2 = load ptr, ptr %cmd1, align 4
  %calltmp = call i32 @system(ptr %cmd2)
  %">>_tmp" = ashr i32 %calltmp, 8
  ret i32 %">>_tmp"
}

define i64 @exec_capture(ptr %cmd, ptr %buf, i64 %cap) {
entry:
  %cmd1 = alloca ptr, align 4
  store ptr %cmd, ptr %cmd1, align 4
  %buf2 = alloca ptr, align 4
  store ptr %buf, ptr %buf2, align 4
  %cap3 = alloca i64, align 8
  store i64 %cap, ptr %cap3, align 8
  %ret_val = alloca i64, align 8
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %cap4 = load i64, ptr %cap3, align 8
  %sle = icmp sle i64 %cap4, 1
  br i1 %sle, label %if.then.0, label %if.end

if.then.0:                                        ; preds = %if.cond.0
  ret i64 0

if.end:                                           ; preds = %if.cond.0
  %cmd5 = load ptr, ptr %cmd1, align 4
  %calltmp = call ptr @popen(ptr %cmd5, ptr @str_4)
  %fp = alloca ptr, align 4
  store ptr %calltmp, ptr %fp, align 4
  %buf6 = load ptr, ptr %buf2, align 4
  %cap7 = load i64, ptr %cap3, align 8
  %sub = sub i64 %cap7, 1
  %fp8 = load ptr, ptr %fp, align 4
  %calltmp9 = call i32 @fread(ptr %buf6, i64 1, i64 %sub, ptr %fp8)
  %sext = sext i32 %calltmp9 to i64
  %n = alloca i64, align 8
  store i64 %sext, ptr %n, align 8
  br label %if.cond.010

if.cond.010:                                      ; preds = %if.end
  %n12 = load i64, ptr %n, align 8
  %cap13 = load i64, ptr %cap3, align 8
  %slt = icmp slt i64 %n12, %cap13
  br i1 %slt, label %if.then.011, label %if.end14

if.then.011:                                      ; preds = %if.cond.010
  %buf15 = load ptr, ptr %buf2, align 4
  %n16 = load i64, ptr %n, align 8
  %idx_ptr = getelementptr i8, ptr %buf15, i64 %n16
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  store i8 0, ptr %idx_ptr, align 1
  br label %if.end14

if.end14:                                         ; preds = %if.then.011, %if.cond.010
  %fp17 = load ptr, ptr %fp, align 4
  %calltmp18 = call i32 @pclose(ptr %fp17)
  %n19 = load i64, ptr %n, align 8
  ret i64 %n19
}

define ptr @SayHello() {
entry:
  %ret_val = alloca ptr, align 4
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_6, ptr @str_5)
  %fmt_buf = alloca [128 x i8], align 1
  %sprintf = call i32 (ptr, ptr, ...) @sprintf(ptr %fmt_buf, ptr @str_7)
  ret ptr %fmt_buf
}

define %Option @Option_new(i1 %is_some, ptr %value) {
entry:
  %is_some1 = alloca i1, align 1
  store i1 %is_some, ptr %is_some1, align 1
  %value2 = alloca ptr, align 4
  store ptr %value, ptr %value2, align 4
  %ret_val = alloca %Option, align 8
  %ret = alloca %Option, align 8
  store %Option zeroinitializer, ptr %ret, align 4
  %is_some3 = load i1, ptr %is_some1, align 1
  %ret4 = load %Option, ptr %ret, align 4
  %access = getelementptr inbounds nuw %Option, ptr %ret, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  store i1 %is_some3, ptr %access, align 1
  %value5 = load ptr, ptr %value2, align 4
  %ret6 = load %Option, ptr %ret, align 4
  %access7 = getelementptr inbounds nuw %Option, ptr %ret, i32 0, i32 1
  %getmembervalue8 = load ptr, ptr %access7, align 4
  store ptr %value5, ptr %access7, align 4
  %ret9 = load %Option, ptr %ret, align 4
  ret %Option %ret9
}

define %Option @Some(ptr %value) {
entry:
  %value1 = alloca ptr, align 4
  store ptr %value, ptr %value1, align 4
  %ret_val = alloca %Option, align 8
  %value2 = load ptr, ptr %value1, align 4
  %calltmp = call %Option @Option_new(i1 true, ptr %value2)
  ret %Option %calltmp
}

define %Option @None() {
entry:
  %ret_val = alloca %Option, align 8
  %calltmp = call ptr @null()
  %calltmp1 = call %Option @Option_new(i1 false, ptr %calltmp)
  ret %Option %calltmp1
}

define i1 @is_some(%Option %self) {
entry:
  %self1 = alloca %Option, align 8
  store %Option %self, ptr %self1, align 4
  %ret_val = alloca i1, align 1
  %self2 = load %Option, ptr %self1, align 4
  %access = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  ret i1 %getmembervalue
}

define ptr @unwrap(%Option %self) {
entry:
  %self1 = alloca %Option, align 8
  store %Option %self, ptr %self1, align 4
  %ret_val = alloca ptr, align 4
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self2 = load %Option, ptr %self1, align 4
  %access = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  br i1 %getmembervalue, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %self3 = load %Option, ptr %self1, align 4
  %access4 = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 1
  %getmembervalue5 = load ptr, ptr %access4, align 4
  ret ptr %getmembervalue5

if.else:                                          ; preds = %if.cond.0
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_9, ptr @str_8)
  call void @exit(i32 1)
  %calltmp = call ptr @null()
  ret ptr %calltmp
}

define ptr @expect(%Option %self, ptr %error_message) {
entry:
  %self1 = alloca %Option, align 8
  store %Option %self, ptr %self1, align 4
  %error_message2 = alloca ptr, align 4
  store ptr %error_message, ptr %error_message2, align 4
  %ret_val = alloca ptr, align 4
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self3 = load %Option, ptr %self1, align 4
  %access = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  br i1 %getmembervalue, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %self4 = load %Option, ptr %self1, align 4
  %access5 = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 1
  %getmembervalue6 = load ptr, ptr %access5, align 4
  ret ptr %getmembervalue6

if.else:                                          ; preds = %if.cond.0
  %error_message7 = load ptr, ptr %error_message2, align 4
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_10, ptr %error_message7)
  call void @exit(i32 1)
  %calltmp = call ptr @null()
  ret ptr %calltmp
}

define ptr @unwrap_or(%Option %self, ptr %or_value) {
entry:
  %self1 = alloca %Option, align 8
  store %Option %self, ptr %self1, align 4
  %or_value2 = alloca ptr, align 4
  store ptr %or_value, ptr %or_value2, align 4
  %ret_val = alloca ptr, align 4
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self3 = load %Option, ptr %self1, align 4
  %access = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  br i1 %getmembervalue, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %self4 = load %Option, ptr %self1, align 4
  %access5 = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 1
  %getmembervalue6 = load ptr, ptr %access5, align 4
  ret ptr %getmembervalue6

if.else:                                          ; preds = %if.cond.0
  %or_value7 = load ptr, ptr %or_value2, align 4
  ret ptr %or_value7
}

define %Iterator @iter_new(ptr %pointer, ptr %start, ptr %end, i32 %elem_size) {
entry:
  %pointer1 = alloca ptr, align 4
  store ptr %pointer, ptr %pointer1, align 4
  %start2 = alloca ptr, align 4
  store ptr %start, ptr %start2, align 4
  %end3 = alloca ptr, align 4
  store ptr %end, ptr %end3, align 4
  %elem_size4 = alloca i32, align 4
  store i32 %elem_size, ptr %elem_size4, align 4
  %ret_val = alloca %Iterator, align 8
  %iter = alloca %Iterator, align 8
  store %Iterator zeroinitializer, ptr %iter, align 4
  %pointer5 = load ptr, ptr %pointer1, align 4
  %iter6 = load %Iterator, ptr %iter, align 4
  %access = getelementptr inbounds nuw %Iterator, ptr %iter, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  store ptr %pointer5, ptr %access, align 4
  %start7 = load ptr, ptr %start2, align 4
  %iter8 = load %Iterator, ptr %iter, align 4
  %access9 = getelementptr inbounds nuw %Iterator, ptr %iter, i32 0, i32 1
  %getmembervalue10 = load ptr, ptr %access9, align 4
  store ptr %start7, ptr %access9, align 4
  %end11 = load ptr, ptr %end3, align 4
  %iter12 = load %Iterator, ptr %iter, align 4
  %access13 = getelementptr inbounds nuw %Iterator, ptr %iter, i32 0, i32 2
  %getmembervalue14 = load ptr, ptr %access13, align 4
  store ptr %end11, ptr %access13, align 4
  %elem_size15 = load i32, ptr %elem_size4, align 4
  %iter16 = load %Iterator, ptr %iter, align 4
  %access17 = getelementptr inbounds nuw %Iterator, ptr %iter, i32 0, i32 3
  %getmembervalue18 = load i32, ptr %access17, align 4
  store i32 %elem_size15, ptr %access17, align 4
  %iter19 = load %Iterator, ptr %iter, align 4
  ret %Iterator %iter19
}

define %Iterator @iter(ptr %contents, ptr %end, i32 %elem_size) {
entry:
  %contents1 = alloca ptr, align 4
  store ptr %contents, ptr %contents1, align 4
  %end2 = alloca ptr, align 4
  store ptr %end, ptr %end2, align 4
  %elem_size3 = alloca i32, align 4
  store i32 %elem_size, ptr %elem_size3, align 4
  %ret_val = alloca %Iterator, align 8
  %contents4 = load ptr, ptr %contents1, align 4
  %contents5 = load ptr, ptr %contents1, align 4
  %end6 = load ptr, ptr %end2, align 4
  %elem_size7 = load i32, ptr %elem_size3, align 4
  %calltmp = call %Iterator @iter_new(ptr %contents4, ptr %contents5, ptr %end6, i32 %elem_size7)
  ret %Iterator %calltmp
}

define %Option @iter_next(ptr %self) {
entry:
  %self1 = alloca ptr, align 4
  store ptr %self, ptr %self1, align 4
  %ret_val = alloca %Option, align 8
  %self2 = load ptr, ptr %self1, align 4
  %access = getelementptr inbounds nuw %Iterator, ptr %self2, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  %ret = alloca ptr, align 4
  store ptr %getmembervalue, ptr %ret, align 4
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self3 = load ptr, ptr %self1, align 4
  %access4 = getelementptr inbounds nuw %Iterator, ptr %self3, i32 0, i32 0
  %getmembervalue5 = load ptr, ptr %access4, align 4
  %self6 = load ptr, ptr %self1, align 4
  %access7 = getelementptr inbounds nuw %Iterator, ptr %self6, i32 0, i32 2
  %getmembervalue8 = load ptr, ptr %access7, align 4
  %ptr_a_i = ptrtoint ptr %getmembervalue5 to i64
  %ptr_b_i = ptrtoint ptr %getmembervalue8 to i64
  %slt = icmp slt i64 %ptr_a_i, %ptr_b_i
  br i1 %slt, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %ret9 = load ptr, ptr %ret, align 4
  %self10 = load ptr, ptr %self1, align 4
  %access11 = getelementptr inbounds nuw %Iterator, ptr %self10, i32 0, i32 3
  %getmembervalue12 = load i32, ptr %access11, align 4
  %idx_i64 = sext i32 %getmembervalue12 to i64
  %ptr_add = getelementptr i8, ptr %ret9, i64 %idx_i64
  %self13 = load ptr, ptr %self1, align 4
  %access14 = getelementptr inbounds nuw %Iterator, ptr %self13, i32 0, i32 0
  %getmembervalue15 = load ptr, ptr %access14, align 4
  store ptr %ptr_add, ptr %access14, align 4
  %ret16 = load ptr, ptr %ret, align 4
  %calltmp = call %Option @Some(ptr %ret16)
  ret %Option %calltmp

if.else:                                          ; preds = %if.cond.0
  %calltmp17 = call %Option @None()
  ret %Option %calltmp17
}

define %Option @iter_peek(ptr %self) {
entry:
  %self1 = alloca ptr, align 4
  store ptr %self, ptr %self1, align 4
  %ret_val = alloca %Option, align 8
  %self2 = load ptr, ptr %self1, align 4
  %access = getelementptr inbounds nuw %Iterator, ptr %self2, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  %ret = alloca ptr, align 4
  store ptr %getmembervalue, ptr %ret, align 4
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self3 = load ptr, ptr %self1, align 4
  %access4 = getelementptr inbounds nuw %Iterator, ptr %self3, i32 0, i32 0
  %getmembervalue5 = load ptr, ptr %access4, align 4
  %self6 = load ptr, ptr %self1, align 4
  %access7 = getelementptr inbounds nuw %Iterator, ptr %self6, i32 0, i32 2
  %getmembervalue8 = load ptr, ptr %access7, align 4
  %ptr_a_i = ptrtoint ptr %getmembervalue5 to i64
  %ptr_b_i = ptrtoint ptr %getmembervalue8 to i64
  %slt = icmp slt i64 %ptr_a_i, %ptr_b_i
  br i1 %slt, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %ret9 = load ptr, ptr %ret, align 4
  %calltmp = call %Option @Some(ptr %ret9)
  ret %Option %calltmp

if.else:                                          ; preds = %if.cond.0
  %calltmp10 = call %Option @None()
  ret %Option %calltmp10
}

define %VecT @VecT_new(i32 %e_size, i32 %capa) {
entry:
  %e_size1 = alloca i32, align 4
  store i32 %e_size, ptr %e_size1, align 4
  %capa2 = alloca i32, align 4
  store i32 %capa, ptr %capa2, align 4
  %ret_val = alloca %VecT, align 8
  %v = alloca %VecT, align 8
  store %VecT zeroinitializer, ptr %v, align 4
  %vp = alloca ptr, align 4
  store ptr %v, ptr %vp, align 4
  %e_size3 = load i32, ptr %e_size1, align 4
  %capa4 = load i32, ptr %capa2, align 4
  %mul = mul i32 %e_size3, %capa4
  %malloc_call = call ptr @malloc(i32 %mul)
  %d = alloca ptr, align 4
  store ptr %malloc_call, ptr %d, align 4
  %d5 = load ptr, ptr %d, align 4
  %vp6 = load ptr, ptr %vp, align 4
  %access = getelementptr inbounds nuw %VecT, ptr %vp6, i32 0, i32 0
  store ptr %d5, ptr %access, align 4
  %e_size7 = load i32, ptr %e_size1, align 4
  %vp8 = load ptr, ptr %vp, align 4
  %access9 = getelementptr inbounds nuw %VecT, ptr %vp8, i32 0, i32 1
  store i32 %e_size7, ptr %access9, align 4
  %vp10 = load ptr, ptr %vp, align 4
  %access11 = getelementptr inbounds nuw %VecT, ptr %vp10, i32 0, i32 2
  store i32 0, ptr %access11, align 4
  %capa12 = load i32, ptr %capa2, align 4
  %vp13 = load ptr, ptr %vp, align 4
  %access14 = getelementptr inbounds nuw %VecT, ptr %vp13, i32 0, i32 3
  store i32 %capa12, ptr %access14, align 4
  %v15 = load %VecT, ptr %v, align 4
  ret %VecT %v15
}

define ptr @VecT_push(ptr %"&self", ptr %value) {
entry:
  %"&self1" = alloca ptr, align 4
  store ptr %"&self", ptr %"&self1", align 4
  %value2 = alloca ptr, align 4
  store ptr %value, ptr %value2, align 4
  %ret_val = alloca ptr, align 4
  %"&self3" = load ptr, ptr %"&self1", align 4
  %access = getelementptr inbounds nuw %VecT, ptr %"&self3", i32 0, i32 3
  %getmembervalue = load i32, ptr %access, align 4
  %"&self4" = load ptr, ptr %"&self1", align 4
  %access5 = getelementptr inbounds nuw %VecT, ptr %"&self4", i32 0, i32 2
  %getmembervalue6 = load i32, ptr %access5, align 4
  %eq = icmp eq i32 %getmembervalue, %getmembervalue6
  br i1 %eq, label %pending_true, label %pending_false

pending_true:                                     ; preds = %entry
  br label %capaover

pending_false:                                    ; preds = %entry
  br label %push

capaover:                                         ; preds = %pending_true
  %"&self7" = load ptr, ptr %"&self1", align 4
  %access8 = getelementptr inbounds nuw %VecT, ptr %"&self7", i32 0, i32 0
  %getmembervalue9 = load ptr, ptr %access8, align 4
  %"&self10" = load ptr, ptr %"&self1", align 4
  %access11 = getelementptr inbounds nuw %VecT, ptr %"&self10", i32 0, i32 1
  %getmembervalue12 = load i32, ptr %access11, align 4
  %"&self13" = load ptr, ptr %"&self1", align 4
  %access14 = getelementptr inbounds nuw %VecT, ptr %"&self13", i32 0, i32 3
  %getmembervalue15 = load i32, ptr %access14, align 4
  %add = add i32 %getmembervalue15, 1
  %mul = mul i32 %add, 2
  %mul16 = mul i32 %getmembervalue12, %mul
  %realloc_call = call ptr @realloc(ptr %getmembervalue9, i32 %mul16)
  %"&self17" = load ptr, ptr %"&self1", align 4
  %access18 = getelementptr inbounds nuw %VecT, ptr %"&self17", i32 0, i32 0
  store ptr %realloc_call, ptr %access18, align 4
  %"&self19" = load ptr, ptr %"&self1", align 4
  %access20 = getelementptr inbounds nuw %VecT, ptr %"&self19", i32 0, i32 3
  %getmembervalue21 = load i32, ptr %access20, align 4
  %add22 = add i32 %getmembervalue21, 1
  %mul23 = mul i32 %add22, 2
  %"&self24" = load ptr, ptr %"&self1", align 4
  %access25 = getelementptr inbounds nuw %VecT, ptr %"&self24", i32 0, i32 3
  store i32 %mul23, ptr %access25, align 4
  br label %push

push:                                             ; preds = %capaover, %pending_false
  %"&self26" = load ptr, ptr %"&self1", align 4
  %access27 = getelementptr inbounds nuw %VecT, ptr %"&self26", i32 0, i32 0
  %getmembervalue28 = load ptr, ptr %access27, align 4
  %"&self29" = load ptr, ptr %"&self1", align 4
  %access30 = getelementptr inbounds nuw %VecT, ptr %"&self29", i32 0, i32 2
  %getmembervalue31 = load i32, ptr %access30, align 4
  %"&self32" = load ptr, ptr %"&self1", align 4
  %access33 = getelementptr inbounds nuw %VecT, ptr %"&self32", i32 0, i32 1
  %getmembervalue34 = load i32, ptr %access33, align 4
  %mul35 = mul i32 %getmembervalue31, %getmembervalue34
  %idx_i64 = sext i32 %mul35 to i64
  %ptr_add = getelementptr i8, ptr %getmembervalue28, i64 %idx_i64
  %value36 = load ptr, ptr %value2, align 4
  %"&self37" = load ptr, ptr %"&self1", align 4
  %access38 = getelementptr inbounds nuw %VecT, ptr %"&self37", i32 0, i32 1
  %getmembervalue39 = load i32, ptr %access38, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %ptr_add, ptr align 1 %value36, i32 %getmembervalue39, i1 false)
  %"&self40" = load ptr, ptr %"&self1", align 4
  %access41 = getelementptr inbounds nuw %VecT, ptr %"&self40", i32 0, i32 2
  %getmembervalue42 = load i32, ptr %access41, align 4
  %add43 = add i32 %getmembervalue42, 1
  %"&self44" = load ptr, ptr %"&self1", align 4
  %access45 = getelementptr inbounds nuw %VecT, ptr %"&self44", i32 0, i32 2
  store i32 %add43, ptr %access45, align 4
  %value46 = load ptr, ptr %value2, align 4
  ret ptr %value46
}

define ptr @VecT_get(%VecT %self, i32 %indx) {
entry:
  %self1 = alloca %VecT, align 8
  store %VecT %self, ptr %self1, align 4
  %indx2 = alloca i32, align 4
  store i32 %indx, ptr %indx2, align 4
  %ret_val = alloca ptr, align 4
  %self3 = load %VecT, ptr %self1, align 4
  %access = getelementptr inbounds nuw %VecT, ptr %self1, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  %indx4 = load i32, ptr %indx2, align 4
  %self5 = load %VecT, ptr %self1, align 4
  %access6 = getelementptr inbounds nuw %VecT, ptr %self1, i32 0, i32 1
  %getmembervalue7 = load i32, ptr %access6, align 4
  %mul = mul i32 %indx4, %getmembervalue7
  %idx_i64 = sext i32 %mul to i64
  %ptr_add = getelementptr i8, ptr %getmembervalue, i64 %idx_i64
  ret ptr %ptr_add
}

define void @VecT_free(ptr %"&self") {
entry:
  %"&self1" = alloca ptr, align 4
  store ptr %"&self", ptr %"&self1", align 4
  %"&self2" = load ptr, ptr %"&self1", align 4
  %access = getelementptr inbounds nuw %VecT, ptr %"&self2", i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  call void @free(ptr %getmembervalue)
  %"&self3" = load ptr, ptr %"&self1", align 4
  %access4 = getelementptr inbounds nuw %VecT, ptr %"&self3", i32 0, i32 2
  store i32 0, ptr %access4, align 4
  %"&self5" = load ptr, ptr %"&self1", align 4
  %access6 = getelementptr inbounds nuw %VecT, ptr %"&self5", i32 0, i32 3
  store i32 0, ptr %access6, align 4
  ret void
}

define %VecT @VecT_from(ptr %srcData, i32 %e_size, i32 %size) {
entry:
  %srcData1 = alloca ptr, align 4
  store ptr %srcData, ptr %srcData1, align 4
  %e_size2 = alloca i32, align 4
  store i32 %e_size, ptr %e_size2, align 4
  %size3 = alloca i32, align 4
  store i32 %size, ptr %size3, align 4
  %ret_val = alloca %VecT, align 8
  %v = alloca %VecT, align 8
  store %VecT zeroinitializer, ptr %v, align 4
  %vp = alloca ptr, align 4
  store ptr %v, ptr %vp, align 4
  %e_size4 = load i32, ptr %e_size2, align 4
  %size5 = load i32, ptr %size3, align 4
  %mul = mul i32 %e_size4, %size5
  %malloc_call = call ptr @malloc(i32 %mul)
  %d = alloca ptr, align 4
  store ptr %malloc_call, ptr %d, align 4
  %d6 = load ptr, ptr %d, align 4
  %srcData7 = load ptr, ptr %srcData1, align 4
  %e_size8 = load i32, ptr %e_size2, align 4
  %size9 = load i32, ptr %size3, align 4
  %mul10 = mul i32 %e_size8, %size9
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %d6, ptr align 1 %srcData7, i32 %mul10, i1 false)
  %d11 = load ptr, ptr %d, align 4
  %vp12 = load ptr, ptr %vp, align 4
  %access = getelementptr inbounds nuw %VecT, ptr %vp12, i32 0, i32 0
  store ptr %d11, ptr %access, align 4
  %e_size13 = load i32, ptr %e_size2, align 4
  %vp14 = load ptr, ptr %vp, align 4
  %access15 = getelementptr inbounds nuw %VecT, ptr %vp14, i32 0, i32 1
  store i32 %e_size13, ptr %access15, align 4
  %size16 = load i32, ptr %size3, align 4
  %vp17 = load ptr, ptr %vp, align 4
  %access18 = getelementptr inbounds nuw %VecT, ptr %vp17, i32 0, i32 2
  store i32 %size16, ptr %access18, align 4
  %size19 = load i32, ptr %size3, align 4
  %vp20 = load ptr, ptr %vp, align 4
  %access21 = getelementptr inbounds nuw %VecT, ptr %vp20, i32 0, i32 3
  store i32 %size19, ptr %access21, align 4
  %v22 = load %VecT, ptr %v, align 4
  ret %VecT %v22
}

define ptr @VecT_connect(ptr %"&self", ptr %value) {
entry:
  %"&self1" = alloca ptr, align 4
  store ptr %"&self", ptr %"&self1", align 4
  %value2 = alloca ptr, align 4
  store ptr %value, ptr %value2, align 4
  %ret_val = alloca ptr, align 4
  %"&self3" = load ptr, ptr %"&self1", align 4
  %access = getelementptr inbounds nuw %VecT, ptr %"&self3", i32 0, i32 2
  %getmembervalue = load i32, ptr %access, align 4
  %value4 = load ptr, ptr %value2, align 4
  %access5 = getelementptr inbounds nuw %VecT, ptr %value4, i32 0, i32 2
  %getmembervalue6 = load i32, ptr %access5, align 4
  %add = add i32 %getmembervalue, %getmembervalue6
  %newlen = alloca i32, align 4
  store i32 %add, ptr %newlen, align 4
  %newlen7 = load i32, ptr %newlen, align 4
  %"&self8" = load ptr, ptr %"&self1", align 4
  %access9 = getelementptr inbounds nuw %VecT, ptr %"&self8", i32 0, i32 1
  %getmembervalue10 = load i32, ptr %access9, align 4
  %mul = mul i32 %newlen7, %getmembervalue10
  %needed = alloca i32, align 4
  store i32 %mul, ptr %needed, align 4
  br label %loop_start-capaover

loop_start-capaover:                              ; preds = %entry
  br label %continue-capaover

continue-capaover:                                ; preds = %no_judge_continue-capaover, %loop_start-capaover
  %"&self11" = load ptr, ptr %"&self1", align 4
  %access12 = getelementptr inbounds nuw %VecT, ptr %"&self11", i32 0, i32 3
  %getmembervalue13 = load i32, ptr %access12, align 4
  %newlen14 = load i32, ptr %newlen, align 4
  %sle = icmp sle i32 %getmembervalue13, %newlen14
  br i1 %sle, label %no_judge_continue-capaover, label %break-capaover

no_judge_continue-capaover:                       ; preds = %continue-capaover
  %newlen15 = load i32, ptr %newlen, align 4
  %mul16 = mul i32 %newlen15, 2
  %newcap = alloca i32, align 4
  store i32 %mul16, ptr %newcap, align 4
  %"&self17" = load ptr, ptr %"&self1", align 4
  %access18 = getelementptr inbounds nuw %VecT, ptr %"&self17", i32 0, i32 0
  %getmembervalue19 = load ptr, ptr %access18, align 4
  %newcap20 = load i32, ptr %newcap, align 4
  %"&self21" = load ptr, ptr %"&self1", align 4
  %access22 = getelementptr inbounds nuw %VecT, ptr %"&self21", i32 0, i32 1
  %getmembervalue23 = load i32, ptr %access22, align 4
  %mul24 = mul i32 %newcap20, %getmembervalue23
  %realloc_call = call ptr @realloc(ptr %getmembervalue19, i32 %mul24)
  %"&self25" = load ptr, ptr %"&self1", align 4
  %access26 = getelementptr inbounds nuw %VecT, ptr %"&self25", i32 0, i32 0
  %getmembervalue27 = load ptr, ptr %access26, align 4
  store ptr %realloc_call, ptr %access26, align 4
  %newcap28 = load i32, ptr %newcap, align 4
  %"&self29" = load ptr, ptr %"&self1", align 4
  %access30 = getelementptr inbounds nuw %VecT, ptr %"&self29", i32 0, i32 3
  %getmembervalue31 = load i32, ptr %access30, align 4
  store i32 %newcap28, ptr %access30, align 4
  br label %break-capaover
  br label %continue-capaover

break-capaover:                                   ; preds = %no_judge_continue-capaover, %continue-capaover
  %"&self32" = load ptr, ptr %"&self1", align 4
  %access33 = getelementptr inbounds nuw %VecT, ptr %"&self32", i32 0, i32 0
  %getmembervalue34 = load ptr, ptr %access33, align 4
  %"&self35" = load ptr, ptr %"&self1", align 4
  %access36 = getelementptr inbounds nuw %VecT, ptr %"&self35", i32 0, i32 2
  %getmembervalue37 = load i32, ptr %access36, align 4
  %"&self38" = load ptr, ptr %"&self1", align 4
  %access39 = getelementptr inbounds nuw %VecT, ptr %"&self38", i32 0, i32 1
  %getmembervalue40 = load i32, ptr %access39, align 4
  %mul41 = mul i32 %getmembervalue37, %getmembervalue40
  %idx_i64 = sext i32 %mul41 to i64
  %ptr_add = getelementptr i8, ptr %getmembervalue34, i64 %idx_i64
  %value42 = load ptr, ptr %value2, align 4
  %access43 = getelementptr inbounds nuw %VecT, ptr %value42, i32 0, i32 0
  %getmembervalue44 = load ptr, ptr %access43, align 4
  %value45 = load ptr, ptr %value2, align 4
  %access46 = getelementptr inbounds nuw %VecT, ptr %value45, i32 0, i32 2
  %getmembervalue47 = load i32, ptr %access46, align 4
  %value48 = load ptr, ptr %value2, align 4
  %access49 = getelementptr inbounds nuw %VecT, ptr %value48, i32 0, i32 1
  %getmembervalue50 = load i32, ptr %access49, align 4
  %mul51 = mul i32 %getmembervalue47, %getmembervalue50
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %ptr_add, ptr align 1 %getmembervalue44, i32 %mul51, i1 false)
  %newlen52 = load i32, ptr %newlen, align 4
  %"&self53" = load ptr, ptr %"&self1", align 4
  %access54 = getelementptr inbounds nuw %VecT, ptr %"&self53", i32 0, i32 2
  %getmembervalue55 = load i32, ptr %access54, align 4
  store i32 %newlen52, ptr %access54, align 4
  %value56 = load ptr, ptr %value2, align 4
  ret ptr %value56
}

define %VecT @VecT_rangei64(i64 %start, i64 %end, i64 %step) {
entry:
  %start1 = alloca i64, align 8
  store i64 %start, ptr %start1, align 8
  %end2 = alloca i64, align 8
  store i64 %end, ptr %end2, align 8
  %step3 = alloca i64, align 8
  store i64 %step, ptr %step3, align 8
  %ret_val = alloca %VecT, align 8
  %end4 = load i64, ptr %end2, align 8
  %start5 = load i64, ptr %start1, align 8
  %sub = sub i64 %end4, %start5
  %step6 = load i64, ptr %step3, align 8
  %div = sdiv i64 %sub, %step6
  %trunc = trunc i64 %div to i32
  %calltmp = call %VecT @VecT_new(i32 8, i32 %trunc)
  %v = alloca %VecT, align 8
  store %VecT %calltmp, ptr %v, align 4
  %start7 = load i64, ptr %start1, align 8
  %i = alloca i64, align 8
  store i64 %start7, ptr %i, align 8
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %i8 = load i64, ptr %i, align 8
  %end9 = load i64, ptr %end2, align 8
  %slt = icmp slt i64 %i8, %end9
  br i1 %slt, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %calltmp10 = call ptr @VecT_push(ptr %v, ptr %i)
  %i11 = load i64, ptr %i, align 8
  %step12 = load i64, ptr %step3, align 8
  %add = add i64 %i11, %step12
  store i64 %add, ptr %i, align 8
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %v13 = load %VecT, ptr %v, align 4
  ret %VecT %v13
}

define %Iterator @VecT_iter(%VecT %vec) {
entry:
  %vec1 = alloca %VecT, align 8
  store %VecT %vec, ptr %vec1, align 4
  %ret_val = alloca %Iterator, align 8
  %vec2 = load %VecT, ptr %vec1, align 4
  %access = getelementptr inbounds nuw %VecT, ptr %vec1, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  %vec3 = load %VecT, ptr %vec1, align 4
  %vec4 = load %VecT, ptr %vec1, align 4
  %access5 = getelementptr inbounds nuw %VecT, ptr %vec1, i32 0, i32 2
  %getmembervalue6 = load i32, ptr %access5, align 4
  %calltmp = call ptr @VecT_get(%VecT %vec3, i32 %getmembervalue6)
  %vec7 = load %VecT, ptr %vec1, align 4
  %access8 = getelementptr inbounds nuw %VecT, ptr %vec1, i32 0, i32 1
  %getmembervalue9 = load i32, ptr %access8, align 4
  %calltmp10 = call %Iterator @iter(ptr %getmembervalue, ptr %calltmp, i32 %getmembervalue9)
  ret %Iterator %calltmp10
}

define %Slice @Slice_new(ptr %value, i32 %len) {
entry:
  %value1 = alloca ptr, align 4
  store ptr %value, ptr %value1, align 4
  %len2 = alloca i32, align 4
  store i32 %len, ptr %len2, align 4
  %ret_val = alloca %Slice, align 8
  %slice = alloca %Slice, align 8
  store %Slice zeroinitializer, ptr %slice, align 4
  %value3 = load ptr, ptr %value1, align 4
  %slice4 = load %Slice, ptr %slice, align 4
  %access = getelementptr inbounds nuw %Slice, ptr %slice, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  store ptr %value3, ptr %access, align 4
  %len5 = load i32, ptr %len2, align 4
  %slice6 = load %Slice, ptr %slice, align 4
  %access7 = getelementptr inbounds nuw %Slice, ptr %slice, i32 0, i32 1
  %getmembervalue8 = load i32, ptr %access7, align 4
  store i32 %len5, ptr %access7, align 4
  %slice9 = load %Slice, ptr %slice, align 4
  ret %Slice %slice9
}

declare i32 @strcmp(ptr, ptr)

define %StrSlice @StrSlice_new(ptr %data, i32 %len) {
entry:
  %data1 = alloca ptr, align 4
  store ptr %data, ptr %data1, align 4
  %len2 = alloca i32, align 4
  store i32 %len, ptr %len2, align 4
  %ret_val = alloca %StrSlice, align 8
  %new = alloca %StrSlice, align 8
  store %StrSlice zeroinitializer, ptr %new, align 4
  %data3 = load ptr, ptr %data1, align 4
  %new4 = load %StrSlice, ptr %new, align 4
  %access = getelementptr inbounds nuw %StrSlice, ptr %new, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  store ptr %data3, ptr %access, align 4
  %len5 = load i32, ptr %len2, align 4
  %new6 = load %StrSlice, ptr %new, align 4
  %access7 = getelementptr inbounds nuw %StrSlice, ptr %new, i32 0, i32 1
  %getmembervalue8 = load i32, ptr %access7, align 4
  store i32 %len5, ptr %access7, align 4
  %new9 = load %StrSlice, ptr %new, align 4
  ret %StrSlice %new9
}

define %String @String_new(i32 %capa) {
entry:
  %capa1 = alloca i32, align 4
  store i32 %capa, ptr %capa1, align 4
  %ret_val = alloca %String, align 8
  %v = alloca %String, align 8
  store %String zeroinitializer, ptr %v, align 4
  %vp = alloca ptr, align 4
  store ptr %v, ptr %vp, align 4
  %capa2 = load i32, ptr %capa1, align 4
  %add = add i32 %capa2, 1
  %malloc_call = call ptr @malloc(i32 %add)
  %d = alloca ptr, align 4
  store ptr %malloc_call, ptr %d, align 4
  %d3 = load ptr, ptr %d, align 4
  %vp4 = load ptr, ptr %vp, align 4
  %access = getelementptr inbounds nuw %String, ptr %vp4, i32 0, i32 0
  store ptr %d3, ptr %access, align 4
  %vp5 = load ptr, ptr %vp, align 4
  %access6 = getelementptr inbounds nuw %String, ptr %vp5, i32 0, i32 1
  store i32 0, ptr %access6, align 4
  %capa7 = load i32, ptr %capa1, align 4
  %vp8 = load ptr, ptr %vp, align 4
  %access9 = getelementptr inbounds nuw %String, ptr %vp8, i32 0, i32 2
  store i32 %capa7, ptr %access9, align 4
  %v10 = load %String, ptr %v, align 4
  ret %String %v10
}

define i32 @String_strlen(ptr %c) {
entry:
  %c1 = alloca ptr, align 4
  store ptr %c, ptr %c1, align 4
  %ret_val = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, ptr %i, align 4
  br label %LoopStart

LoopStart:                                        ; preds = %InLoop, %entry
  %c2 = load ptr, ptr %c1, align 4
  %i3 = load i32, ptr %i, align 4
  %idx_i64 = sext i32 %i3 to i64
  %idx_ptr = getelementptr i8, ptr %c2, i64 %idx_i64
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  %eq = icmp eq i8 %"idx[]_load", 0
  br i1 %eq, label %pending_true, label %pending_false

pending_true:                                     ; preds = %LoopStart
  br label %Break

pending_false:                                    ; preds = %LoopStart
  br label %InLoop

InLoop:                                           ; preds = %pending_false
  %i4 = load i32, ptr %i, align 4
  %add = add i32 %i4, 1
  store i32 %add, ptr %i, align 4
  br label %LoopStart

Break:                                            ; preds = %pending_true
  %i5 = load i32, ptr %i, align 4
  ret i32 %i5
}

define %StrSlice @StrSlice_from(ptr %c) {
entry:
  %c1 = alloca ptr, align 4
  store ptr %c, ptr %c1, align 4
  %ret_val = alloca %StrSlice, align 8
  %c2 = load ptr, ptr %c1, align 4
  %calltmp = call i32 @String_strlen(ptr %c2)
  %c_len = alloca i32, align 4
  store i32 %calltmp, ptr %c_len, align 4
  %c3 = load ptr, ptr %c1, align 4
  %c_len4 = load i32, ptr %c_len, align 4
  %calltmp5 = call %StrSlice @StrSlice_new(ptr %c3, i32 %c_len4)
  ret %StrSlice %calltmp5
}

define %String @String_from(ptr %c) {
entry:
  %c1 = alloca ptr, align 4
  store ptr %c, ptr %c1, align 4
  %ret_val = alloca %String, align 8
  %v = alloca %String, align 8
  store %String zeroinitializer, ptr %v, align 4
  %vp = alloca ptr, align 4
  store ptr %v, ptr %vp, align 4
  %c2 = load ptr, ptr %c1, align 4
  %calltmp = call i32 @String_strlen(ptr %c2)
  %c_len = alloca i32, align 4
  store i32 %calltmp, ptr %c_len, align 4
  %c_len3 = load i32, ptr %c_len, align 4
  %add = add i32 %c_len3, 1
  %malloc_call = call ptr @malloc(i32 %add)
  %d = alloca ptr, align 4
  store ptr %malloc_call, ptr %d, align 4
  %d4 = load ptr, ptr %d, align 4
  %vp5 = load ptr, ptr %vp, align 4
  %access = getelementptr inbounds nuw %String, ptr %vp5, i32 0, i32 0
  store ptr %d4, ptr %access, align 4
  %c_len6 = load i32, ptr %c_len, align 4
  %vp7 = load ptr, ptr %vp, align 4
  %access8 = getelementptr inbounds nuw %String, ptr %vp7, i32 0, i32 1
  store i32 %c_len6, ptr %access8, align 4
  %c_len9 = load i32, ptr %c_len, align 4
  %vp10 = load ptr, ptr %vp, align 4
  %access11 = getelementptr inbounds nuw %String, ptr %vp10, i32 0, i32 2
  store i32 %c_len9, ptr %access11, align 4
  %vp12 = load ptr, ptr %vp, align 4
  %access13 = getelementptr inbounds nuw %String, ptr %vp12, i32 0, i32 0
  %deref = load ptr, ptr %access13, align 4
  %c14 = load ptr, ptr %c1, align 4
  %c_len15 = load i32, ptr %c_len, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %deref, ptr align 1 %c14, i32 %c_len15, i1 false)
  %vp16 = load ptr, ptr %vp, align 4
  %access17 = getelementptr inbounds nuw %String, ptr %vp16, i32 0, i32 0
  %deref18 = load ptr, ptr %access17, align 4
  %vp19 = load ptr, ptr %vp, align 4
  %access20 = getelementptr inbounds nuw %String, ptr %vp19, i32 0, i32 1
  %deref21 = load i32, ptr %access20, align 4
  %idx_i64 = sext i32 %deref21 to i64
  %idx_ptr = getelementptr i8, ptr %deref18, i64 %idx_i64
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  store i8 0, ptr %idx_ptr, align 1
  %v22 = load %String, ptr %v, align 4
  ret %String %v22
}

define %String @String_from_with_len(ptr %c, i32 %len) {
entry:
  %c1 = alloca ptr, align 4
  store ptr %c, ptr %c1, align 4
  %len2 = alloca i32, align 4
  store i32 %len, ptr %len2, align 4
  %ret_val = alloca %String, align 8
  %v = alloca %String, align 8
  store %String zeroinitializer, ptr %v, align 4
  %vp = alloca ptr, align 4
  store ptr %v, ptr %vp, align 4
  %len3 = load i32, ptr %len2, align 4
  %c_len = alloca i32, align 4
  store i32 %len3, ptr %c_len, align 4
  %c_len4 = load i32, ptr %c_len, align 4
  %add = add i32 %c_len4, 1
  %malloc_call = call ptr @malloc(i32 %add)
  %d = alloca ptr, align 4
  store ptr %malloc_call, ptr %d, align 4
  %d5 = load ptr, ptr %d, align 4
  %vp6 = load ptr, ptr %vp, align 4
  %access = getelementptr inbounds nuw %String, ptr %vp6, i32 0, i32 0
  store ptr %d5, ptr %access, align 4
  %c_len7 = load i32, ptr %c_len, align 4
  %vp8 = load ptr, ptr %vp, align 4
  %access9 = getelementptr inbounds nuw %String, ptr %vp8, i32 0, i32 1
  store i32 %c_len7, ptr %access9, align 4
  %c_len10 = load i32, ptr %c_len, align 4
  %vp11 = load ptr, ptr %vp, align 4
  %access12 = getelementptr inbounds nuw %String, ptr %vp11, i32 0, i32 2
  store i32 %c_len10, ptr %access12, align 4
  %vp13 = load ptr, ptr %vp, align 4
  %access14 = getelementptr inbounds nuw %String, ptr %vp13, i32 0, i32 0
  %deref = load ptr, ptr %access14, align 4
  %c15 = load ptr, ptr %c1, align 4
  %c_len16 = load i32, ptr %c_len, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %deref, ptr align 1 %c15, i32 %c_len16, i1 false)
  %vp17 = load ptr, ptr %vp, align 4
  %access18 = getelementptr inbounds nuw %String, ptr %vp17, i32 0, i32 0
  %deref19 = load ptr, ptr %access18, align 4
  %vp20 = load ptr, ptr %vp, align 4
  %access21 = getelementptr inbounds nuw %String, ptr %vp20, i32 0, i32 1
  %deref22 = load i32, ptr %access21, align 4
  %idx_i64 = sext i32 %deref22 to i64
  %idx_ptr = getelementptr i8, ptr %deref19, i64 %idx_i64
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  store i8 0, ptr %idx_ptr, align 1
  %v23 = load %String, ptr %v, align 4
  ret %String %v23
}

define ptr @String_push(ptr %"&self", ptr %value) {
entry:
  %"&self1" = alloca ptr, align 4
  store ptr %"&self", ptr %"&self1", align 4
  %value2 = alloca ptr, align 4
  store ptr %value, ptr %value2, align 4
  %ret_val = alloca ptr, align 4
  %"&self3" = load ptr, ptr %"&self1", align 4
  %access = getelementptr inbounds nuw %String, ptr %"&self3", i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %value4 = load ptr, ptr %value2, align 4
  %access5 = getelementptr inbounds nuw %String, ptr %value4, i32 0, i32 1
  %getmembervalue6 = load i32, ptr %access5, align 4
  %add = add i32 %getmembervalue, %getmembervalue6
  %needed = alloca i32, align 4
  store i32 %add, ptr %needed, align 4
  br label %loop_start-capaover

loop_start-capaover:                              ; preds = %entry
  br label %continue-capaover

continue-capaover:                                ; preds = %no_judge_continue-capaover, %loop_start-capaover
  %"&self7" = load ptr, ptr %"&self1", align 4
  %access8 = getelementptr inbounds nuw %String, ptr %"&self7", i32 0, i32 2
  %getmembervalue9 = load i32, ptr %access8, align 4
  %needed10 = load i32, ptr %needed, align 4
  %add11 = add i32 %needed10, 1
  %slt = icmp slt i32 %getmembervalue9, %add11
  br i1 %slt, label %no_judge_continue-capaover, label %break-capaover

no_judge_continue-capaover:                       ; preds = %continue-capaover
  %needed12 = load i32, ptr %needed, align 4
  %mul = mul i32 %needed12, 2
  %newcap = alloca i32, align 4
  store i32 %mul, ptr %newcap, align 4
  %"&self13" = load ptr, ptr %"&self1", align 4
  %access14 = getelementptr inbounds nuw %String, ptr %"&self13", i32 0, i32 0
  %getmembervalue15 = load ptr, ptr %access14, align 4
  %newcap16 = load i32, ptr %newcap, align 4
  %add17 = add i32 %newcap16, 1
  %realloc_call = call ptr @realloc(ptr %getmembervalue15, i32 %add17)
  %"&self18" = load ptr, ptr %"&self1", align 4
  %access19 = getelementptr inbounds nuw %String, ptr %"&self18", i32 0, i32 0
  %getmembervalue20 = load ptr, ptr %access19, align 4
  store ptr %realloc_call, ptr %access19, align 4
  %newcap21 = load i32, ptr %newcap, align 4
  %"&self22" = load ptr, ptr %"&self1", align 4
  %access23 = getelementptr inbounds nuw %String, ptr %"&self22", i32 0, i32 2
  %getmembervalue24 = load i32, ptr %access23, align 4
  store i32 %newcap21, ptr %access23, align 4
  br label %break-capaover
  br label %continue-capaover

break-capaover:                                   ; preds = %no_judge_continue-capaover, %continue-capaover
  %"&self25" = load ptr, ptr %"&self1", align 4
  %access26 = getelementptr inbounds nuw %String, ptr %"&self25", i32 0, i32 0
  %getmembervalue27 = load ptr, ptr %access26, align 4
  %"&self28" = load ptr, ptr %"&self1", align 4
  %access29 = getelementptr inbounds nuw %String, ptr %"&self28", i32 0, i32 1
  %getmembervalue30 = load i32, ptr %access29, align 4
  %idx_i64 = sext i32 %getmembervalue30 to i64
  %ptr_add = getelementptr i8, ptr %getmembervalue27, i64 %idx_i64
  %value31 = load ptr, ptr %value2, align 4
  %access32 = getelementptr inbounds nuw %String, ptr %value31, i32 0, i32 0
  %getmembervalue33 = load ptr, ptr %access32, align 4
  %value34 = load ptr, ptr %value2, align 4
  %access35 = getelementptr inbounds nuw %String, ptr %value34, i32 0, i32 1
  %getmembervalue36 = load i32, ptr %access35, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %ptr_add, ptr align 1 %getmembervalue33, i32 %getmembervalue36, i1 false)
  %needed37 = load i32, ptr %needed, align 4
  %"&self38" = load ptr, ptr %"&self1", align 4
  %access39 = getelementptr inbounds nuw %String, ptr %"&self38", i32 0, i32 1
  %getmembervalue40 = load i32, ptr %access39, align 4
  store i32 %needed37, ptr %access39, align 4
  %"&self41" = load ptr, ptr %"&self1", align 4
  %access42 = getelementptr inbounds nuw %String, ptr %"&self41", i32 0, i32 0
  %deref = load ptr, ptr %access42, align 4
  %"&self43" = load ptr, ptr %"&self1", align 4
  %access44 = getelementptr inbounds nuw %String, ptr %"&self43", i32 0, i32 1
  %deref45 = load i32, ptr %access44, align 4
  %idx_i6446 = sext i32 %deref45 to i64
  %idx_ptr = getelementptr i8, ptr %deref, i64 %idx_i6446
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  store i8 0, ptr %idx_ptr, align 1
  %"&self47" = load ptr, ptr %"&self1", align 4
  ret ptr %"&self47"
}

define i8 @String_get(%String %self, i32 %indx) {
entry:
  %self1 = alloca %String, align 8
  store %String %self, ptr %self1, align 4
  %indx2 = alloca i32, align 4
  store i32 %indx, ptr %indx2, align 4
  %ret_val = alloca i8, align 1
  %self3 = load %String, ptr %self1, align 4
  %access = getelementptr inbounds nuw %String, ptr %self1, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  %indx4 = load i32, ptr %indx2, align 4
  %idx_i64 = sext i32 %indx4 to i64
  %idx_ptr = getelementptr i8, ptr %getmembervalue, i64 %idx_i64
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  ret i8 %"idx[]_load"
}

define void @String_free(ptr %"&self") {
entry:
  %"&self1" = alloca ptr, align 4
  store ptr %"&self", ptr %"&self1", align 4
  %"&self2" = load ptr, ptr %"&self1", align 4
  %access = getelementptr inbounds nuw %String, ptr %"&self2", i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  call void @free(ptr %getmembervalue)
  %"&self3" = load ptr, ptr %"&self1", align 4
  %access4 = getelementptr inbounds nuw %String, ptr %"&self3", i32 0, i32 1
  store i32 0, ptr %access4, align 4
  %"&self5" = load ptr, ptr %"&self1", align 4
  %access6 = getelementptr inbounds nuw %String, ptr %"&self5", i32 0, i32 2
  store i32 0, ptr %access6, align 4
  ret void
}

define i64 @str_cmp(ptr %str1, ptr %str2) {
entry:
  %str11 = alloca ptr, align 4
  store ptr %str1, ptr %str11, align 4
  %str22 = alloca ptr, align 4
  store ptr %str2, ptr %str22, align 4
  %ret_val = alloca i64, align 8
  %str13 = load ptr, ptr %str11, align 4
  %str24 = load ptr, ptr %str22, align 4
  %calltmp = call i32 @strcmp(ptr %str13, ptr %str24)
  %i32_to_i64 = sext i32 %calltmp to i64
  ret i64 %i32_to_i64
}

define i64 @String_cmp(%String %string1, %String %string2) {
entry:
  %string11 = alloca %String, align 8
  store %String %string1, ptr %string11, align 4
  %string22 = alloca %String, align 8
  store %String %string2, ptr %string22, align 4
  %ret_val = alloca i64, align 8
  %string13 = load %String, ptr %string11, align 4
  %access = getelementptr inbounds nuw %String, ptr %string11, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  %string24 = load %String, ptr %string22, align 4
  %access5 = getelementptr inbounds nuw %String, ptr %string22, i32 0, i32 0
  %getmembervalue6 = load ptr, ptr %access5, align 4
  %calltmp = call i32 @strcmp(ptr %getmembervalue, ptr %getmembervalue6)
  %i32_to_i64 = sext i32 %calltmp to i64
  ret i64 %i32_to_i64
}

define i1 @str_eq(ptr %str1, ptr %str2) {
entry:
  %str11 = alloca ptr, align 4
  store ptr %str1, ptr %str11, align 4
  %str22 = alloca ptr, align 4
  store ptr %str2, ptr %str22, align 4
  %ret_val = alloca i1, align 1
  %str13 = load ptr, ptr %str11, align 4
  %str24 = load ptr, ptr %str22, align 4
  %calltmp = call i32 @strcmp(ptr %str13, ptr %str24)
  %eq = icmp eq i32 %calltmp, 0
  ret i1 %eq
}

define %VecT @String_to_VecT(%String %string) {
entry:
  %string1 = alloca %String, align 8
  store %String %string, ptr %string1, align 4
  %ret_val = alloca %VecT, align 8
  %string2 = load %String, ptr %string1, align 4
  %access = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  %string3 = load %String, ptr %string1, align 4
  %access4 = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 1
  %getmembervalue5 = load i32, ptr %access4, align 4
  %calltmp = call %VecT @VecT_from(ptr %getmembervalue, i32 1, i32 %getmembervalue5)
  ret %VecT %calltmp
}

define %String @String_clone(%String %string) {
entry:
  %string1 = alloca %String, align 8
  store %String %string, ptr %string1, align 4
  %ret_val = alloca %String, align 8
  %clone = alloca %String, align 8
  store %String zeroinitializer, ptr %clone, align 4
  %string2 = load %String, ptr %string1, align 4
  %access = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %clone3 = load %String, ptr %clone, align 4
  %access4 = getelementptr inbounds nuw %String, ptr %clone, i32 0, i32 1
  %getmembervalue5 = load i32, ptr %access4, align 4
  store i32 %getmembervalue, ptr %access4, align 4
  %string6 = load %String, ptr %string1, align 4
  %access7 = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 2
  %getmembervalue8 = load i32, ptr %access7, align 4
  %clone9 = load %String, ptr %clone, align 4
  %access10 = getelementptr inbounds nuw %String, ptr %clone, i32 0, i32 2
  %getmembervalue11 = load i32, ptr %access10, align 4
  store i32 %getmembervalue8, ptr %access10, align 4
  %string12 = load %String, ptr %string1, align 4
  %access13 = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 2
  %getmembervalue14 = load i32, ptr %access13, align 4
  %add = add i32 %getmembervalue14, 1
  %malloc_call = call ptr @malloc(i32 %add)
  %d = alloca ptr, align 4
  store ptr %malloc_call, ptr %d, align 4
  %d15 = load ptr, ptr %d, align 4
  %string16 = load %String, ptr %string1, align 4
  %access17 = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 0
  %getmembervalue18 = load ptr, ptr %access17, align 4
  %string19 = load %String, ptr %string1, align 4
  %access20 = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 1
  %getmembervalue21 = load i32, ptr %access20, align 4
  %add22 = add i32 %getmembervalue21, 1
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %d15, ptr align 1 %getmembervalue18, i32 %add22, i1 false)
  %d23 = load ptr, ptr %d, align 4
  %clone24 = load %String, ptr %clone, align 4
  %access25 = getelementptr inbounds nuw %String, ptr %clone, i32 0, i32 0
  %getmembervalue26 = load ptr, ptr %access25, align 4
  store ptr %d23, ptr %access25, align 4
  %clone27 = load %String, ptr %clone, align 4
  ret %String %clone27
}

define ptr @String_as_str(%String %string) {
entry:
  %string1 = alloca %String, align 8
  store %String %string, ptr %string1, align 4
  %ret_val = alloca ptr, align 4
  %string2 = load %String, ptr %string1, align 4
  %access = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  ret ptr %getmembervalue
}

define ptr @StrSlice_as_str(%StrSlice %str) {
entry:
  %str1 = alloca %StrSlice, align 8
  store %StrSlice %str, ptr %str1, align 4
  %ret_val = alloca ptr, align 4
  %str2 = load %StrSlice, ptr %str1, align 4
  %access = getelementptr inbounds nuw %StrSlice, ptr %str1, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  ret ptr %getmembervalue
}

define %StrSlice @String_as_StrSlice(%String %string) {
entry:
  %string1 = alloca %String, align 8
  store %String %string, ptr %string1, align 4
  %ret_val = alloca %StrSlice, align 8
  %string2 = load %String, ptr %string1, align 4
  %calltmp = call ptr @String_as_str(%String %string2)
  %string3 = load %String, ptr %string1, align 4
  %access = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %calltmp4 = call %StrSlice @StrSlice_new(ptr %calltmp, i32 %getmembervalue)
  ret %StrSlice %calltmp4
}

define %String @StrSlice_to_String(%StrSlice %str) {
entry:
  %str1 = alloca %StrSlice, align 8
  store %StrSlice %str, ptr %str1, align 4
  %ret_val = alloca %String, align 8
  %str2 = load %StrSlice, ptr %str1, align 4
  %calltmp = call ptr @StrSlice_as_str(%StrSlice %str2)
  %str3 = load %StrSlice, ptr %str1, align 4
  %access = getelementptr inbounds nuw %StrSlice, ptr %str1, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %calltmp4 = call %String @String_from_with_len(ptr %calltmp, i32 %getmembervalue)
  ret %String %calltmp4
}

define i1 @is_space(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %ret_val = alloca i1, align 1
  %c2 = load i8, ptr %c1, align 1
  %eq = icmp eq i8 %c2, 32
  %c3 = load i8, ptr %c1, align 1
  %eq4 = icmp eq i8 %c3, 10
  %or = or i1 %eq, %eq4
  %c5 = load i8, ptr %c1, align 1
  %eq6 = icmp eq i8 %c5, 9
  %or7 = or i1 %or, %eq6
  %c8 = load i8, ptr %c1, align 1
  %eq9 = icmp eq i8 %c8, 13
  %or10 = or i1 %or7, %eq9
  ret i1 %or10
}

define %StrSlice @str_trim(ptr %str) {
entry:
  %str1 = alloca ptr, align 4
  store ptr %str, ptr %str1, align 4
  %ret_val = alloca %StrSlice, align 8
  %start = alloca i32, align 4
  store i32 0, ptr %start, align 4
  br label %loop_start-start

loop_start-start:                                 ; preds = %entry
  br label %continue-start

continue-start:                                   ; preds = %if.end, %loop_start-start
  br i1 true, label %no_judge_continue-start, label %break-start

no_judge_continue-start:                          ; preds = %continue-start
  %str2 = load ptr, ptr %str1, align 4
  %start3 = load i32, ptr %start, align 4
  %idx_i64 = sext i32 %start3 to i64
  %idx_ptr = getelementptr i8, ptr %str2, i64 %idx_i64
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  %c = alloca i8, align 1
  store i8 %"idx[]_load", ptr %c, align 1
  br label %if.cond.0

break-start:                                      ; preds = %if.else, %continue-start
  %str6 = load ptr, ptr %str1, align 4
  %start7 = load i32, ptr %start, align 4
  %idx_i648 = sext i32 %start7 to i64
  %ptr_add = getelementptr i8, ptr %str6, i64 %idx_i648
  %calltmp9 = call i32 @String_strlen(ptr %ptr_add)
  %end = alloca i32, align 4
  store i32 %calltmp9, ptr %end, align 4
  br label %loop_start-end

if.cond.0:                                        ; preds = %no_judge_continue-start
  %c4 = load i8, ptr %c, align 1
  %calltmp = call i1 @is_space(i8 %c4)
  br i1 %calltmp, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %start5 = load i32, ptr %start, align 4
  %add = add i32 %start5, 1
  store i32 %add, ptr %start, align 4
  br label %if.end

if.else:                                          ; preds = %if.cond.0
  br label %break-start
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then.0
  br label %continue-start

loop_start-end:                                   ; preds = %break-start
  br label %continue-end

continue-end:                                     ; preds = %if.end28, %loop_start-end
  %end10 = load i32, ptr %end, align 4
  %start11 = load i32, ptr %start, align 4
  %sgt = icmp sgt i32 %end10, %start11
  br i1 %sgt, label %no_judge_continue-end, label %break-end

no_judge_continue-end:                            ; preds = %continue-end
  %str12 = load ptr, ptr %str1, align 4
  %start13 = load i32, ptr %start, align 4
  %idx_i6414 = sext i32 %start13 to i64
  %ptr_add15 = getelementptr i8, ptr %str12, i64 %idx_i6414
  %end16 = load i32, ptr %end, align 4
  %sub = sub i32 %end16, 1
  %idx_i6417 = sext i32 %sub to i64
  %idx_ptr18 = getelementptr i8, ptr %ptr_add15, i64 %idx_i6417
  %"idx[]_load19" = load i8, ptr %idx_ptr18, align 1
  %c20 = alloca i8, align 1
  store i8 %"idx[]_load19", ptr %c20, align 1
  br label %if.cond.021

break-end:                                        ; preds = %if.else23, %continue-end
  %str29 = load ptr, ptr %str1, align 4
  %start30 = load i32, ptr %start, align 4
  %idx_i6431 = sext i32 %start30 to i64
  %ptr_add32 = getelementptr i8, ptr %str29, i64 %idx_i6431
  %end33 = load i32, ptr %end, align 4
  %calltmp34 = call %StrSlice @StrSlice_new(ptr %ptr_add32, i32 %end33)
  %slice = alloca %StrSlice, align 8
  store %StrSlice %calltmp34, ptr %slice, align 4
  %slice35 = load %StrSlice, ptr %slice, align 4
  ret %StrSlice %slice35

if.cond.021:                                      ; preds = %no_judge_continue-end
  %c24 = load i8, ptr %c20, align 1
  %calltmp25 = call i1 @is_space(i8 %c24)
  br i1 %calltmp25, label %if.then.022, label %if.else23

if.then.022:                                      ; preds = %if.cond.021
  %end26 = load i32, ptr %end, align 4
  %sub27 = sub i32 %end26, 1
  store i32 %sub27, ptr %end, align 4
  br label %if.end28

if.else23:                                        ; preds = %if.cond.021
  br label %break-end
  br label %if.end28

if.end28:                                         ; preds = %if.else23, %if.then.022
  br label %continue-end
}

define %StrSlice @StrSlice_trim(%StrSlice %str) {
entry:
  %str1 = alloca %StrSlice, align 8
  store %StrSlice %str, ptr %str1, align 4
  %ret_val = alloca %StrSlice, align 8
  %str2 = load %StrSlice, ptr %str1, align 4
  %calltmp = call ptr @StrSlice_as_str(%StrSlice %str2)
  %calltmp3 = call %StrSlice @str_trim(ptr %calltmp)
  ret %StrSlice %calltmp3
}

define %String @String_trim(%String %string) {
entry:
  %string1 = alloca %String, align 8
  store %String %string, ptr %string1, align 4
  %ret_val = alloca %String, align 8
  %string2 = load %String, ptr %string1, align 4
  %calltmp = call ptr @String_as_str(%String %string2)
  %calltmp3 = call %StrSlice @str_trim(ptr %calltmp)
  %trimedstr = alloca %StrSlice, align 8
  store %StrSlice %calltmp3, ptr %trimedstr, align 4
  %trimedstr4 = load %StrSlice, ptr %trimedstr, align 4
  %access = getelementptr inbounds nuw %StrSlice, ptr %trimedstr, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  %trimedstr5 = load %StrSlice, ptr %trimedstr, align 4
  %access6 = getelementptr inbounds nuw %StrSlice, ptr %trimedstr, i32 0, i32 1
  %getmembervalue7 = load i32, ptr %access6, align 4
  %calltmp8 = call %String @String_from_with_len(ptr %getmembervalue, i32 %getmembervalue7)
  ret %String %calltmp8
}

define %Iterator @StrSlice_iter(%StrSlice %str) {
entry:
  %str1 = alloca %StrSlice, align 8
  store %StrSlice %str, ptr %str1, align 4
  %ret_val = alloca %Iterator, align 8
  %str2 = load %StrSlice, ptr %str1, align 4
  %calltmp = call ptr @StrSlice_as_str(%StrSlice %str2)
  %str3 = load %StrSlice, ptr %str1, align 4
  %calltmp4 = call ptr @StrSlice_as_str(%StrSlice %str3)
  %str5 = load %StrSlice, ptr %str1, align 4
  %access = getelementptr inbounds nuw %StrSlice, ptr %str1, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %idx_i64 = sext i32 %getmembervalue to i64
  %ptr_add = getelementptr i8, ptr %calltmp4, i64 %idx_i64
  %calltmp6 = call %Iterator @iter(ptr %calltmp, ptr %ptr_add, i32 1)
  ret %Iterator %calltmp6
}

define %Iterator @String_iter(%String %string) {
entry:
  %string1 = alloca %String, align 8
  store %String %string, ptr %string1, align 4
  %ret_val = alloca %Iterator, align 8
  %string2 = load %String, ptr %string1, align 4
  %calltmp = call %StrSlice @String_as_StrSlice(%String %string2)
  %str = alloca %StrSlice, align 8
  store %StrSlice %calltmp, ptr %str, align 4
  %str3 = load %StrSlice, ptr %str, align 4
  %calltmp4 = call %Iterator @StrSlice_iter(%StrSlice %str3)
  ret %Iterator %calltmp4
}

define %VecT @String_split_whitespace(%String %src) {
entry:
  %src1 = alloca %String, align 8
  store %String %src, ptr %src1, align 4
  %ret_val = alloca %VecT, align 8
  %calltmp = call %VecT @VecT_new(i32 ptrtoint (ptr getelementptr (%StrSlice, ptr null, i32 1) to i32), i32 1)
  %vec_strslice = alloca %VecT, align 8
  store %VecT %calltmp, ptr %vec_strslice, align 4
  %index = alloca i32, align 4
  store i32 0, ptr %index, align 4
  %part_len = alloca i32, align 4
  store i32 0, ptr %part_len, align 4
  %src2 = load %String, ptr %src1, align 4
  %calltmp3 = call ptr @String_as_str(%String %src2)
  %src_str = alloca ptr, align 4
  store ptr %calltmp3, ptr %src_str, align 4
  %src_str4 = load ptr, ptr %src_str, align 4
  %start = alloca ptr, align 4
  store ptr %src_str4, ptr %start, align 4
  %src5 = load %String, ptr %src1, align 4
  %calltmp6 = call %Iterator @String_iter(%String %src5)
  %it = alloca %Iterator, align 8
  store %Iterator %calltmp6, ptr %it, align 4
  br label %loop_start-add_unsafe

loop_start-add_unsafe:                            ; preds = %entry
  br label %continue-add_unsafe

continue-add_unsafe:                              ; preds = %if.end, %if.end17, %loop_start-add_unsafe
  %calltmp7 = call %Option @iter_peek(ptr %it)
  %calltmp8 = call i1 @is_some(%Option %calltmp7)
  br i1 %calltmp8, label %no_judge_continue-add_unsafe, label %break-add_unsafe

no_judge_continue-add_unsafe:                     ; preds = %continue-add_unsafe
  %calltmp9 = call %Option @iter_next(ptr %it)
  %calltmp10 = call ptr @unwrap(%Option %calltmp9)
  %deref = load i8, ptr %calltmp10, align 1
  %c = alloca i8, align 1
  store i8 %deref, ptr %c, align 1
  %index11 = load i32, ptr %index, align 4
  %add = add i32 %index11, 1
  store i32 %add, ptr %index, align 4
  br label %if.cond.0

break-add_unsafe:                                 ; preds = %continue-add_unsafe
  br label %if.cond.026

if.cond.0:                                        ; preds = %no_judge_continue-add_unsafe
  %c12 = load i8, ptr %c, align 1
  %calltmp13 = call i1 @is_space(i8 %c12)
  br i1 %calltmp13, label %if.then.0, label %if.end

if.then.0:                                        ; preds = %if.cond.0
  br label %if.cond.014

if.end:                                           ; preds = %if.end17, %if.cond.0
  %part_len24 = load i32, ptr %part_len, align 4
  %add25 = add i32 %part_len24, 1
  store i32 %add25, ptr %part_len, align 4
  br label %continue-add_unsafe

if.cond.014:                                      ; preds = %if.then.0
  %part_len16 = load i32, ptr %part_len, align 4
  %sgt = icmp sgt i32 %part_len16, 0
  br i1 %sgt, label %if.then.015, label %if.end17

if.then.015:                                      ; preds = %if.cond.014
  %start18 = load ptr, ptr %start, align 4
  %part_len19 = load i32, ptr %part_len, align 4
  %calltmp20 = call %StrSlice @StrSlice_new(ptr %start18, i32 %part_len19)
  %temp = alloca %StrSlice, align 8
  store %StrSlice %calltmp20, ptr %temp, align 4
  %calltmp21 = call ptr @VecT_push(ptr %vec_strslice, ptr %temp)
  br label %if.end17

if.end17:                                         ; preds = %if.then.015, %if.cond.014
  store i32 0, ptr %part_len, align 4
  %src_str22 = load ptr, ptr %src_str, align 4
  %index23 = load i32, ptr %index, align 4
  %idx_i64 = sext i32 %index23 to i64
  %ptr_add = getelementptr i8, ptr %src_str22, i64 %idx_i64
  store ptr %ptr_add, ptr %start, align 4
  br label %continue-add_unsafe
  br label %if.end

if.cond.026:                                      ; preds = %break-add_unsafe
  %part_len28 = load i32, ptr %part_len, align 4
  %sgt29 = icmp sgt i32 %part_len28, 0
  br i1 %sgt29, label %if.then.027, label %if.end30

if.then.027:                                      ; preds = %if.cond.026
  %start31 = load ptr, ptr %start, align 4
  %part_len32 = load i32, ptr %part_len, align 4
  %calltmp33 = call %StrSlice @StrSlice_new(ptr %start31, i32 %part_len32)
  %temp34 = alloca %StrSlice, align 8
  store %StrSlice %calltmp33, ptr %temp34, align 4
  %calltmp35 = call ptr @VecT_push(ptr %vec_strslice, ptr %temp34)
  br label %if.end30

if.end30:                                         ; preds = %if.then.027, %if.cond.026
  %vec_strslice36 = load %VecT, ptr %vec_strslice, align 4
  ret %VecT %vec_strslice36
}

define %VecT @String_split(%String %src, i8 %key) {
entry:
  %src1 = alloca %String, align 8
  store %String %src, ptr %src1, align 4
  %key2 = alloca i8, align 1
  store i8 %key, ptr %key2, align 1
  %ret_val = alloca %VecT, align 8
  %calltmp = call %VecT @VecT_new(i32 ptrtoint (ptr getelementptr (%StrSlice, ptr null, i32 1) to i32), i32 1)
  %vec_strslice = alloca %VecT, align 8
  store %VecT %calltmp, ptr %vec_strslice, align 4
  %index = alloca i32, align 4
  store i32 0, ptr %index, align 4
  %part_len = alloca i32, align 4
  store i32 0, ptr %part_len, align 4
  %src3 = load %String, ptr %src1, align 4
  %calltmp4 = call ptr @String_as_str(%String %src3)
  %src_str = alloca ptr, align 4
  store ptr %calltmp4, ptr %src_str, align 4
  %src_str5 = load ptr, ptr %src_str, align 4
  %start = alloca ptr, align 4
  store ptr %src_str5, ptr %start, align 4
  %src6 = load %String, ptr %src1, align 4
  %calltmp7 = call %Iterator @String_iter(%String %src6)
  %it = alloca %Iterator, align 8
  store %Iterator %calltmp7, ptr %it, align 4
  br label %loop_start-add_unsafe

loop_start-add_unsafe:                            ; preds = %entry
  br label %continue-add_unsafe

continue-add_unsafe:                              ; preds = %if.end, %if.end18, %loop_start-add_unsafe
  %calltmp8 = call %Option @iter_peek(ptr %it)
  %calltmp9 = call i1 @is_some(%Option %calltmp8)
  br i1 %calltmp9, label %no_judge_continue-add_unsafe, label %break-add_unsafe

no_judge_continue-add_unsafe:                     ; preds = %continue-add_unsafe
  %calltmp10 = call %Option @iter_next(ptr %it)
  %calltmp11 = call ptr @unwrap(%Option %calltmp10)
  %deref = load i8, ptr %calltmp11, align 1
  %c = alloca i8, align 1
  store i8 %deref, ptr %c, align 1
  %index12 = load i32, ptr %index, align 4
  %add = add i32 %index12, 1
  store i32 %add, ptr %index, align 4
  br label %if.cond.0

break-add_unsafe:                                 ; preds = %continue-add_unsafe
  br label %if.cond.027

if.cond.0:                                        ; preds = %no_judge_continue-add_unsafe
  %c13 = load i8, ptr %c, align 1
  %key14 = load i8, ptr %key2, align 1
  %eq = icmp eq i8 %c13, %key14
  br i1 %eq, label %if.then.0, label %if.end

if.then.0:                                        ; preds = %if.cond.0
  br label %if.cond.015

if.end:                                           ; preds = %if.end18, %if.cond.0
  %part_len25 = load i32, ptr %part_len, align 4
  %add26 = add i32 %part_len25, 1
  store i32 %add26, ptr %part_len, align 4
  br label %continue-add_unsafe

if.cond.015:                                      ; preds = %if.then.0
  %part_len17 = load i32, ptr %part_len, align 4
  %sgt = icmp sgt i32 %part_len17, 0
  br i1 %sgt, label %if.then.016, label %if.end18

if.then.016:                                      ; preds = %if.cond.015
  %start19 = load ptr, ptr %start, align 4
  %part_len20 = load i32, ptr %part_len, align 4
  %calltmp21 = call %StrSlice @StrSlice_new(ptr %start19, i32 %part_len20)
  %temp = alloca %StrSlice, align 8
  store %StrSlice %calltmp21, ptr %temp, align 4
  %calltmp22 = call ptr @VecT_push(ptr %vec_strslice, ptr %temp)
  br label %if.end18

if.end18:                                         ; preds = %if.then.016, %if.cond.015
  store i32 0, ptr %part_len, align 4
  %src_str23 = load ptr, ptr %src_str, align 4
  %index24 = load i32, ptr %index, align 4
  %idx_i64 = sext i32 %index24 to i64
  %ptr_add = getelementptr i8, ptr %src_str23, i64 %idx_i64
  store ptr %ptr_add, ptr %start, align 4
  br label %continue-add_unsafe
  br label %if.end

if.cond.027:                                      ; preds = %break-add_unsafe
  %part_len29 = load i32, ptr %part_len, align 4
  %sgt30 = icmp sgt i32 %part_len29, 0
  br i1 %sgt30, label %if.then.028, label %if.end31

if.then.028:                                      ; preds = %if.cond.027
  %start32 = load ptr, ptr %start, align 4
  %part_len33 = load i32, ptr %part_len, align 4
  %calltmp34 = call %StrSlice @StrSlice_new(ptr %start32, i32 %part_len33)
  %temp35 = alloca %StrSlice, align 8
  store %StrSlice %calltmp34, ptr %temp35, align 4
  %calltmp36 = call ptr @VecT_push(ptr %vec_strslice, ptr %temp35)
  br label %if.end31

if.end31:                                         ; preds = %if.then.028, %if.cond.027
  %vec_strslice37 = load %VecT, ptr %vec_strslice, align 4
  ret %VecT %vec_strslice37
}

define ptr @input_i64(i64 %n) {
entry:
  %n1 = alloca i64, align 8
  store i64 %n, ptr %n1, align 8
  %ret_val = alloca ptr, align 4
  %a = alloca ptr, align 4
  store ptr null, ptr %a, align 4
  %n2 = load i64, ptr %n1, align 8
  %int_trunc = trunc i64 %n2 to i32
  %mul = mul i32 8, %int_trunc
  %malloc_call = call ptr @malloc(i32 %mul)
  store ptr %malloc_call, ptr %a, align 4
  %i = alloca i64, align 8
  store i64 0, ptr %i, align 8
  br label %InputStart

InputStart:                                       ; preds = %InputLoop, %entry
  %i3 = load i64, ptr %i, align 8
  %n4 = load i64, ptr %n1, align 8
  %slt = icmp slt i64 %i3, %n4
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %InputStart
  br label %InputLoop

pending_false:                                    ; preds = %InputStart
  br label %InputEnd

InputLoop:                                        ; preds = %pending_true
  %a5 = load ptr, ptr %a, align 4
  %i6 = load i64, ptr %i, align 8
  %ptr_add = getelementptr i64, ptr %a5, i64 %i6
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_11, ptr %ptr_add)
  %i7 = load i64, ptr %i, align 8
  %add = add i64 %i7, 1
  store i64 %add, ptr %i, align 8
  br label %InputStart

InputEnd:                                         ; preds = %pending_false
  br label %Solve

Solve:                                            ; preds = %InputEnd
  %a8 = load ptr, ptr %a, align 4
  ret ptr %a8
}

define ptr @input_f64(i64 %n) {
entry:
  %n1 = alloca i64, align 8
  store i64 %n, ptr %n1, align 8
  %ret_val = alloca ptr, align 4
  %a = alloca ptr, align 4
  store ptr null, ptr %a, align 4
  %n2 = load i64, ptr %n1, align 8
  %int_trunc = trunc i64 %n2 to i32
  %mul = mul i32 8, %int_trunc
  %malloc_call = call ptr @malloc(i32 %mul)
  store ptr %malloc_call, ptr %a, align 4
  %i = alloca i64, align 8
  store i64 0, ptr %i, align 8
  br label %InputStart

InputStart:                                       ; preds = %InputLoop, %entry
  %i3 = load i64, ptr %i, align 8
  %n4 = load i64, ptr %n1, align 8
  %slt = icmp slt i64 %i3, %n4
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %InputStart
  br label %InputLoop

pending_false:                                    ; preds = %InputStart
  br label %InputEnd

InputLoop:                                        ; preds = %pending_true
  %a5 = load ptr, ptr %a, align 4
  %i6 = load i64, ptr %i, align 8
  %ptr_add = getelementptr double, ptr %a5, i64 %i6
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_12, ptr %ptr_add)
  %i7 = load i64, ptr %i, align 8
  %add = add i64 %i7, 1
  store i64 %add, ptr %i, align 8
  br label %InputStart

InputEnd:                                         ; preds = %pending_false
  br label %Solve

Solve:                                            ; preds = %InputEnd
  %a8 = load ptr, ptr %a, align 4
  ret ptr %a8
}

define ptr @input_char(i64 %n) {
entry:
  %n1 = alloca i64, align 8
  store i64 %n, ptr %n1, align 8
  %ret_val = alloca ptr, align 4
  %a = alloca ptr, align 4
  store ptr null, ptr %a, align 4
  %n2 = load i64, ptr %n1, align 8
  %mul = mul i64 %n2, 2
  %int_trunc = trunc i64 %mul to i32
  %mul3 = mul i32 1, %int_trunc
  %malloc_call = call ptr @malloc(i32 %mul3)
  store ptr %malloc_call, ptr %a, align 4
  %i = alloca i64, align 8
  store i64 0, ptr %i, align 8
  br label %InputStart

InputStart:                                       ; preds = %InputLoop, %entry
  %i4 = load i64, ptr %i, align 8
  %n5 = load i64, ptr %n1, align 8
  %slt = icmp slt i64 %i4, %n5
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %InputStart
  br label %InputLoop

pending_false:                                    ; preds = %InputStart
  br label %InputEnd

InputLoop:                                        ; preds = %pending_true
  %a6 = load ptr, ptr %a, align 4
  %i7 = load i64, ptr %i, align 8
  %ptr_add = getelementptr i8, ptr %a6, i64 %i7
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_13, ptr %ptr_add)
  %i8 = load i64, ptr %i, align 8
  %add = add i64 %i8, 1
  store i64 %add, ptr %i, align 8
  br label %InputStart

InputEnd:                                         ; preds = %pending_false
  br label %Solve

Solve:                                            ; preds = %InputEnd
  %a9 = load ptr, ptr %a, align 4
  ret ptr %a9
}

define ptr @input_str() {
entry:
  %ret_val = alloca ptr, align 4
  %malloc_call = call ptr @malloc(i32 1000005)
  %a = alloca ptr, align 4
  store ptr %malloc_call, ptr %a, align 4
  %a1 = load ptr, ptr %a, align 4
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_14, ptr %a1)
  %a2 = load ptr, ptr %a, align 4
  ret ptr %a2
}

define ptr @input_Strings(i64 %n) {
entry:
  %n1 = alloca i64, align 8
  store i64 %n, ptr %n1, align 8
  %ret_val = alloca ptr, align 4
  %a = alloca ptr, align 4
  store ptr null, ptr %a, align 4
  %sz = alloca i32, align 4
  store i32 ptrtoint (ptr getelementptr (%String, ptr null, i32 1) to i32), ptr %sz, align 4
  %sz2 = load i32, ptr %sz, align 4
  %n3 = load i64, ptr %n1, align 8
  %int_trunc = trunc i64 %n3 to i32
  %mul = mul i32 %sz2, %int_trunc
  %malloc_call = call ptr @malloc(i32 %mul)
  store ptr %malloc_call, ptr %a, align 4
  %i = alloca i32, align 4
  store i32 0, ptr %i, align 4
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %i4 = load i32, ptr %i, align 4
  %n5 = load i64, ptr %n1, align 8
  %trunc = trunc i64 %n5 to i32
  %slt = icmp slt i32 %i4, %trunc
  br i1 %slt, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %calltmp = call ptr @input_str()
  %calltmp6 = call %String @String_from(ptr %calltmp)
  %a7 = load ptr, ptr %a, align 4
  %i8 = load i32, ptr %i, align 4
  %idx_i64 = sext i32 %i8 to i64
  %idx_ptr = getelementptr %String, ptr %a7, i64 %idx_i64
  %"idx[]_load" = load %String, ptr %idx_ptr, align 4
  store %String %calltmp6, ptr %idx_ptr, align 4
  %i9 = load i32, ptr %i, align 4
  %add = add i32 %i9, 1
  store i32 %add, ptr %i, align 4
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %a10 = load ptr, ptr %a, align 4
  ret ptr %a10
}

define double @math_PI() {
entry:
  %ret_val = alloca double, align 8
  ret double 0x400921FB54442EEA
}

define double @math_E() {
entry:
  %ret_val = alloca double, align 8
  ret double 0x4005BF0A8B145FCF
}

define i64 @math_absi64(i64 %x) {
entry:
  %x1 = alloca i64, align 8
  store i64 %x, ptr %x1, align 8
  %ret_val = alloca i64, align 8
  %x2 = load i64, ptr %x1, align 8
  %sge = icmp sge i64 %x2, 0
  %x3 = load i64, ptr %x1, align 8
  %x4 = load i64, ptr %x1, align 8
  %mul = mul i64 %x4, -1
  %choose = select i1 %sge, i64 %x3, i64 %mul
  ret i64 %choose
}

define double @math_absf64(double %x) {
entry:
  %x1 = alloca double, align 8
  store double %x, ptr %x1, align 8
  %ret_val = alloca double, align 8
  %x2 = load double, ptr %x1, align 8
  %sge = fcmp oge double %x2, 0.000000e+00
  %x3 = load double, ptr %x1, align 8
  %x4 = load double, ptr %x1, align 8
  %fmul = fmul double %x4, -1.000000e+00
  %choose = select i1 %sge, double %x3, double %fmul
  ret double %choose
}

define void @sort_swap_i64(ptr %a, ptr %b) {
entry:
  %a1 = alloca ptr, align 4
  store ptr %a, ptr %a1, align 4
  %b2 = alloca ptr, align 4
  store ptr %b, ptr %b2, align 4
  %a3 = load ptr, ptr %a1, align 4
  %deref = load i64, ptr %a3, align 8
  %t = alloca i64, align 8
  store i64 %deref, ptr %t, align 8
  %b4 = load ptr, ptr %b2, align 4
  %deref5 = load i64, ptr %b4, align 8
  %a6 = load ptr, ptr %a1, align 4
  store i64 %deref5, ptr %a6, align 8
  %t7 = load i64, ptr %t, align 8
  %b8 = load ptr, ptr %b2, align 4
  store i64 %t7, ptr %b8, align 8
  ret void
}

define void @sort_swap_String(ptr %a, ptr %b) {
entry:
  %a1 = alloca ptr, align 4
  store ptr %a, ptr %a1, align 4
  %b2 = alloca ptr, align 4
  store ptr %b, ptr %b2, align 4
  %a3 = load ptr, ptr %a1, align 4
  %deref = load %String, ptr %a3, align 4
  %t = alloca %String, align 8
  store %String %deref, ptr %t, align 4
  %b4 = load ptr, ptr %b2, align 4
  %deref5 = load %String, ptr %b4, align 4
  %a6 = load ptr, ptr %a1, align 4
  store %String %deref5, ptr %a6, align 4
  %t7 = load %String, ptr %t, align 4
  %b8 = load ptr, ptr %b2, align 4
  store %String %t7, ptr %b8, align 4
  ret void
}

define i32 @qsort_i64_partition(ptr %arr, i32 %left, i32 %right) {
entry:
  %arr1 = alloca ptr, align 4
  store ptr %arr, ptr %arr1, align 4
  %left2 = alloca i32, align 4
  store i32 %left, ptr %left2, align 4
  %right3 = alloca i32, align 4
  store i32 %right, ptr %right3, align 4
  %ret_val = alloca i32, align 4
  %arr4 = load ptr, ptr %arr1, align 4
  %right5 = load i32, ptr %right3, align 4
  %idx_i64 = sext i32 %right5 to i64
  %idx_ptr = getelementptr i64, ptr %arr4, i64 %idx_i64
  %"idx[]_load" = load i64, ptr %idx_ptr, align 8
  %pivot = alloca i64, align 8
  store i64 %"idx[]_load", ptr %pivot, align 8
  %left6 = load i32, ptr %left2, align 4
  %sub = sub i32 %left6, 1
  %i = alloca i32, align 4
  store i32 %sub, ptr %i, align 4
  %left7 = load i32, ptr %left2, align 4
  %j = alloca i32, align 4
  store i32 %left7, ptr %j, align 4
  br label %loopstart

loopstart:                                        ; preds = %NoSwap, %entry
  %j8 = load i32, ptr %j, align 4
  %right9 = load i32, ptr %right3, align 4
  %slt = icmp slt i32 %j8, %right9
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %loopstart
  br label %InLoop

pending_false:                                    ; preds = %loopstart
  br label %Break

InLoop:                                           ; preds = %pending_true
  %arr10 = load ptr, ptr %arr1, align 4
  %j11 = load i32, ptr %j, align 4
  %idx_i6412 = sext i32 %j11 to i64
  %idx_ptr13 = getelementptr i64, ptr %arr10, i64 %idx_i6412
  %"idx[]_load14" = load i64, ptr %idx_ptr13, align 8
  %pivot15 = load i64, ptr %pivot, align 8
  %slt16 = icmp slt i64 %"idx[]_load14", %pivot15
  br i1 %slt16, label %pending_true17, label %pending_false18

pending_true17:                                   ; preds = %InLoop
  br label %Swap

pending_false18:                                  ; preds = %InLoop
  br label %NoSwap

Swap:                                             ; preds = %pending_true17
  %i19 = load i32, ptr %i, align 4
  %add = add i32 %i19, 1
  store i32 %add, ptr %i, align 4
  %arr20 = load ptr, ptr %arr1, align 4
  %i21 = load i32, ptr %i, align 4
  %idx_i6422 = sext i32 %i21 to i64
  %ptr_add = getelementptr i64, ptr %arr20, i64 %idx_i6422
  %arr23 = load ptr, ptr %arr1, align 4
  %j24 = load i32, ptr %j, align 4
  %idx_i6425 = sext i32 %j24 to i64
  %ptr_add26 = getelementptr i64, ptr %arr23, i64 %idx_i6425
  call void @sort_swap_i64(ptr %ptr_add, ptr %ptr_add26)
  br label %NoSwap

NoSwap:                                           ; preds = %Swap, %pending_false18
  %j27 = load i32, ptr %j, align 4
  %add28 = add i32 %j27, 1
  store i32 %add28, ptr %j, align 4
  br label %loopstart

Break:                                            ; preds = %pending_false
  %arr29 = load ptr, ptr %arr1, align 4
  %i30 = load i32, ptr %i, align 4
  %add31 = add i32 %i30, 1
  %idx_i6432 = sext i32 %add31 to i64
  %ptr_add33 = getelementptr i64, ptr %arr29, i64 %idx_i6432
  %arr34 = load ptr, ptr %arr1, align 4
  %right35 = load i32, ptr %right3, align 4
  %idx_i6436 = sext i32 %right35 to i64
  %ptr_add37 = getelementptr i64, ptr %arr34, i64 %idx_i6436
  call void @sort_swap_i64(ptr %ptr_add33, ptr %ptr_add37)
  %i38 = load i32, ptr %i, align 4
  %add39 = add i32 %i38, 1
  ret i32 %add39
}

define i32 @qsort_String_partition(ptr %arr, i32 %left, i32 %right) {
entry:
  %arr1 = alloca ptr, align 4
  store ptr %arr, ptr %arr1, align 4
  %left2 = alloca i32, align 4
  store i32 %left, ptr %left2, align 4
  %right3 = alloca i32, align 4
  store i32 %right, ptr %right3, align 4
  %ret_val = alloca i32, align 4
  %arr4 = load ptr, ptr %arr1, align 4
  %right5 = load i32, ptr %right3, align 4
  %idx_i64 = sext i32 %right5 to i64
  %idx_ptr = getelementptr %String, ptr %arr4, i64 %idx_i64
  %"idx[]_load" = load %String, ptr %idx_ptr, align 4
  %pivot = alloca %String, align 8
  store %String %"idx[]_load", ptr %pivot, align 4
  %left6 = load i32, ptr %left2, align 4
  %sub = sub i32 %left6, 1
  %i = alloca i32, align 4
  store i32 %sub, ptr %i, align 4
  %left7 = load i32, ptr %left2, align 4
  %j = alloca i32, align 4
  store i32 %left7, ptr %j, align 4
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %NoSwap, %loop_start-loop
  %j8 = load i32, ptr %j, align 4
  %right9 = load i32, ptr %right3, align 4
  %slt = icmp slt i32 %j8, %right9
  br i1 %slt, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %arr10 = load ptr, ptr %arr1, align 4
  %j11 = load i32, ptr %j, align 4
  %idx_i6412 = sext i32 %j11 to i64
  %idx_ptr13 = getelementptr %String, ptr %arr10, i64 %idx_i6412
  %"idx[]_load14" = load %String, ptr %idx_ptr13, align 4
  %pivot15 = load %String, ptr %pivot, align 4
  %calltmp = call i64 @String_cmp(%String %"idx[]_load14", %String %pivot15)
  %slt16 = icmp slt i64 %calltmp, 0
  br i1 %slt16, label %pending_true, label %pending_false

break-loop:                                       ; preds = %continue-loop
  %arr27 = load ptr, ptr %arr1, align 4
  %i28 = load i32, ptr %i, align 4
  %add29 = add i32 %i28, 1
  %idx_i6430 = sext i32 %add29 to i64
  %ptr_add31 = getelementptr %String, ptr %arr27, i64 %idx_i6430
  %arr32 = load ptr, ptr %arr1, align 4
  %right33 = load i32, ptr %right3, align 4
  %idx_i6434 = sext i32 %right33 to i64
  %ptr_add35 = getelementptr %String, ptr %arr32, i64 %idx_i6434
  call void @sort_swap_String(ptr %ptr_add31, ptr %ptr_add35)
  %i36 = load i32, ptr %i, align 4
  %add37 = add i32 %i36, 1
  ret i32 %add37

pending_true:                                     ; preds = %no_judge_continue-loop
  br label %Swap

pending_false:                                    ; preds = %no_judge_continue-loop
  br label %NoSwap

Swap:                                             ; preds = %pending_true
  %i17 = load i32, ptr %i, align 4
  %add = add i32 %i17, 1
  store i32 %add, ptr %i, align 4
  %arr18 = load ptr, ptr %arr1, align 4
  %i19 = load i32, ptr %i, align 4
  %idx_i6420 = sext i32 %i19 to i64
  %ptr_add = getelementptr %String, ptr %arr18, i64 %idx_i6420
  %arr21 = load ptr, ptr %arr1, align 4
  %j22 = load i32, ptr %j, align 4
  %idx_i6423 = sext i32 %j22 to i64
  %ptr_add24 = getelementptr %String, ptr %arr21, i64 %idx_i6423
  call void @sort_swap_String(ptr %ptr_add, ptr %ptr_add24)
  br label %NoSwap

NoSwap:                                           ; preds = %Swap, %pending_false
  %j25 = load i32, ptr %j, align 4
  %add26 = add i32 %j25, 1
  store i32 %add26, ptr %j, align 4
  br label %continue-loop
}

define void @qsort_i64(ptr %arr, i32 %left, i32 %right) {
entry:
  %arr1 = alloca ptr, align 4
  store ptr %arr, ptr %arr1, align 4
  %left2 = alloca i32, align 4
  store i32 %left, ptr %left2, align 4
  %right3 = alloca i32, align 4
  store i32 %right, ptr %right3, align 4
  %left4 = load i32, ptr %left2, align 4
  %right5 = load i32, ptr %right3, align 4
  %slt = icmp slt i32 %left4, %right5
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %entry
  br label %then

pending_false:                                    ; preds = %entry
  br label %End

then:                                             ; preds = %pending_true
  %arr6 = load ptr, ptr %arr1, align 4
  %left7 = load i32, ptr %left2, align 4
  %right8 = load i32, ptr %right3, align 4
  %calltmp = call i32 @qsort_i64_partition(ptr %arr6, i32 %left7, i32 %right8)
  %p = alloca i32, align 4
  store i32 %calltmp, ptr %p, align 4
  %arr9 = load ptr, ptr %arr1, align 4
  %left10 = load i32, ptr %left2, align 4
  %p11 = load i32, ptr %p, align 4
  %sub = sub i32 %p11, 1
  call void @qsort_i64(ptr %arr9, i32 %left10, i32 %sub)
  %arr12 = load ptr, ptr %arr1, align 4
  %p13 = load i32, ptr %p, align 4
  %add = add i32 %p13, 1
  %right14 = load i32, ptr %right3, align 4
  call void @qsort_i64(ptr %arr12, i32 %add, i32 %right14)
  br label %End

End:                                              ; preds = %then, %pending_false
  ret void
}

define void @qsort_String(ptr %arr, i32 %left, i32 %right) {
entry:
  %arr1 = alloca ptr, align 4
  store ptr %arr, ptr %arr1, align 4
  %left2 = alloca i32, align 4
  store i32 %left, ptr %left2, align 4
  %right3 = alloca i32, align 4
  store i32 %right, ptr %right3, align 4
  %left4 = load i32, ptr %left2, align 4
  %right5 = load i32, ptr %right3, align 4
  %slt = icmp slt i32 %left4, %right5
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %entry
  br label %then

pending_false:                                    ; preds = %entry
  br label %End

then:                                             ; preds = %pending_true
  %arr6 = load ptr, ptr %arr1, align 4
  %left7 = load i32, ptr %left2, align 4
  %right8 = load i32, ptr %right3, align 4
  %calltmp = call i32 @qsort_String_partition(ptr %arr6, i32 %left7, i32 %right8)
  %p = alloca i32, align 4
  store i32 %calltmp, ptr %p, align 4
  %arr9 = load ptr, ptr %arr1, align 4
  %left10 = load i32, ptr %left2, align 4
  %p11 = load i32, ptr %p, align 4
  %sub = sub i32 %p11, 1
  call void @qsort_String(ptr %arr9, i32 %left10, i32 %sub)
  %arr12 = load ptr, ptr %arr1, align 4
  %p13 = load i32, ptr %p, align 4
  %add = add i32 %p13, 1
  %right14 = load i32, ptr %right3, align 4
  call void @qsort_String(ptr %arr12, i32 %add, i32 %right14)
  br label %End

End:                                              ; preds = %then, %pending_false
  ret void
}

define i64 @"++"(ptr %p) {
entry:
  %p1 = alloca ptr, align 4
  store ptr %p, ptr %p1, align 4
  %ret_val = alloca i64, align 8
  %p2 = load ptr, ptr %p1, align 4
  %deref = load i64, ptr %p2, align 8
  %add = add i64 %deref, 1
  %p3 = load ptr, ptr %p1, align 4
  store i64 %add, ptr %p3, align 8
  %p4 = load ptr, ptr %p1, align 4
  %deref5 = load i64, ptr %p4, align 8
  ret i64 %deref5
}

define i64 @--(ptr %p) {
entry:
  %p1 = alloca ptr, align 4
  store ptr %p, ptr %p1, align 4
  %ret_val = alloca i64, align 8
  %p2 = load ptr, ptr %p1, align 4
  %deref = load i64, ptr %p2, align 8
  %sub = sub i64 %deref, 1
  %p3 = load ptr, ptr %p1, align 4
  store i64 %sub, ptr %p3, align 8
  %p4 = load ptr, ptr %p1, align 4
  %deref5 = load i64, ptr %p4, align 8
  ret i64 %deref5
}

define i64 @"+="(ptr %p, i64 %a) {
entry:
  %p1 = alloca ptr, align 4
  store ptr %p, ptr %p1, align 4
  %a2 = alloca i64, align 8
  store i64 %a, ptr %a2, align 8
  %ret_val = alloca i64, align 8
  %p3 = load ptr, ptr %p1, align 4
  %deref = load i64, ptr %p3, align 8
  %a4 = load i64, ptr %a2, align 8
  %add = add i64 %deref, %a4
  %p5 = load ptr, ptr %p1, align 4
  store i64 %add, ptr %p5, align 8
  %p6 = load ptr, ptr %p1, align 4
  %deref7 = load i64, ptr %p6, align 8
  ret i64 %deref7
}

define i64 @"-="(ptr %p, i64 %a) {
entry:
  %p1 = alloca ptr, align 4
  store ptr %p, ptr %p1, align 4
  %a2 = alloca i64, align 8
  store i64 %a, ptr %a2, align 8
  %ret_val = alloca i64, align 8
  %p3 = load ptr, ptr %p1, align 4
  %deref = load i64, ptr %p3, align 8
  %a4 = load i64, ptr %a2, align 8
  %sub = sub i64 %deref, %a4
  %p5 = load ptr, ptr %p1, align 4
  store i64 %sub, ptr %p5, align 8
  %p6 = load ptr, ptr %p1, align 4
  %deref7 = load i64, ptr %p6, align 8
  ret i64 %deref7
}

define i64 @"*="(ptr %p, i64 %a) {
entry:
  %p1 = alloca ptr, align 4
  store ptr %p, ptr %p1, align 4
  %a2 = alloca i64, align 8
  store i64 %a, ptr %a2, align 8
  %ret_val = alloca i64, align 8
  %p3 = load ptr, ptr %p1, align 4
  %deref = load i64, ptr %p3, align 8
  %a4 = load i64, ptr %a2, align 8
  %mul = mul i64 %deref, %a4
  %p5 = load ptr, ptr %p1, align 4
  store i64 %mul, ptr %p5, align 8
  %p6 = load ptr, ptr %p1, align 4
  %deref7 = load i64, ptr %p6, align 8
  ret i64 %deref7
}

define i64 @"/="(ptr %p, i64 %a) {
entry:
  %p1 = alloca ptr, align 4
  store ptr %p, ptr %p1, align 4
  %a2 = alloca i64, align 8
  store i64 %a, ptr %a2, align 8
  %ret_val = alloca i64, align 8
  %p3 = load ptr, ptr %p1, align 4
  %deref = load i64, ptr %p3, align 8
  %a4 = load i64, ptr %a2, align 8
  %div = sdiv i64 %deref, %a4
  %p5 = load ptr, ptr %p1, align 4
  store i64 %div, ptr %p5, align 8
  %p6 = load ptr, ptr %p1, align 4
  %deref7 = load i64, ptr %p6, align 8
  ret i64 %deref7
}

define i64 @"%="(ptr %p, i64 %a) {
entry:
  %p1 = alloca ptr, align 4
  store ptr %p, ptr %p1, align 4
  %a2 = alloca i64, align 8
  store i64 %a, ptr %a2, align 8
  %ret_val = alloca i64, align 8
  %p3 = load ptr, ptr %p1, align 4
  %deref = load i64, ptr %p3, align 8
  %a4 = load i64, ptr %a2, align 8
  %rem = srem i64 %deref, %a4
  %p5 = load ptr, ptr %p1, align 4
  store i64 %rem, ptr %p5, align 8
  %p6 = load ptr, ptr %p1, align 4
  %deref7 = load i64, ptr %p6, align 8
  ret i64 %deref7
}

declare i32 @timespec_get(ptr, i32)

declare i32 @nanosleep(ptr, ptr)

define i32 @Time_get(ptr %ts) {
entry:
  %ts1 = alloca ptr, align 4
  store ptr %ts, ptr %ts1, align 4
  %ret_val = alloca i32, align 4
  %i = alloca i64, align 8
  store i64 1, ptr %i, align 8
  %ts2 = load ptr, ptr %ts1, align 4
  %deref = load i32, ptr %i, align 4
  %calltmp = call i32 @timespec_get(ptr %ts2, i32 %deref)
  ret i32 %calltmp
}

define i32 @Time_sleep(ptr %ts) {
entry:
  %ts1 = alloca ptr, align 4
  store ptr %ts, ptr %ts1, align 4
  %ret_val = alloca i32, align 4
  %null = alloca ptr, align 4
  store ptr null, ptr %null, align 4
  %ts2 = load ptr, ptr %ts1, align 4
  %null3 = load ptr, ptr %null, align 4
  %calltmp = call i32 @nanosleep(ptr %ts2, ptr %null3)
  ret i32 %calltmp
}

define %timespec @Time_new() {
entry:
  %ret_val = alloca %timespec, align 8
  %time = alloca %timespec, align 8
  store %timespec zeroinitializer, ptr %time, align 8
  %time1 = load %timespec, ptr %time, align 8
  %access = getelementptr inbounds nuw %timespec, ptr %time, i32 0, i32 0
  %getmembervalue = load i64, ptr %access, align 8
  store i64 0, ptr %access, align 8
  %time2 = load %timespec, ptr %time, align 8
  %access3 = getelementptr inbounds nuw %timespec, ptr %time, i32 0, i32 1
  %getmembervalue4 = load i64, ptr %access3, align 8
  store i64 0, ptr %access3, align 8
  %time5 = load %timespec, ptr %time, align 8
  ret %timespec %time5
}

define double @Time_delta(%timespec %start, %timespec %end) {
entry:
  %start1 = alloca %timespec, align 8
  store %timespec %start, ptr %start1, align 8
  %end2 = alloca %timespec, align 8
  store %timespec %end, ptr %end2, align 8
  %ret_val = alloca double, align 8
  %end3 = load %timespec, ptr %end2, align 8
  %access = getelementptr inbounds nuw %timespec, ptr %end2, i32 0, i32 0
  %getmembervalue = load i64, ptr %access, align 8
  %start4 = load %timespec, ptr %start1, align 8
  %access5 = getelementptr inbounds nuw %timespec, ptr %start1, i32 0, i32 0
  %getmembervalue6 = load i64, ptr %access5, align 8
  %sub = sub i64 %getmembervalue, %getmembervalue6
  %sec_diff = alloca i64, align 8
  store i64 %sub, ptr %sec_diff, align 8
  %end7 = load %timespec, ptr %end2, align 8
  %access8 = getelementptr inbounds nuw %timespec, ptr %end2, i32 0, i32 1
  %getmembervalue9 = load i64, ptr %access8, align 8
  %start10 = load %timespec, ptr %start1, align 8
  %access11 = getelementptr inbounds nuw %timespec, ptr %start1, i32 0, i32 1
  %getmembervalue12 = load i64, ptr %access11, align 8
  %sub13 = sub i64 %getmembervalue9, %getmembervalue12
  %nsec_diff = alloca i64, align 8
  store i64 %sub13, ptr %nsec_diff, align 8
  %sec_diff14 = load i64, ptr %sec_diff, align 8
  %i64_to_f64 = sitofp i64 %sec_diff14 to double
  %nsec_diff15 = load i64, ptr %nsec_diff, align 8
  %i64_to_f6416 = sitofp i64 %nsec_diff15 to double
  %fmul = fmul double %i64_to_f6416, 1.000000e-09
  %fadd = fadd double %i64_to_f64, %fmul
  %elapsed = alloca double, align 8
  store double %fadd, ptr %elapsed, align 8
  %elapsed17 = load double, ptr %elapsed, align 8
  ret double %elapsed17
}

define %timespec @Time_now() {
entry:
  %ret_val = alloca %timespec, align 8
  %time = alloca %timespec, align 8
  store %timespec zeroinitializer, ptr %time, align 8
  %time1 = load %timespec, ptr %time, align 8
  %access = getelementptr inbounds nuw %timespec, ptr %time, i32 0, i32 0
  %getmembervalue = load i64, ptr %access, align 8
  store i64 0, ptr %access, align 8
  %time2 = load %timespec, ptr %time, align 8
  %access3 = getelementptr inbounds nuw %timespec, ptr %time, i32 0, i32 1
  %getmembervalue4 = load i64, ptr %access3, align 8
  store i64 0, ptr %access3, align 8
  %i = alloca i64, align 8
  store i64 1, ptr %i, align 8
  %deref = load i32, ptr %i, align 4
  %calltmp = call i32 @timespec_get(ptr %time, i32 %deref)
  %time5 = load %timespec, ptr %time, align 8
  ret %timespec %time5
}

define double @Time_as_f64(%timespec %ts) {
entry:
  %ts1 = alloca %timespec, align 8
  store %timespec %ts, ptr %ts1, align 8
  %ret_val = alloca double, align 8
  %ts2 = load %timespec, ptr %ts1, align 8
  %access = getelementptr inbounds nuw %timespec, ptr %ts1, i32 0, i32 0
  %getmembervalue = load i64, ptr %access, align 8
  %sec_diff = alloca i64, align 8
  store i64 %getmembervalue, ptr %sec_diff, align 8
  %ts3 = load %timespec, ptr %ts1, align 8
  %access4 = getelementptr inbounds nuw %timespec, ptr %ts1, i32 0, i32 1
  %getmembervalue5 = load i64, ptr %access4, align 8
  %nsec_diff = alloca i64, align 8
  store i64 %getmembervalue5, ptr %nsec_diff, align 8
  %sec_diff6 = load i64, ptr %sec_diff, align 8
  %i64_to_f64 = sitofp i64 %sec_diff6 to double
  %nsec_diff7 = load i64, ptr %nsec_diff, align 8
  %i64_to_f648 = sitofp i64 %nsec_diff7 to double
  %fmul = fmul double %i64_to_f648, 1.000000e-09
  %fadd = fadd double %i64_to_f64, %fmul
  %f_num = alloca double, align 8
  store double %fadd, ptr %f_num, align 8
  %f_num9 = load double, ptr %f_num, align 8
  ret double %f_num9
}

declare i32 @open(ptr, i32, i32)

declare i32 @read(i32, ptr, i32)

declare i32 @close(i32)

declare i64 @lseek(i32, i64, i32)

define %String @read_text_file(ptr %path) {
entry:
  %path1 = alloca ptr, align 4
  store ptr %path, ptr %path1, align 4
  %ret_val = alloca %String, align 8
  %O_RDONLY = alloca i32, align 4
  store i32 0, ptr %O_RDONLY, align 4
  %SEEK_SET = alloca i32, align 4
  store i32 0, ptr %SEEK_SET, align 4
  %SEEK_END = alloca i32, align 4
  store i32 2, ptr %SEEK_END, align 4
  %path2 = load ptr, ptr %path1, align 4
  %calltmp = call i32 @open(ptr %path2, i32 0, i32 0)
  %fd = alloca i32, align 4
  store i32 %calltmp, ptr %fd, align 4
  br label %loop_start-f

loop_start-f:                                     ; preds = %entry
  br label %continue-f

continue-f:                                       ; preds = %no_judge_continue-f, %loop_start-f
  %fd3 = load i32, ptr %fd, align 4
  %slt = icmp slt i32 %fd3, 0
  br i1 %slt, label %no_judge_continue-f, label %break-f

no_judge_continue-f:                              ; preds = %continue-f
  %calltmp4 = call %String @String_new(i32 0)
  ret %String %calltmp4
  br label %break-f
  br label %continue-f

break-f:                                          ; preds = %no_judge_continue-f, %continue-f
  %fd5 = load i32, ptr %fd, align 4
  %calltmp6 = call i64 @lseek(i32 %fd5, i64 0, i32 2)
  %size = alloca i64, align 8
  store i64 %calltmp6, ptr %size, align 8
  br label %loop_start-size_error

loop_start-size_error:                            ; preds = %break-f
  br label %continue-size_error

continue-size_error:                              ; preds = %no_judge_continue-size_error, %loop_start-size_error
  %size7 = load i64, ptr %size, align 8
  %sgt = icmp sgt i64 %size7, 100000000
  br i1 %sgt, label %no_judge_continue-size_error, label %break-size_error

no_judge_continue-size_error:                     ; preds = %continue-size_error
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_16, ptr @str_15)
  %size8 = load i64, ptr %size, align 8
  %fmt_buf = alloca [128 x i8], align 1
  %sprintf = call i32 (ptr, ptr, ...) @sprintf(ptr %fmt_buf, ptr @str_17, i64 %size8)
  %printf9 = call i32 (ptr, ...) @printf(ptr @println_fmt_18, ptr %fmt_buf)
  br label %break-size_error
  br label %continue-size_error

break-size_error:                                 ; preds = %no_judge_continue-size_error, %continue-size_error
  %fd10 = load i32, ptr %fd, align 4
  %calltmp11 = call i64 @lseek(i32 %fd10, i64 0, i32 0)
  br label %loop_start-s

loop_start-s:                                     ; preds = %break-size_error
  br label %continue-s

continue-s:                                       ; preds = %no_judge_continue-s, %loop_start-s
  %size12 = load i64, ptr %size, align 8
  %sle = icmp sle i64 %size12, 0
  br i1 %sle, label %no_judge_continue-s, label %break-s

no_judge_continue-s:                              ; preds = %continue-s
  %fd13 = load i32, ptr %fd, align 4
  %calltmp14 = call i32 @close(i32 %fd13)
  %calltmp15 = call %String @String_new(i64 0)
  ret %String %calltmp15
  br label %break-s
  br label %continue-s

break-s:                                          ; preds = %no_judge_continue-s, %continue-s
  %size16 = load i64, ptr %size, align 8
  %trunc = trunc i64 %size16 to i32
  %add = add i32 %trunc, 1
  %malloc_call = call ptr @malloc(i32 %add)
  %buf = alloca ptr, align 4
  store ptr %malloc_call, ptr %buf, align 4
  %total = alloca i64, align 8
  store i64 0, ptr %total, align 8
  br label %loop_start-r

loop_start-r:                                     ; preds = %break-s
  br label %continue-r

continue-r:                                       ; preds = %break-e, %loop_start-r
  %total17 = load i64, ptr %total, align 8
  %size18 = load i64, ptr %size, align 8
  %slt19 = icmp slt i64 %total17, %size18
  br i1 %slt19, label %no_judge_continue-r, label %break-r

no_judge_continue-r:                              ; preds = %continue-r
  %fd20 = load i32, ptr %fd, align 4
  %buf21 = load ptr, ptr %buf, align 4
  %total22 = load i64, ptr %total, align 8
  %ptr_add = getelementptr i8, ptr %buf21, i64 %total22
  %size23 = load i64, ptr %size, align 8
  %total24 = load i64, ptr %total, align 8
  %sub = sub i64 %size23, %total24
  %calltmp25 = call i32 @read(i32 %fd20, ptr %ptr_add, i64 %sub)
  %n = alloca i32, align 4
  store i32 %calltmp25, ptr %n, align 4
  br label %loop_start-e

break-r:                                          ; preds = %no_judge_continue-e, %continue-r
  %buf31 = load ptr, ptr %buf, align 4
  %total32 = load i64, ptr %total, align 8
  %idx_ptr = getelementptr i8, ptr %buf31, i64 %total32
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  store i8 0, ptr %idx_ptr, align 1
  %fd33 = load i32, ptr %fd, align 4
  %calltmp34 = call i32 @close(i32 %fd33)
  %buf35 = load ptr, ptr %buf, align 4
  %calltmp36 = call %String @String_from(ptr %buf35)
  %ret = alloca %String, align 8
  store %String %calltmp36, ptr %ret, align 4
  %buf37 = load ptr, ptr %buf, align 4
  call void @free(ptr %buf37)
  %ret38 = load %String, ptr %ret, align 4
  ret %String %ret38

loop_start-e:                                     ; preds = %no_judge_continue-r
  br label %continue-e

continue-e:                                       ; preds = %no_judge_continue-e, %loop_start-e
  %n26 = load i32, ptr %n, align 4
  %sle27 = icmp sle i32 %n26, 0
  br i1 %sle27, label %no_judge_continue-e, label %break-e

no_judge_continue-e:                              ; preds = %continue-e
  br label %break-r
  br label %break-e
  br label %continue-e

break-e:                                          ; preds = %no_judge_continue-e, %continue-e
  %total28 = load i64, ptr %total, align 8
  %n29 = load i32, ptr %n, align 4
  %int_ext = sext i32 %n29 to i64
  %add30 = add i64 %total28, %int_ext
  store i64 %add30, ptr %total, align 8
  br label %continue-r
}

declare void @exit.3(i32)

define %KeyMap @KeyMap_new(i32 %val_size, i32 %capa) {
entry:
  %val_size1 = alloca i32, align 4
  store i32 %val_size, ptr %val_size1, align 4
  %capa2 = alloca i32, align 4
  store i32 %capa, ptr %capa2, align 4
  %ret_val = alloca %KeyMap, align 8
  %keymap = alloca %KeyMap, align 8
  store %KeyMap zeroinitializer, ptr %keymap, align 4
  %keymap3 = load %KeyMap, ptr %keymap, align 4
  %access = getelementptr inbounds nuw %KeyMap, ptr %keymap, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  store i64 0, ptr %access, align 8
  %capa4 = load i32, ptr %capa2, align 4
  %keymap5 = load %KeyMap, ptr %keymap, align 4
  %access6 = getelementptr inbounds nuw %KeyMap, ptr %keymap, i32 0, i32 2
  %getmembervalue7 = load i32, ptr %access6, align 4
  store i32 %capa4, ptr %access6, align 4
  %val_size8 = load i32, ptr %val_size1, align 4
  %keymap9 = load %KeyMap, ptr %keymap, align 4
  %access10 = getelementptr inbounds nuw %KeyMap, ptr %keymap, i32 0, i32 3
  %getmembervalue11 = load i32, ptr %access10, align 4
  store i32 %val_size8, ptr %access10, align 4
  %sz = alloca i32, align 4
  store i32 ptrtoint (ptr getelementptr (%Entry, ptr null, i32 1) to i32), ptr %sz, align 4
  %sz12 = load i32, ptr %sz, align 4
  %capa13 = load i32, ptr %capa2, align 4
  %mul = mul i32 %sz12, %capa13
  %malloc_call = call ptr @malloc(i32 %mul)
  %entries = alloca ptr, align 4
  store ptr %malloc_call, ptr %entries, align 4
  %entries14 = load ptr, ptr %entries, align 4
  %keymap15 = load %KeyMap, ptr %keymap, align 4
  %access16 = getelementptr inbounds nuw %KeyMap, ptr %keymap, i32 0, i32 0
  %getmembervalue17 = load ptr, ptr %access16, align 4
  store ptr %entries14, ptr %access16, align 4
  %keymap18 = load %KeyMap, ptr %keymap, align 4
  ret %KeyMap %keymap18
}

define ptr @KeyMap_get(ptr %m, %String %key) {
entry:
  %m1 = alloca ptr, align 4
  store ptr %m, ptr %m1, align 4
  %key2 = alloca %String, align 8
  store %String %key, ptr %key2, align 4
  %ret_val = alloca ptr, align 4
  %left = alloca i64, align 8
  store i64 0, ptr %left, align 8
  %m3 = load ptr, ptr %m1, align 4
  %access = getelementptr inbounds nuw %KeyMap, ptr %m3, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %sext = sext i32 %getmembervalue to i64
  %sub = sub i64 %sext, 1
  %right = alloca i64, align 8
  store i64 %sub, ptr %right, align 8
  %left4 = load i64, ptr %left, align 8
  %right5 = load i64, ptr %right, align 8
  %add = add i64 %left4, %right5
  %div = sdiv i64 %add, 2
  %mid = alloca i64, align 8
  store i64 %div, ptr %mid, align 8
  %calltmp = call ptr @null()
  %ret = alloca ptr, align 4
  store ptr %calltmp, ptr %ret, align 4
  br label %loop_start-search

loop_start-search:                                ; preds = %entry
  br label %continue-search

continue-search:                                  ; preds = %break-L, %no_judge_continue-L, %no_judge_continue-R, %loop_start-search
  %left6 = load i64, ptr %left, align 8
  %right7 = load i64, ptr %right, align 8
  %sle = icmp sle i64 %left6, %right7
  br i1 %sle, label %no_judge_continue-search, label %break-search

no_judge_continue-search:                         ; preds = %continue-search
  %left8 = load i64, ptr %left, align 8
  %right9 = load i64, ptr %right, align 8
  %add10 = add i64 %left8, %right9
  %div11 = sdiv i64 %add10, 2
  store i64 %div11, ptr %mid, align 8
  %key12 = load %String, ptr %key2, align 4
  %m13 = load ptr, ptr %m1, align 4
  %access14 = getelementptr inbounds nuw %KeyMap, ptr %m13, i32 0, i32 0
  %getmembervalue15 = load ptr, ptr %access14, align 4
  %mid16 = load i64, ptr %mid, align 8
  %trunc = trunc i64 %mid16 to i32
  %idx_i64 = sext i32 %trunc to i64
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue15, i64 %idx_i64
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 4
  %access17 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 0
  %getmembervalue18 = load %String, ptr %access17, align 4
  %calltmp19 = call i64 @String_cmp(%String %key12, %String %getmembervalue18)
  %cmp = alloca i64, align 8
  store i64 %calltmp19, ptr %cmp, align 8
  br label %loop_start-ret

break-search:                                     ; preds = %no_judge_continue-ret, %continue-search
  %ret37 = load ptr, ptr %ret, align 4
  ret ptr %ret37

loop_start-ret:                                   ; preds = %no_judge_continue-search
  br label %continue-ret

continue-ret:                                     ; preds = %no_judge_continue-ret, %loop_start-ret
  %cmp20 = load i64, ptr %cmp, align 8
  %eq = icmp eq i64 %cmp20, 0
  br i1 %eq, label %no_judge_continue-ret, label %break-ret

no_judge_continue-ret:                            ; preds = %continue-ret
  %m21 = load ptr, ptr %m1, align 4
  %access22 = getelementptr inbounds nuw %KeyMap, ptr %m21, i32 0, i32 0
  %getmembervalue23 = load ptr, ptr %access22, align 4
  %mid24 = load i64, ptr %mid, align 8
  %trunc25 = trunc i64 %mid24 to i32
  %idx_i6426 = sext i32 %trunc25 to i64
  %idx_ptr27 = getelementptr %Entry, ptr %getmembervalue23, i64 %idx_i6426
  %"idx[]_load28" = load %Entry, ptr %idx_ptr27, align 4
  %access29 = getelementptr inbounds nuw %Entry, ptr %idx_ptr27, i32 0, i32 1
  %getmembervalue30 = load ptr, ptr %access29, align 4
  store ptr %getmembervalue30, ptr %ret, align 4
  br label %break-search
  br label %continue-ret

break-ret:                                        ; preds = %continue-ret
  br label %loop_start-R

loop_start-R:                                     ; preds = %break-ret
  br label %continue-R

continue-R:                                       ; preds = %no_judge_continue-R, %loop_start-R
  %cmp31 = load i64, ptr %cmp, align 8
  %slt = icmp slt i64 %cmp31, 0
  br i1 %slt, label %no_judge_continue-R, label %break-R

no_judge_continue-R:                              ; preds = %continue-R
  %mid32 = load i64, ptr %mid, align 8
  %sub33 = sub i64 %mid32, 1
  store i64 %sub33, ptr %right, align 8
  br label %continue-search
  br label %continue-R

break-R:                                          ; preds = %continue-R
  br label %loop_start-L

loop_start-L:                                     ; preds = %break-R
  br label %continue-L

continue-L:                                       ; preds = %no_judge_continue-L, %loop_start-L
  %cmp34 = load i64, ptr %cmp, align 8
  %sgt = icmp sgt i64 %cmp34, 0
  br i1 %sgt, label %no_judge_continue-L, label %break-L

no_judge_continue-L:                              ; preds = %continue-L
  %mid35 = load i64, ptr %mid, align 8
  %add36 = add i64 %mid35, 1
  store i64 %add36, ptr %left, align 8
  br label %continue-search
  br label %continue-L

break-L:                                          ; preds = %continue-L
  br label %continue-search
}

define i32 @KeyMap_get_index(ptr %m, %String %key) {
entry:
  %m1 = alloca ptr, align 4
  store ptr %m, ptr %m1, align 4
  %key2 = alloca %String, align 8
  store %String %key, ptr %key2, align 4
  %ret_val = alloca i32, align 4
  %left = alloca i64, align 8
  store i64 0, ptr %left, align 8
  %m3 = load ptr, ptr %m1, align 4
  %access = getelementptr inbounds nuw %KeyMap, ptr %m3, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %sext = sext i32 %getmembervalue to i64
  %sub = sub i64 %sext, 1
  %right = alloca i64, align 8
  store i64 %sub, ptr %right, align 8
  %left4 = load i64, ptr %left, align 8
  %right5 = load i64, ptr %right, align 8
  %add = add i64 %left4, %right5
  %div = sdiv i64 %add, 2
  %mid = alloca i64, align 8
  store i64 %div, ptr %mid, align 8
  %ret = alloca i64, align 8
  store i64 -1, ptr %ret, align 8
  br label %loop_start-search

loop_start-search:                                ; preds = %entry
  br label %continue-search

continue-search:                                  ; preds = %break-L, %no_judge_continue-L, %no_judge_continue-R, %loop_start-search
  %left6 = load i64, ptr %left, align 8
  %right7 = load i64, ptr %right, align 8
  %sle = icmp sle i64 %left6, %right7
  br i1 %sle, label %no_judge_continue-search, label %break-search

no_judge_continue-search:                         ; preds = %continue-search
  %left8 = load i64, ptr %left, align 8
  %right9 = load i64, ptr %right, align 8
  %add10 = add i64 %left8, %right9
  %div11 = sdiv i64 %add10, 2
  store i64 %div11, ptr %mid, align 8
  %key12 = load %String, ptr %key2, align 4
  %m13 = load ptr, ptr %m1, align 4
  %access14 = getelementptr inbounds nuw %KeyMap, ptr %m13, i32 0, i32 0
  %getmembervalue15 = load ptr, ptr %access14, align 4
  %mid16 = load i64, ptr %mid, align 8
  %trunc = trunc i64 %mid16 to i32
  %idx_i64 = sext i32 %trunc to i64
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue15, i64 %idx_i64
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 4
  %access17 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 0
  %getmembervalue18 = load %String, ptr %access17, align 4
  %calltmp = call i64 @String_cmp(%String %key12, %String %getmembervalue18)
  %cmp = alloca i64, align 8
  store i64 %calltmp, ptr %cmp, align 8
  br label %loop_start-ret

break-search:                                     ; preds = %no_judge_continue-ret, %continue-search
  %ret27 = load i64, ptr %ret, align 8
  %trunc28 = trunc i64 %ret27 to i32
  ret i32 %trunc28

loop_start-ret:                                   ; preds = %no_judge_continue-search
  br label %continue-ret

continue-ret:                                     ; preds = %no_judge_continue-ret, %loop_start-ret
  %cmp19 = load i64, ptr %cmp, align 8
  %eq = icmp eq i64 %cmp19, 0
  br i1 %eq, label %no_judge_continue-ret, label %break-ret

no_judge_continue-ret:                            ; preds = %continue-ret
  %mid20 = load i64, ptr %mid, align 8
  store i64 %mid20, ptr %ret, align 8
  br label %break-search
  br label %continue-ret

break-ret:                                        ; preds = %continue-ret
  br label %loop_start-R

loop_start-R:                                     ; preds = %break-ret
  br label %continue-R

continue-R:                                       ; preds = %no_judge_continue-R, %loop_start-R
  %cmp21 = load i64, ptr %cmp, align 8
  %slt = icmp slt i64 %cmp21, 0
  br i1 %slt, label %no_judge_continue-R, label %break-R

no_judge_continue-R:                              ; preds = %continue-R
  %mid22 = load i64, ptr %mid, align 8
  %sub23 = sub i64 %mid22, 1
  store i64 %sub23, ptr %right, align 8
  br label %continue-search
  br label %continue-R

break-R:                                          ; preds = %continue-R
  br label %loop_start-L

loop_start-L:                                     ; preds = %break-R
  br label %continue-L

continue-L:                                       ; preds = %no_judge_continue-L, %loop_start-L
  %cmp24 = load i64, ptr %cmp, align 8
  %sgt = icmp sgt i64 %cmp24, 0
  br i1 %sgt, label %no_judge_continue-L, label %break-L

no_judge_continue-L:                              ; preds = %continue-L
  %mid25 = load i64, ptr %mid, align 8
  %add26 = add i64 %mid25, 1
  store i64 %add26, ptr %left, align 8
  br label %continue-search
  br label %continue-L

break-L:                                          ; preds = %continue-L
  br label %continue-search
}

define void @KeyMap_insert(ptr %m, %String %key, ptr %value) {
entry:
  %m1 = alloca ptr, align 4
  store ptr %m, ptr %m1, align 4
  %key2 = alloca %String, align 8
  store %String %key, ptr %key2, align 4
  %value3 = alloca ptr, align 4
  store ptr %value, ptr %value3, align 4
  %m4 = load ptr, ptr %m1, align 4
  %access = getelementptr inbounds nuw %KeyMap, ptr %m4, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %add = add i32 %getmembervalue, 1
  %newsize = alloca i32, align 4
  store i32 %add, ptr %newsize, align 4
  %sz = alloca i32, align 4
  store i32 ptrtoint (ptr getelementptr (%Entry, ptr null, i32 1) to i32), ptr %sz, align 4
  br label %loop_start-check_capa

loop_start-check_capa:                            ; preds = %entry
  br label %continue-check_capa

continue-check_capa:                              ; preds = %break-loop, %loop_start-check_capa
  %newsize5 = load i32, ptr %newsize, align 4
  %m6 = load ptr, ptr %m1, align 4
  %access7 = getelementptr inbounds nuw %KeyMap, ptr %m6, i32 0, i32 2
  %getmembervalue8 = load i32, ptr %access7, align 4
  %sge = icmp sge i32 %newsize5, %getmembervalue8
  br i1 %sge, label %no_judge_continue-check_capa, label %break-check_capa

no_judge_continue-check_capa:                     ; preds = %continue-check_capa
  %newsize9 = load i32, ptr %newsize, align 4
  %mul = mul i32 %newsize9, 2
  %newcap = alloca i32, align 4
  store i32 %mul, ptr %newcap, align 4
  %m10 = load ptr, ptr %m1, align 4
  %access11 = getelementptr inbounds nuw %KeyMap, ptr %m10, i32 0, i32 0
  %getmembervalue12 = load ptr, ptr %access11, align 4
  %newcap13 = load i32, ptr %newcap, align 4
  %sz14 = load i32, ptr %sz, align 4
  %mul15 = mul i32 %newcap13, %sz14
  %realloc_call = call ptr @realloc(ptr %getmembervalue12, i32 %mul15)
  %m16 = load ptr, ptr %m1, align 4
  %access17 = getelementptr inbounds nuw %KeyMap, ptr %m16, i32 0, i32 0
  %getmembervalue18 = load ptr, ptr %access17, align 4
  store ptr %realloc_call, ptr %access17, align 4
  br label %loop_start-loop

break-check_capa:                                 ; preds = %break-loop, %continue-check_capa
  %m26 = load ptr, ptr %m1, align 4
  %access27 = getelementptr inbounds nuw %KeyMap, ptr %m26, i32 0, i32 1
  %getmembervalue28 = load i32, ptr %access27, align 4
  %i = alloca i32, align 4
  store i32 %getmembervalue28, ptr %i, align 4
  br label %loop_start-loop29

loop_start-loop:                                  ; preds = %no_judge_continue-check_capa
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %m19 = load ptr, ptr %m1, align 4
  %access20 = getelementptr inbounds nuw %KeyMap, ptr %m19, i32 0, i32 0
  %getmembervalue21 = load ptr, ptr %access20, align 4
  %calltmp = call ptr @null()
  %ptr_a_i = ptrtoint ptr %getmembervalue21 to i64
  %ptr_b_i = ptrtoint ptr %calltmp to i64
  %eq = icmp eq i64 %ptr_a_i, %ptr_b_i
  br i1 %eq, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_20, ptr @str_19)
  call void @exit(i32 0)
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %newcap22 = load i32, ptr %newcap, align 4
  %m23 = load ptr, ptr %m1, align 4
  %access24 = getelementptr inbounds nuw %KeyMap, ptr %m23, i32 0, i32 2
  %getmembervalue25 = load i32, ptr %access24, align 4
  store i32 %newcap22, ptr %access24, align 4
  br label %break-check_capa
  br label %continue-check_capa

loop_start-loop29:                                ; preds = %break-check_capa
  br label %continue-loop30

continue-loop30:                                  ; preds = %no_judge_continue-loop31, %loop_start-loop29
  %i33 = load i32, ptr %i, align 4
  %sgt = icmp sgt i32 %i33, 0
  br i1 %sgt, label %and.rhs, label %and.false

no_judge_continue-loop31:                         ; preds = %and.merge
  %m42 = load ptr, ptr %m1, align 4
  %access43 = getelementptr inbounds nuw %KeyMap, ptr %m42, i32 0, i32 0
  %getmembervalue44 = load ptr, ptr %access43, align 4
  %i45 = load i32, ptr %i, align 4
  %sub46 = sub i32 %i45, 1
  %idx_i6447 = sext i32 %sub46 to i64
  %idx_ptr48 = getelementptr %Entry, ptr %getmembervalue44, i64 %idx_i6447
  %"idx[]_load49" = load %Entry, ptr %idx_ptr48, align 4
  %m50 = load ptr, ptr %m1, align 4
  %access51 = getelementptr inbounds nuw %KeyMap, ptr %m50, i32 0, i32 0
  %getmembervalue52 = load ptr, ptr %access51, align 4
  %i53 = load i32, ptr %i, align 4
  %idx_i6454 = sext i32 %i53 to i64
  %idx_ptr55 = getelementptr %Entry, ptr %getmembervalue52, i64 %idx_i6454
  %"idx[]_load56" = load %Entry, ptr %idx_ptr55, align 4
  store %Entry %"idx[]_load49", ptr %idx_ptr55, align 4
  %i57 = load i32, ptr %i, align 4
  %sub58 = sub i32 %i57, 1
  store i32 %sub58, ptr %i, align 4
  br label %continue-loop30

break-loop32:                                     ; preds = %and.merge
  %key59 = load %String, ptr %key2, align 4
  %calltmp60 = call %String @String_clone(%String %key59)
  %m61 = load ptr, ptr %m1, align 4
  %access62 = getelementptr inbounds nuw %KeyMap, ptr %m61, i32 0, i32 0
  %getmembervalue63 = load ptr, ptr %access62, align 4
  %i64 = load i32, ptr %i, align 4
  %idx_i6465 = sext i32 %i64 to i64
  %idx_ptr66 = getelementptr %Entry, ptr %getmembervalue63, i64 %idx_i6465
  %"idx[]_load67" = load %Entry, ptr %idx_ptr66, align 4
  %access68 = getelementptr inbounds nuw %Entry, ptr %idx_ptr66, i32 0, i32 0
  %getmembervalue69 = load %String, ptr %access68, align 4
  store %String %calltmp60, ptr %access68, align 4
  %m70 = load ptr, ptr %m1, align 4
  %access71 = getelementptr inbounds nuw %KeyMap, ptr %m70, i32 0, i32 3
  %getmembervalue72 = load i32, ptr %access71, align 4
  %malloc_call = call ptr @malloc(i32 %getmembervalue72)
  %valptr = alloca ptr, align 4
  store ptr %malloc_call, ptr %valptr, align 4
  %valptr73 = load ptr, ptr %valptr, align 4
  %value74 = load ptr, ptr %value3, align 4
  %m75 = load ptr, ptr %m1, align 4
  %access76 = getelementptr inbounds nuw %KeyMap, ptr %m75, i32 0, i32 3
  %getmembervalue77 = load i32, ptr %access76, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %valptr73, ptr align 1 %value74, i32 %getmembervalue77, i1 false)
  %valptr78 = load ptr, ptr %valptr, align 4
  %m79 = load ptr, ptr %m1, align 4
  %access80 = getelementptr inbounds nuw %KeyMap, ptr %m79, i32 0, i32 0
  %getmembervalue81 = load ptr, ptr %access80, align 4
  %i82 = load i32, ptr %i, align 4
  %idx_i6483 = sext i32 %i82 to i64
  %idx_ptr84 = getelementptr %Entry, ptr %getmembervalue81, i64 %idx_i6483
  %"idx[]_load85" = load %Entry, ptr %idx_ptr84, align 4
  %access86 = getelementptr inbounds nuw %Entry, ptr %idx_ptr84, i32 0, i32 1
  %getmembervalue87 = load ptr, ptr %access86, align 4
  store ptr %valptr78, ptr %access86, align 4
  %m88 = load ptr, ptr %m1, align 4
  %access89 = getelementptr inbounds nuw %KeyMap, ptr %m88, i32 0, i32 1
  %getmembervalue90 = load i32, ptr %access89, align 4
  %add91 = add i32 %getmembervalue90, 1
  %m92 = load ptr, ptr %m1, align 4
  %access93 = getelementptr inbounds nuw %KeyMap, ptr %m92, i32 0, i32 1
  %getmembervalue94 = load i32, ptr %access93, align 4
  store i32 %add91, ptr %access93, align 4
  ret void

and.rhs:                                          ; preds = %continue-loop30
  %key34 = load %String, ptr %key2, align 4
  %m35 = load ptr, ptr %m1, align 4
  %access36 = getelementptr inbounds nuw %KeyMap, ptr %m35, i32 0, i32 0
  %getmembervalue37 = load ptr, ptr %access36, align 4
  %i38 = load i32, ptr %i, align 4
  %sub = sub i32 %i38, 1
  %idx_i64 = sext i32 %sub to i64
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue37, i64 %idx_i64
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 4
  %access39 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 0
  %getmembervalue40 = load %String, ptr %access39, align 4
  %calltmp41 = call i64 @String_cmp(%String %key34, %String %getmembervalue40)
  %slt = icmp slt i64 %calltmp41, 0
  br label %and.merge

and.false:                                        ; preds = %continue-loop30
  br label %and.merge

and.merge:                                        ; preds = %and.false, %and.rhs
  %and.result = phi i1 [ %slt, %and.rhs ], [ false, %and.false ]
  br i1 %and.result, label %no_judge_continue-loop31, label %break-loop32
}

define i32 @KeyMap_assign(ptr %m, i32 %index, ptr %value) {
entry:
  %m1 = alloca ptr, align 4
  store ptr %m, ptr %m1, align 4
  %index2 = alloca i32, align 4
  store i32 %index, ptr %index2, align 4
  %value3 = alloca ptr, align 4
  store ptr %value, ptr %value3, align 4
  %ret_val = alloca i32, align 4
  %m4 = load ptr, ptr %m1, align 4
  %access = getelementptr inbounds nuw %KeyMap, ptr %m4, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 4
  %index5 = load i32, ptr %index2, align 4
  %idx_i64 = sext i32 %index5 to i64
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue, i64 %idx_i64
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 4
  %access6 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 1
  %getmembervalue7 = load ptr, ptr %access6, align 4
  %value8 = load ptr, ptr %value3, align 4
  %m9 = load ptr, ptr %m1, align 4
  %access10 = getelementptr inbounds nuw %KeyMap, ptr %m9, i32 0, i32 3
  %getmembervalue11 = load i32, ptr %access10, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %getmembervalue7, ptr align 1 %value8, i32 %getmembervalue11, i1 false)
  ret i32 1
}

define i32 @KeyMap_insert_or_assign(ptr %m, %String %key, ptr %value) {
entry:
  %m1 = alloca ptr, align 4
  store ptr %m, ptr %m1, align 4
  %key2 = alloca %String, align 8
  store %String %key, ptr %key2, align 4
  %value3 = alloca ptr, align 4
  store ptr %value, ptr %value3, align 4
  %ret_val = alloca i32, align 4
  %m4 = load ptr, ptr %m1, align 4
  %key5 = load %String, ptr %key2, align 4
  %calltmp = call i32 @KeyMap_get_index(ptr %m4, %String %key5)
  %index = alloca i32, align 4
  store i32 %calltmp, ptr %index, align 4
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %index6 = load i32, ptr %index, align 4
  %sge = icmp sge i32 %index6, 0
  br i1 %sge, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %m7 = load ptr, ptr %m1, align 4
  %index8 = load i32, ptr %index, align 4
  %value9 = load ptr, ptr %value3, align 4
  %calltmp10 = call i32 @KeyMap_assign(ptr %m7, i32 %index8, ptr %value9)
  ret i32 0
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %m11 = load ptr, ptr %m1, align 4
  %access = getelementptr inbounds nuw %KeyMap, ptr %m11, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %add = add i32 %getmembervalue, 1
  %newsize = alloca i32, align 4
  store i32 %add, ptr %newsize, align 4
  %sz = alloca i32, align 4
  store i32 ptrtoint (ptr getelementptr (%Entry, ptr null, i32 1) to i32), ptr %sz, align 4
  br label %loop_start-check_capa

loop_start-check_capa:                            ; preds = %break-loop
  br label %continue-check_capa

continue-check_capa:                              ; preds = %break-loop30, %loop_start-check_capa
  %newsize12 = load i32, ptr %newsize, align 4
  %m13 = load ptr, ptr %m1, align 4
  %access14 = getelementptr inbounds nuw %KeyMap, ptr %m13, i32 0, i32 2
  %getmembervalue15 = load i32, ptr %access14, align 4
  %sge16 = icmp sge i32 %newsize12, %getmembervalue15
  br i1 %sge16, label %no_judge_continue-check_capa, label %break-check_capa

no_judge_continue-check_capa:                     ; preds = %continue-check_capa
  %newsize17 = load i32, ptr %newsize, align 4
  %mul = mul i32 %newsize17, 2
  %newcap = alloca i32, align 4
  store i32 %mul, ptr %newcap, align 4
  %m18 = load ptr, ptr %m1, align 4
  %access19 = getelementptr inbounds nuw %KeyMap, ptr %m18, i32 0, i32 0
  %getmembervalue20 = load ptr, ptr %access19, align 4
  %newcap21 = load i32, ptr %newcap, align 4
  %sz22 = load i32, ptr %sz, align 4
  %mul23 = mul i32 %newcap21, %sz22
  %realloc_call = call ptr @realloc(ptr %getmembervalue20, i32 %mul23)
  %m24 = load ptr, ptr %m1, align 4
  %access25 = getelementptr inbounds nuw %KeyMap, ptr %m24, i32 0, i32 0
  %getmembervalue26 = load ptr, ptr %access25, align 4
  store ptr %realloc_call, ptr %access25, align 4
  br label %loop_start-loop27

break-check_capa:                                 ; preds = %break-loop30, %continue-check_capa
  %m39 = load ptr, ptr %m1, align 4
  %access40 = getelementptr inbounds nuw %KeyMap, ptr %m39, i32 0, i32 1
  %getmembervalue41 = load i32, ptr %access40, align 4
  %i = alloca i32, align 4
  store i32 %getmembervalue41, ptr %i, align 4
  br label %loop_start-loop42

loop_start-loop27:                                ; preds = %no_judge_continue-check_capa
  br label %continue-loop28

continue-loop28:                                  ; preds = %no_judge_continue-loop29, %loop_start-loop27
  %m31 = load ptr, ptr %m1, align 4
  %access32 = getelementptr inbounds nuw %KeyMap, ptr %m31, i32 0, i32 0
  %getmembervalue33 = load ptr, ptr %access32, align 4
  %calltmp34 = call ptr @null()
  %ptr_a_i = ptrtoint ptr %getmembervalue33 to i64
  %ptr_b_i = ptrtoint ptr %calltmp34 to i64
  %eq = icmp eq i64 %ptr_a_i, %ptr_b_i
  br i1 %eq, label %no_judge_continue-loop29, label %break-loop30

no_judge_continue-loop29:                         ; preds = %continue-loop28
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_22, ptr @str_21)
  call void @exit(i32 0)
  br label %continue-loop28

break-loop30:                                     ; preds = %continue-loop28
  %newcap35 = load i32, ptr %newcap, align 4
  %m36 = load ptr, ptr %m1, align 4
  %access37 = getelementptr inbounds nuw %KeyMap, ptr %m36, i32 0, i32 2
  %getmembervalue38 = load i32, ptr %access37, align 4
  store i32 %newcap35, ptr %access37, align 4
  br label %break-check_capa
  br label %continue-check_capa

loop_start-loop42:                                ; preds = %break-check_capa
  br label %continue-loop43

continue-loop43:                                  ; preds = %no_judge_continue-loop44, %loop_start-loop42
  %i46 = load i32, ptr %i, align 4
  %sgt = icmp sgt i32 %i46, 0
  br i1 %sgt, label %and.rhs, label %and.false

no_judge_continue-loop44:                         ; preds = %and.merge
  %m55 = load ptr, ptr %m1, align 4
  %access56 = getelementptr inbounds nuw %KeyMap, ptr %m55, i32 0, i32 0
  %getmembervalue57 = load ptr, ptr %access56, align 4
  %i58 = load i32, ptr %i, align 4
  %sub59 = sub i32 %i58, 1
  %idx_i6460 = sext i32 %sub59 to i64
  %idx_ptr61 = getelementptr %Entry, ptr %getmembervalue57, i64 %idx_i6460
  %"idx[]_load62" = load %Entry, ptr %idx_ptr61, align 4
  %m63 = load ptr, ptr %m1, align 4
  %access64 = getelementptr inbounds nuw %KeyMap, ptr %m63, i32 0, i32 0
  %getmembervalue65 = load ptr, ptr %access64, align 4
  %i66 = load i32, ptr %i, align 4
  %idx_i6467 = sext i32 %i66 to i64
  %idx_ptr68 = getelementptr %Entry, ptr %getmembervalue65, i64 %idx_i6467
  %"idx[]_load69" = load %Entry, ptr %idx_ptr68, align 4
  store %Entry %"idx[]_load62", ptr %idx_ptr68, align 4
  %i70 = load i32, ptr %i, align 4
  %sub71 = sub i32 %i70, 1
  store i32 %sub71, ptr %i, align 4
  br label %continue-loop43

break-loop45:                                     ; preds = %and.merge
  %key72 = load %String, ptr %key2, align 4
  %calltmp73 = call %String @String_clone(%String %key72)
  %m74 = load ptr, ptr %m1, align 4
  %access75 = getelementptr inbounds nuw %KeyMap, ptr %m74, i32 0, i32 0
  %getmembervalue76 = load ptr, ptr %access75, align 4
  %i77 = load i32, ptr %i, align 4
  %idx_i6478 = sext i32 %i77 to i64
  %idx_ptr79 = getelementptr %Entry, ptr %getmembervalue76, i64 %idx_i6478
  %"idx[]_load80" = load %Entry, ptr %idx_ptr79, align 4
  %access81 = getelementptr inbounds nuw %Entry, ptr %idx_ptr79, i32 0, i32 0
  %getmembervalue82 = load %String, ptr %access81, align 4
  store %String %calltmp73, ptr %access81, align 4
  %m83 = load ptr, ptr %m1, align 4
  %access84 = getelementptr inbounds nuw %KeyMap, ptr %m83, i32 0, i32 3
  %getmembervalue85 = load i32, ptr %access84, align 4
  %malloc_call = call ptr @malloc(i32 %getmembervalue85)
  %valptr = alloca ptr, align 4
  store ptr %malloc_call, ptr %valptr, align 4
  %valptr86 = load ptr, ptr %valptr, align 4
  %value87 = load ptr, ptr %value3, align 4
  %m88 = load ptr, ptr %m1, align 4
  %access89 = getelementptr inbounds nuw %KeyMap, ptr %m88, i32 0, i32 3
  %getmembervalue90 = load i32, ptr %access89, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %valptr86, ptr align 1 %value87, i32 %getmembervalue90, i1 false)
  %valptr91 = load ptr, ptr %valptr, align 4
  %m92 = load ptr, ptr %m1, align 4
  %access93 = getelementptr inbounds nuw %KeyMap, ptr %m92, i32 0, i32 0
  %getmembervalue94 = load ptr, ptr %access93, align 4
  %i95 = load i32, ptr %i, align 4
  %idx_i6496 = sext i32 %i95 to i64
  %idx_ptr97 = getelementptr %Entry, ptr %getmembervalue94, i64 %idx_i6496
  %"idx[]_load98" = load %Entry, ptr %idx_ptr97, align 4
  %access99 = getelementptr inbounds nuw %Entry, ptr %idx_ptr97, i32 0, i32 1
  %getmembervalue100 = load ptr, ptr %access99, align 4
  store ptr %valptr91, ptr %access99, align 4
  %m101 = load ptr, ptr %m1, align 4
  %access102 = getelementptr inbounds nuw %KeyMap, ptr %m101, i32 0, i32 1
  %getmembervalue103 = load i32, ptr %access102, align 4
  %add104 = add i32 %getmembervalue103, 1
  %m105 = load ptr, ptr %m1, align 4
  %access106 = getelementptr inbounds nuw %KeyMap, ptr %m105, i32 0, i32 1
  %getmembervalue107 = load i32, ptr %access106, align 4
  store i32 %add104, ptr %access106, align 4
  ret i32 0

and.rhs:                                          ; preds = %continue-loop43
  %key47 = load %String, ptr %key2, align 4
  %m48 = load ptr, ptr %m1, align 4
  %access49 = getelementptr inbounds nuw %KeyMap, ptr %m48, i32 0, i32 0
  %getmembervalue50 = load ptr, ptr %access49, align 4
  %i51 = load i32, ptr %i, align 4
  %sub = sub i32 %i51, 1
  %idx_i64 = sext i32 %sub to i64
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue50, i64 %idx_i64
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 4
  %access52 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 0
  %getmembervalue53 = load %String, ptr %access52, align 4
  %calltmp54 = call i64 @String_cmp(%String %key47, %String %getmembervalue53)
  %slt = icmp slt i64 %calltmp54, 0
  br label %and.merge

and.false:                                        ; preds = %continue-loop43
  br label %and.merge

and.merge:                                        ; preds = %and.false, %and.rhs
  %and.result = phi i1 [ %slt, %and.rhs ], [ false, %and.false ]
  br i1 %and.result, label %no_judge_continue-loop44, label %break-loop45
}

define void @KeyMap_free(ptr %m) {
entry:
  %m1 = alloca ptr, align 4
  store ptr %m, ptr %m1, align 4
  %i = alloca i32, align 4
  store i32 0, ptr %i, align 4
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %i2 = load i32, ptr %i, align 4
  %m3 = load ptr, ptr %m1, align 4
  %access = getelementptr inbounds nuw %KeyMap, ptr %m3, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %slt = icmp slt i32 %i2, %getmembervalue
  br i1 %slt, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %m4 = load ptr, ptr %m1, align 4
  %access5 = getelementptr inbounds nuw %KeyMap, ptr %m4, i32 0, i32 0
  %getmembervalue6 = load ptr, ptr %access5, align 4
  %i7 = load i32, ptr %i, align 4
  %idx_i64 = sext i32 %i7 to i64
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue6, i64 %idx_i64
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 4
  %access8 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 1
  %getmembervalue9 = load ptr, ptr %access8, align 4
  call void @free(ptr %getmembervalue9)
  %m10 = load ptr, ptr %m1, align 4
  %access11 = getelementptr inbounds nuw %KeyMap, ptr %m10, i32 0, i32 0
  %getmembervalue12 = load ptr, ptr %access11, align 4
  %i13 = load i32, ptr %i, align 4
  %idx_i6414 = sext i32 %i13 to i64
  %idx_ptr15 = getelementptr %Entry, ptr %getmembervalue12, i64 %idx_i6414
  %"idx[]_load16" = load %Entry, ptr %idx_ptr15, align 4
  %access17 = getelementptr inbounds nuw %Entry, ptr %idx_ptr15, i32 0, i32 0
  %getmembervalue18 = load %String, ptr %access17, align 4
  call void @String_free(ptr %access17)
  %i19 = load i32, ptr %i, align 4
  %add = add i32 %i19, 1
  store i32 %add, ptr %i, align 4
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %m20 = load ptr, ptr %m1, align 4
  %access21 = getelementptr inbounds nuw %KeyMap, ptr %m20, i32 0, i32 0
  %getmembervalue22 = load ptr, ptr %access21, align 4
  call void @free(ptr %getmembervalue22)
  ret void
}

define void @clear_cli_screen() {
entry:
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_24, ptr @str_23)
  ret void
}

define %Complex @Complex_new(double %re, double %im) {
entry:
  %re1 = alloca double, align 8
  store double %re, ptr %re1, align 8
  %im2 = alloca double, align 8
  store double %im, ptr %im2, align 8
  %ret_val = alloca %Complex, align 8
  %cplx = alloca %Complex, align 8
  store %Complex zeroinitializer, ptr %cplx, align 8
  %re3 = load double, ptr %re1, align 8
  %cplx4 = load %Complex, ptr %cplx, align 8
  %access = getelementptr inbounds nuw %Complex, ptr %cplx, i32 0, i32 0
  %getmembervalue = load double, ptr %access, align 8
  store double %re3, ptr %access, align 8
  %im5 = load double, ptr %im2, align 8
  %cplx6 = load %Complex, ptr %cplx, align 8
  %access7 = getelementptr inbounds nuw %Complex, ptr %cplx, i32 0, i32 1
  %getmembervalue8 = load double, ptr %access7, align 8
  store double %im5, ptr %access7, align 8
  %cplx9 = load %Complex, ptr %cplx, align 8
  ret %Complex %cplx9
}

define void @Complex_show(%Complex %c) {
entry:
  %c1 = alloca %Complex, align 8
  store %Complex %c, ptr %c1, align 8
  %c2 = load %Complex, ptr %c1, align 8
  %access = getelementptr inbounds nuw %Complex, ptr %c1, i32 0, i32 0
  %getmembervalue = load double, ptr %access, align 8
  %c3 = load %Complex, ptr %c1, align 8
  %access4 = getelementptr inbounds nuw %Complex, ptr %c1, i32 0, i32 1
  %getmembervalue5 = load double, ptr %access4, align 8
  %fmt_buf = alloca [128 x i8], align 1
  %sprintf = call i32 (ptr, ptr, ...) @sprintf(ptr %fmt_buf, ptr @str_25, double %getmembervalue, double %getmembervalue5)
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_26, ptr %fmt_buf)
  ret void
}

define %Complex @"C+"(%Complex %a, %Complex %b) {
entry:
  %a1 = alloca %Complex, align 8
  store %Complex %a, ptr %a1, align 8
  %b2 = alloca %Complex, align 8
  store %Complex %b, ptr %b2, align 8
  %ret_val = alloca %Complex, align 8
  %a3 = load %Complex, ptr %a1, align 8
  %access = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 0
  %getmembervalue = load double, ptr %access, align 8
  %b4 = load %Complex, ptr %b2, align 8
  %access5 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 0
  %getmembervalue6 = load double, ptr %access5, align 8
  %fadd = fadd double %getmembervalue, %getmembervalue6
  %a7 = load %Complex, ptr %a1, align 8
  %access8 = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 1
  %getmembervalue9 = load double, ptr %access8, align 8
  %b10 = load %Complex, ptr %b2, align 8
  %access11 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 1
  %getmembervalue12 = load double, ptr %access11, align 8
  %fadd13 = fadd double %getmembervalue9, %getmembervalue12
  %calltmp = call %Complex @Complex_new(double %fadd, double %fadd13)
  ret %Complex %calltmp
}

define %Complex @C-(%Complex %a, %Complex %b) {
entry:
  %a1 = alloca %Complex, align 8
  store %Complex %a, ptr %a1, align 8
  %b2 = alloca %Complex, align 8
  store %Complex %b, ptr %b2, align 8
  %ret_val = alloca %Complex, align 8
  %a3 = load %Complex, ptr %a1, align 8
  %access = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 0
  %getmembervalue = load double, ptr %access, align 8
  %b4 = load %Complex, ptr %b2, align 8
  %access5 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 0
  %getmembervalue6 = load double, ptr %access5, align 8
  %fsub = fsub double %getmembervalue, %getmembervalue6
  %a7 = load %Complex, ptr %a1, align 8
  %access8 = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 1
  %getmembervalue9 = load double, ptr %access8, align 8
  %b10 = load %Complex, ptr %b2, align 8
  %access11 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 1
  %getmembervalue12 = load double, ptr %access11, align 8
  %fsub13 = fsub double %getmembervalue9, %getmembervalue12
  %calltmp = call %Complex @Complex_new(double %fsub, double %fsub13)
  ret %Complex %calltmp
}

define %Complex @"C*"(%Complex %a, %Complex %b) {
entry:
  %a1 = alloca %Complex, align 8
  store %Complex %a, ptr %a1, align 8
  %b2 = alloca %Complex, align 8
  store %Complex %b, ptr %b2, align 8
  %ret_val = alloca %Complex, align 8
  %a3 = load %Complex, ptr %a1, align 8
  %access = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 0
  %getmembervalue = load double, ptr %access, align 8
  %b4 = load %Complex, ptr %b2, align 8
  %access5 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 0
  %getmembervalue6 = load double, ptr %access5, align 8
  %fmul = fmul double %getmembervalue, %getmembervalue6
  %a7 = load %Complex, ptr %a1, align 8
  %access8 = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 1
  %getmembervalue9 = load double, ptr %access8, align 8
  %b10 = load %Complex, ptr %b2, align 8
  %access11 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 1
  %getmembervalue12 = load double, ptr %access11, align 8
  %fmul13 = fmul double %getmembervalue9, %getmembervalue12
  %fsub = fsub double %fmul, %fmul13
  %a14 = load %Complex, ptr %a1, align 8
  %access15 = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 0
  %getmembervalue16 = load double, ptr %access15, align 8
  %b17 = load %Complex, ptr %b2, align 8
  %access18 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 1
  %getmembervalue19 = load double, ptr %access18, align 8
  %fmul20 = fmul double %getmembervalue16, %getmembervalue19
  %a21 = load %Complex, ptr %a1, align 8
  %access22 = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 1
  %getmembervalue23 = load double, ptr %access22, align 8
  %b24 = load %Complex, ptr %b2, align 8
  %access25 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 0
  %getmembervalue26 = load double, ptr %access25, align 8
  %fmul27 = fmul double %getmembervalue23, %getmembervalue26
  %fadd = fadd double %fmul20, %fmul27
  %calltmp = call %Complex @Complex_new(double %fsub, double %fadd)
  ret %Complex %calltmp
}

define %Complex @"C/"(%Complex %a, %Complex %b) {
entry:
  %a1 = alloca %Complex, align 8
  store %Complex %a, ptr %a1, align 8
  %b2 = alloca %Complex, align 8
  store %Complex %b, ptr %b2, align 8
  %ret_val = alloca %Complex, align 8
  %b3 = load %Complex, ptr %b2, align 8
  %access = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 0
  %getmembervalue = load double, ptr %access, align 8
  %b4 = load %Complex, ptr %b2, align 8
  %access5 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 0
  %getmembervalue6 = load double, ptr %access5, align 8
  %fmul = fmul double %getmembervalue, %getmembervalue6
  %b7 = load %Complex, ptr %b2, align 8
  %access8 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 1
  %getmembervalue9 = load double, ptr %access8, align 8
  %b10 = load %Complex, ptr %b2, align 8
  %access11 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 1
  %getmembervalue12 = load double, ptr %access11, align 8
  %fmul13 = fmul double %getmembervalue9, %getmembervalue12
  %fadd = fadd double %fmul, %fmul13
  %r = alloca double, align 8
  store double %fadd, ptr %r, align 8
  %b14 = load %Complex, ptr %b2, align 8
  %access15 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 0
  %getmembervalue16 = load double, ptr %access15, align 8
  %r17 = load double, ptr %r, align 8
  %fdiv = fdiv double %getmembervalue16, %r17
  %b18 = load %Complex, ptr %b2, align 8
  %access19 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 0
  %getmembervalue20 = load double, ptr %access19, align 8
  store double %fdiv, ptr %access19, align 8
  %b21 = load %Complex, ptr %b2, align 8
  %access22 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 1
  %getmembervalue23 = load double, ptr %access22, align 8
  %r24 = load double, ptr %r, align 8
  %fdiv25 = fdiv double %getmembervalue23, %r24
  %fsub = fsub double 0.000000e+00, %fdiv25
  %b26 = load %Complex, ptr %b2, align 8
  %access27 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 1
  %getmembervalue28 = load double, ptr %access27, align 8
  store double %fsub, ptr %access27, align 8
  %a29 = load %Complex, ptr %a1, align 8
  %access30 = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 0
  %getmembervalue31 = load double, ptr %access30, align 8
  %b32 = load %Complex, ptr %b2, align 8
  %access33 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 0
  %getmembervalue34 = load double, ptr %access33, align 8
  %fmul35 = fmul double %getmembervalue31, %getmembervalue34
  %a36 = load %Complex, ptr %a1, align 8
  %access37 = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 1
  %getmembervalue38 = load double, ptr %access37, align 8
  %b39 = load %Complex, ptr %b2, align 8
  %access40 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 1
  %getmembervalue41 = load double, ptr %access40, align 8
  %fmul42 = fmul double %getmembervalue38, %getmembervalue41
  %fsub43 = fsub double %fmul35, %fmul42
  %a44 = load %Complex, ptr %a1, align 8
  %access45 = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 0
  %getmembervalue46 = load double, ptr %access45, align 8
  %b47 = load %Complex, ptr %b2, align 8
  %access48 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 1
  %getmembervalue49 = load double, ptr %access48, align 8
  %fmul50 = fmul double %getmembervalue46, %getmembervalue49
  %a51 = load %Complex, ptr %a1, align 8
  %access52 = getelementptr inbounds nuw %Complex, ptr %a1, i32 0, i32 1
  %getmembervalue53 = load double, ptr %access52, align 8
  %b54 = load %Complex, ptr %b2, align 8
  %access55 = getelementptr inbounds nuw %Complex, ptr %b2, i32 0, i32 0
  %getmembervalue56 = load double, ptr %access55, align 8
  %fmul57 = fmul double %getmembervalue53, %getmembervalue56
  %fadd58 = fadd double %fmul50, %fmul57
  %calltmp = call %Complex @Complex_new(double %fsub43, double %fadd58)
  ret %Complex %calltmp
}

define %Result @Result_new(i1 %Ok, ptr %ok_value, ptr %err_value) {
entry:
  %Ok1 = alloca i1, align 1
  store i1 %Ok, ptr %Ok1, align 1
  %ok_value2 = alloca ptr, align 4
  store ptr %ok_value, ptr %ok_value2, align 4
  %err_value3 = alloca ptr, align 4
  store ptr %err_value, ptr %err_value3, align 4
  %ret_val = alloca %Result, align 8
  %ret = alloca %Result, align 8
  store %Result zeroinitializer, ptr %ret, align 4
  %Ok4 = load i1, ptr %Ok1, align 1
  %ret5 = load %Result, ptr %ret, align 4
  %access = getelementptr inbounds nuw %Result, ptr %ret, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  store i1 %Ok4, ptr %access, align 1
  %ok_value6 = load ptr, ptr %ok_value2, align 4
  %ret7 = load %Result, ptr %ret, align 4
  %access8 = getelementptr inbounds nuw %Result, ptr %ret, i32 0, i32 1
  %getmembervalue9 = load ptr, ptr %access8, align 4
  store ptr %ok_value6, ptr %access8, align 4
  %err_value10 = load ptr, ptr %err_value3, align 4
  %ret11 = load %Result, ptr %ret, align 4
  %access12 = getelementptr inbounds nuw %Result, ptr %ret, i32 0, i32 2
  %getmembervalue13 = load ptr, ptr %access12, align 4
  store ptr %err_value10, ptr %access12, align 4
  %ret14 = load %Result, ptr %ret, align 4
  ret %Result %ret14
}

define %Result @Ok(ptr %value) {
entry:
  %value1 = alloca ptr, align 4
  store ptr %value, ptr %value1, align 4
  %ret_val = alloca %Result, align 8
  %value2 = load ptr, ptr %value1, align 4
  %calltmp = call ptr @null()
  %calltmp3 = call %Result @Result_new(i1 true, ptr %value2, ptr %calltmp)
  ret %Result %calltmp3
}

define %Result @Err(ptr %value) {
entry:
  %value1 = alloca ptr, align 4
  store ptr %value, ptr %value1, align 4
  %ret_val = alloca %Result, align 8
  %calltmp = call ptr @null()
  %value2 = load ptr, ptr %value1, align 4
  %calltmp3 = call %Result @Result_new(i1 false, ptr %calltmp, ptr %value2)
  ret %Result %calltmp3
}

define i1 @is_ok(%Result %self) {
entry:
  %self1 = alloca %Result, align 8
  store %Result %self, ptr %self1, align 4
  %ret_val = alloca i1, align 1
  %self2 = load %Result, ptr %self1, align 4
  %access = getelementptr inbounds nuw %Result, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  ret i1 %getmembervalue
}

define ptr @"unwrap?"(%Result %self) {
entry:
  %self1 = alloca %Result, align 8
  store %Result %self, ptr %self1, align 4
  %ret_val = alloca ptr, align 4
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self2 = load %Result, ptr %self1, align 4
  %access = getelementptr inbounds nuw %Result, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  br i1 %getmembervalue, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %self3 = load %Result, ptr %self1, align 4
  %access4 = getelementptr inbounds nuw %Result, ptr %self1, i32 0, i32 1
  %getmembervalue5 = load ptr, ptr %access4, align 4
  ret ptr %getmembervalue5

if.else:                                          ; preds = %if.cond.0
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_28, ptr @str_27)
  call void @exit(i32 1)
  %calltmp = call ptr @null()
  ret ptr %calltmp
}

define ptr @"unwrap_or?"(%Result %self, ptr %or_value) {
entry:
  %self1 = alloca %Result, align 8
  store %Result %self, ptr %self1, align 4
  %or_value2 = alloca ptr, align 4
  store ptr %or_value, ptr %or_value2, align 4
  %ret_val = alloca ptr, align 4
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self3 = load %Result, ptr %self1, align 4
  %access = getelementptr inbounds nuw %Result, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  br i1 %getmembervalue, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %self4 = load %Result, ptr %self1, align 4
  %access5 = getelementptr inbounds nuw %Result, ptr %self1, i32 0, i32 1
  %getmembervalue6 = load ptr, ptr %access5, align 4
  ret ptr %getmembervalue6

if.else:                                          ; preds = %if.cond.0
  %or_value7 = load ptr, ptr %or_value2, align 4
  ret ptr %or_value7
}

define ptr @"expect?"(%Result %self, ptr %error_message) {
entry:
  %self1 = alloca %Result, align 8
  store %Result %self, ptr %self1, align 4
  %error_message2 = alloca ptr, align 4
  store ptr %error_message, ptr %error_message2, align 4
  %ret_val = alloca ptr, align 4
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self3 = load %Result, ptr %self1, align 4
  %access = getelementptr inbounds nuw %Result, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  br i1 %getmembervalue, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %self4 = load %Result, ptr %self1, align 4
  %access5 = getelementptr inbounds nuw %Result, ptr %self1, i32 0, i32 1
  %getmembervalue6 = load ptr, ptr %access5, align 4
  ret ptr %getmembervalue6

if.else:                                          ; preds = %if.cond.0
  %error_message7 = load ptr, ptr %error_message2, align 4
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_29, ptr %error_message7)
  call void @exit(i32 1)
  %calltmp = call ptr @null()
  ret ptr %calltmp
}

define void @toplevel_child.0() {
entry:
  ret void
}

declare ptr @fgets(ptr, i32, ptr)

declare i32 @feof(ptr)

define i32 @__read_line_raw(ptr %buf, i32 %cap) {
entry:
  %buf1 = alloca ptr, align 4
  store ptr %buf, ptr %buf1, align 4
  %cap2 = alloca i32, align 4
  store i32 %cap, ptr %cap2, align 4
  %ret_val = alloca i32, align 4
  %stdin = load ptr, ptr @stdin, align 4
  %fp = alloca ptr, align 4
  store ptr %stdin, ptr %fp, align 4
  %buf3 = load ptr, ptr %buf1, align 4
  %cap4 = load i32, ptr %cap2, align 4
  %fp5 = load ptr, ptr %fp, align 4
  %calltmp = call ptr @fgets(ptr %buf3, i32 %cap4, ptr %fp5)
  %r = alloca ptr, align 4
  store ptr %calltmp, ptr %r, align 4
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %r6 = load ptr, ptr %r, align 4
  %calltmp7 = call ptr @null()
  %ptr_a_i = ptrtoint ptr %r6 to i64
  %ptr_b_i = ptrtoint ptr %calltmp7 to i64
  %eq = icmp eq i64 %ptr_a_i, %ptr_b_i
  br i1 %eq, label %if.then.0, label %if.end

if.then.0:                                        ; preds = %if.cond.0
  br label %if.cond.08

if.end:                                           ; preds = %if.cond.0
  %i = alloca i32, align 4
  store i32 0, ptr %i, align 4
  br label %loop_start-loop

if.cond.08:                                       ; preds = %if.then.0
  %fp10 = load ptr, ptr %fp, align 4
  %calltmp11 = call i32 @feof(ptr %fp10)
  %sgt = icmp sgt i32 %calltmp11, 0
  br i1 %sgt, label %if.then.09, label %if.end12

if.then.09:                                       ; preds = %if.cond.08
  ret i32 0

if.end12:                                         ; preds = %if.cond.08
  ret i32 -1

loop_start-loop:                                  ; preds = %if.end
  br label %continue-loop

continue-loop:                                    ; preds = %if.end18, %loop_start-loop
  br i1 true, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  br label %if.cond.013

break-loop:                                       ; preds = %continue-loop
  ret i32 -1

if.cond.013:                                      ; preds = %no_judge_continue-loop
  %buf15 = load ptr, ptr %buf1, align 4
  %i16 = load i32, ptr %i, align 4
  %idx_i64 = sext i32 %i16 to i64
  %idx_ptr = getelementptr i8, ptr %buf15, i64 %idx_i64
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  %eq17 = icmp eq i8 %"idx[]_load", 0
  br i1 %eq17, label %if.then.014, label %if.end18

if.then.014:                                      ; preds = %if.cond.013
  %i19 = load i32, ptr %i, align 4
  ret i32 %i19

if.end18:                                         ; preds = %if.cond.013
  %i20 = load i32, ptr %i, align 4
  %add = add i32 %i20, 1
  store i32 %add, ptr %i, align 4
  br label %continue-loop
}

define %Result @read_line(ptr %buf, ptr %add_len) {
entry:
  %buf1 = alloca ptr, align 4
  store ptr %buf, ptr %buf1, align 4
  %add_len2 = alloca ptr, align 4
  store ptr %add_len, ptr %add_len2, align 4
  %ret_val = alloca %Result, align 8
  %buf3 = load ptr, ptr %buf1, align 4
  %deref = load %String, ptr %buf3, align 4
  %access = getelementptr inbounds nuw %String, ptr %buf3, i32 0, i32 1
  %getmembervalue = load i32, ptr %access, align 4
  %before = alloca i32, align 4
  store i32 %getmembervalue, ptr %before, align 4
  br label %loop_start-read

loop_start-read:                                  ; preds = %entry
  br label %continue-read

continue-read:                                    ; preds = %if.end28, %loop_start-read
  br i1 true, label %no_judge_continue-read, label %break-read

no_judge_continue-read:                           ; preds = %continue-read
  %cap_add = alloca i32, align 4
  store i32 256, ptr %cap_add, align 4
  %cap_add4 = load i32, ptr %cap_add, align 4
  %malloc_call = call ptr @malloc(i32 %cap_add4)
  %temp_dst = alloca ptr, align 4
  store ptr %malloc_call, ptr %temp_dst, align 4
  %temp_dst5 = load ptr, ptr %temp_dst, align 4
  %cap_add6 = load i32, ptr %cap_add, align 4
  %calltmp = call i32 @__read_line_raw(ptr %temp_dst5, i32 %cap_add6)
  %n = alloca i32, align 4
  store i32 %calltmp, ptr %n, align 4
  br label %if.cond.0

break-read:                                       ; preds = %if.then.019, %continue-read
  %buf29 = load ptr, ptr %buf1, align 4
  %deref30 = load %String, ptr %buf29, align 4
  %access31 = getelementptr inbounds nuw %String, ptr %buf29, i32 0, i32 1
  %getmembervalue32 = load i32, ptr %access31, align 4
  %before33 = load i32, ptr %before, align 4
  %sub34 = sub i32 %getmembervalue32, %before33
  %add_len35 = load ptr, ptr %add_len2, align 4
  store i32 %sub34, ptr %add_len35, align 4
  %add_len36 = load ptr, ptr %add_len2, align 4
  %calltmp37 = call %Result @Ok(ptr %add_len36)
  ret %Result %calltmp37

if.cond.0:                                        ; preds = %no_judge_continue-read
  %n7 = load i32, ptr %n, align 4
  %slt = icmp slt i32 %n7, 0
  br i1 %slt, label %if.then.0, label %if.cond.1

if.then.0:                                        ; preds = %if.cond.0
  %calltmp8 = call %Result @Err(ptr @str_30)
  ret %Result %calltmp8

if.cond.1:                                        ; preds = %if.cond.0
  %n9 = load i32, ptr %n, align 4
  %eq = icmp eq i32 %n9, 0
  br i1 %eq, label %if.then.1, label %if.end

if.then.1:                                        ; preds = %if.cond.1
  %add_len10 = load ptr, ptr %add_len2, align 4
  store i32 0, ptr %add_len10, align 4
  %add_len11 = load ptr, ptr %add_len2, align 4
  %calltmp12 = call %Result @Ok(ptr %add_len11)
  ret %Result %calltmp12

if.end:                                           ; preds = %if.cond.1
  %temp_dst13 = load ptr, ptr %temp_dst, align 4
  %calltmp14 = call %String @String_from(ptr %temp_dst13)
  %temp_string = alloca %String, align 8
  store %String %calltmp14, ptr %temp_string, align 4
  %temp_dst15 = load ptr, ptr %temp_dst, align 4
  call void @free(ptr %temp_dst15)
  %buf16 = load ptr, ptr %buf1, align 4
  %calltmp17 = call ptr @String_push(ptr %buf16, ptr %temp_string)
  call void @String_free(ptr %temp_string)
  br label %if.cond.018

if.cond.018:                                      ; preds = %if.end
  %buf20 = load ptr, ptr %buf1, align 4
  %deref21 = load %String, ptr %buf20, align 4
  %buf22 = load ptr, ptr %buf1, align 4
  %deref23 = load %String, ptr %buf22, align 4
  %access24 = getelementptr inbounds nuw %String, ptr %buf22, i32 0, i32 1
  %getmembervalue25 = load i32, ptr %access24, align 4
  %sub = sub i32 %getmembervalue25, 1
  %calltmp26 = call i8 @String_get(%String %deref21, i32 %sub)
  %eq27 = icmp eq i8 %calltmp26, 10
  br i1 %eq27, label %if.then.019, label %if.end28

if.then.019:                                      ; preds = %if.cond.018
  br label %break-read
  br label %if.end28

if.end28:                                         ; preds = %if.then.019, %if.cond.018
  br label %continue-read
}

define i32 @__main_argc_argv(i32 %argc, ptr %argv) {
entry:
  %argc1 = alloca i32, align 4
  store i32 %argc, ptr %argc1, align 4
  %argv2 = alloca ptr, align 4
  store ptr %argv, ptr %argv2, align 4
  %ret_val = alloca i32, align 4
  %calltmp = call %String @String_new(i32 0)
  %input = alloca %String, align 8
  store %String %calltmp, ptr %input, align 4
  %add_len = alloca i32, align 4
  store i32 0, ptr %add_len, align 4
  %calltmp3 = call %Result @read_line(ptr %input, ptr %add_len)
  %calltmp4 = call ptr @"unwrap?"(%Result %calltmp3)
  %n = alloca i32, align 4
  store i32 0, ptr %n, align 4
  %input5 = load %String, ptr %input, align 4
  %calltmp6 = call %VecT @String_split_whitespace(%String %input5)
  %v = alloca %VecT, align 8
  store %VecT %calltmp6, ptr %v, align 4
  %v7 = load %VecT, ptr %v, align 4
  %calltmp8 = call %Iterator @VecT_iter(%VecT %v7)
  %it = alloca %Iterator, align 8
  store %Iterator %calltmp8, ptr %it, align 4
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %calltmp9 = call %Option @iter_peek(ptr %it)
  %calltmp10 = call i1 @is_some(%Option %calltmp9)
  br i1 %calltmp10, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %calltmp11 = call %Option @iter_next(ptr %it)
  %calltmp12 = call ptr @unwrap(%Option %calltmp11)
  %deref = load %StrSlice, ptr %calltmp12, align 4
  %str = alloca %StrSlice, align 8
  store %StrSlice %deref, ptr %str, align 4
  %str13 = load %StrSlice, ptr %str, align 4
  %calltmp14 = call %String @StrSlice_to_String(%StrSlice %str13)
  %string = alloca %String, align 8
  store %String %calltmp14, ptr %string, align 4
  %string15 = load %String, ptr %string, align 4
  %calltmp16 = call ptr @String_as_str(%String %string15)
  %calltmp17 = call i32 (ptr, ...) @printf(ptr @str_31, ptr %calltmp16)
  call void @String_free(ptr %string)
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %calltmp18 = call i32 (ptr, ...) @printf(ptr @str_32)
  call void @VecT_free(ptr %v)
  call void @String_free(ptr %input)
  ret i32 0
}

define i32 @main(i32 %argc, ptr %argv) {
entry:
  call void @toplevel_child.0()
  ret i32 0
}

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
