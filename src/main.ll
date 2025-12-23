; ModuleID = 'wapl_module'
source_filename = "wapl_module"

%VecT = type { ptr, i64, i64, i64 }
%String = type { ptr, i64, i64 }
%timespec = type { i64, i64 }
%KeyMap = type { ptr, i64, i64, i64 }
%Entry = type { %String, ptr }
%Complex = type { double, double }
%Option = type { i1, ptr }
%Iterator = type { ptr, ptr, ptr, i64 }

@str_0 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@str_1 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@str_2 = private unnamed_addr constant [4 x i8] c"Yes\00", align 1
@str_3 = private unnamed_addr constant [3 x i8] c"No\00", align 1
@str_4 = private unnamed_addr constant [13 x i8] c"Hello World!\00", align 1
@println_fmt_5 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_6 = private unnamed_addr constant [13 x i8] c"Hello World!\00", align 1
@str_7 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@str_8 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@str_9 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@str_10 = private unnamed_addr constant [10 x i8] c"%1000000s\00", align 1
@str_11 = private unnamed_addr constant [25 x i8] c"The TextFile is Too Long\00", align 1
@println_fmt_12 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_13 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@println_fmt_14 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_15 = private unnamed_addr constant [28 x i8] c"KeyMap_insert: miss realloc\00", align 1
@println_fmt_16 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_17 = private unnamed_addr constant [28 x i8] c"KeyMap_insert: miss realloc\00", align 1
@println_fmt_18 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_19 = private unnamed_addr constant [8 x i8] c"\1B[2J\1B[H\00", align 1
@println_fmt_20 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_21 = private unnamed_addr constant [13 x i8] c"c = %g + %gi\00", align 1
@println_fmt_22 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_23 = private unnamed_addr constant [24 x i8] c"Error:unexpected unwrap\00", align 1
@println_fmt_24 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@println_fmt_25 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_26 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@str_27 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@println_fmt_28 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

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

define ptr @SayHello() {
entry:
  %ret_val = alloca ptr, align 8
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_5, ptr @str_4)
  %fmt_buf = alloca [128 x i8], align 1
  %sprintf = call i32 (ptr, ptr, ...) @sprintf(ptr %fmt_buf, ptr @str_6)
  ret ptr %fmt_buf
}

define %VecT @VecT_new(i64 %e_size, i64 %capa) {
entry:
  %e_size1 = alloca i64, align 8
  store i64 %e_size, ptr %e_size1, align 4
  %capa2 = alloca i64, align 8
  store i64 %capa, ptr %capa2, align 4
  %ret_val = alloca %VecT, align 8
  %v = alloca %VecT, align 8
  store %VecT zeroinitializer, ptr %v, align 8
  %vp = alloca ptr, align 8
  store ptr %v, ptr %vp, align 8
  %e_size3 = load i64, ptr %e_size1, align 4
  %capa4 = load i64, ptr %capa2, align 4
  %mul = mul i64 %e_size3, %capa4
  %malloc_call = call ptr @malloc(i64 %mul)
  %d = alloca ptr, align 8
  store ptr %malloc_call, ptr %d, align 8
  %d5 = load ptr, ptr %d, align 8
  %vp6 = load ptr, ptr %vp, align 8
  %access = getelementptr inbounds nuw %VecT, ptr %vp6, i32 0, i32 0
  store ptr %d5, ptr %access, align 8
  %e_size7 = load i64, ptr %e_size1, align 4
  %vp8 = load ptr, ptr %vp, align 8
  %access9 = getelementptr inbounds nuw %VecT, ptr %vp8, i32 0, i32 1
  store i64 %e_size7, ptr %access9, align 4
  %vp10 = load ptr, ptr %vp, align 8
  %access11 = getelementptr inbounds nuw %VecT, ptr %vp10, i32 0, i32 2
  store i64 0, ptr %access11, align 4
  %capa12 = load i64, ptr %capa2, align 4
  %vp13 = load ptr, ptr %vp, align 8
  %access14 = getelementptr inbounds nuw %VecT, ptr %vp13, i32 0, i32 3
  store i64 %capa12, ptr %access14, align 4
  %v15 = load %VecT, ptr %v, align 8
  ret %VecT %v15
}

define ptr @VecT_push(ptr %"&self", ptr %value) {
entry:
  %"&self1" = alloca ptr, align 8
  store ptr %"&self", ptr %"&self1", align 8
  %value2 = alloca ptr, align 8
  store ptr %value, ptr %value2, align 8
  %ret_val = alloca ptr, align 8
  %"&self3" = load ptr, ptr %"&self1", align 8
  %access = getelementptr inbounds nuw %VecT, ptr %"&self3", i32 0, i32 3
  %getmembervalue = load i64, ptr %access, align 4
  %"&self4" = load ptr, ptr %"&self1", align 8
  %access5 = getelementptr inbounds nuw %VecT, ptr %"&self4", i32 0, i32 2
  %getmembervalue6 = load i64, ptr %access5, align 4
  %eq = icmp eq i64 %getmembervalue, %getmembervalue6
  br i1 %eq, label %pending_true, label %pending_false

pending_true:                                     ; preds = %entry
  br label %capaover

pending_false:                                    ; preds = %entry
  br label %push

capaover:                                         ; preds = %pending_true
  %"&self7" = load ptr, ptr %"&self1", align 8
  %access8 = getelementptr inbounds nuw %VecT, ptr %"&self7", i32 0, i32 0
  %getmembervalue9 = load ptr, ptr %access8, align 8
  %"&self10" = load ptr, ptr %"&self1", align 8
  %access11 = getelementptr inbounds nuw %VecT, ptr %"&self10", i32 0, i32 1
  %getmembervalue12 = load i64, ptr %access11, align 4
  %"&self13" = load ptr, ptr %"&self1", align 8
  %access14 = getelementptr inbounds nuw %VecT, ptr %"&self13", i32 0, i32 3
  %getmembervalue15 = load i64, ptr %access14, align 4
  %add = add i64 %getmembervalue15, 1
  %mul = mul i64 %add, 2
  %mul16 = mul i64 %getmembervalue12, %mul
  %realloc_call = call ptr @realloc(ptr %getmembervalue9, i64 %mul16)
  %"&self17" = load ptr, ptr %"&self1", align 8
  %access18 = getelementptr inbounds nuw %VecT, ptr %"&self17", i32 0, i32 0
  store ptr %realloc_call, ptr %access18, align 8
  %"&self19" = load ptr, ptr %"&self1", align 8
  %access20 = getelementptr inbounds nuw %VecT, ptr %"&self19", i32 0, i32 3
  %getmembervalue21 = load i64, ptr %access20, align 4
  %add22 = add i64 %getmembervalue21, 1
  %mul23 = mul i64 %add22, 2
  %"&self24" = load ptr, ptr %"&self1", align 8
  %access25 = getelementptr inbounds nuw %VecT, ptr %"&self24", i32 0, i32 3
  store i64 %mul23, ptr %access25, align 4
  br label %push

push:                                             ; preds = %capaover, %pending_false
  %"&self26" = load ptr, ptr %"&self1", align 8
  %access27 = getelementptr inbounds nuw %VecT, ptr %"&self26", i32 0, i32 0
  %getmembervalue28 = load ptr, ptr %access27, align 8
  %"&self29" = load ptr, ptr %"&self1", align 8
  %access30 = getelementptr inbounds nuw %VecT, ptr %"&self29", i32 0, i32 2
  %getmembervalue31 = load i64, ptr %access30, align 4
  %"&self32" = load ptr, ptr %"&self1", align 8
  %access33 = getelementptr inbounds nuw %VecT, ptr %"&self32", i32 0, i32 1
  %getmembervalue34 = load i64, ptr %access33, align 4
  %mul35 = mul i64 %getmembervalue31, %getmembervalue34
  %ptr_add = getelementptr i8, ptr %getmembervalue28, i64 %mul35
  %value36 = load ptr, ptr %value2, align 8
  %"&self37" = load ptr, ptr %"&self1", align 8
  %access38 = getelementptr inbounds nuw %VecT, ptr %"&self37", i32 0, i32 1
  %getmembervalue39 = load i64, ptr %access38, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %ptr_add, ptr align 1 %value36, i64 %getmembervalue39, i1 false)
  %"&self40" = load ptr, ptr %"&self1", align 8
  %access41 = getelementptr inbounds nuw %VecT, ptr %"&self40", i32 0, i32 2
  %getmembervalue42 = load i64, ptr %access41, align 4
  %add43 = add i64 %getmembervalue42, 1
  %"&self44" = load ptr, ptr %"&self1", align 8
  %access45 = getelementptr inbounds nuw %VecT, ptr %"&self44", i32 0, i32 2
  store i64 %add43, ptr %access45, align 4
  %value46 = load ptr, ptr %value2, align 8
  ret ptr %value46
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #0

define ptr @VecT_get(ptr %"&self", i64 %indx) {
entry:
  %"&self1" = alloca ptr, align 8
  store ptr %"&self", ptr %"&self1", align 8
  %indx2 = alloca i64, align 8
  store i64 %indx, ptr %indx2, align 4
  %ret_val = alloca ptr, align 8
  %"&self3" = load ptr, ptr %"&self1", align 8
  %access = getelementptr inbounds nuw %VecT, ptr %"&self3", i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 8
  %indx4 = load i64, ptr %indx2, align 4
  %"&self5" = load ptr, ptr %"&self1", align 8
  %access6 = getelementptr inbounds nuw %VecT, ptr %"&self5", i32 0, i32 1
  %getmembervalue7 = load i64, ptr %access6, align 4
  %mul = mul i64 %indx4, %getmembervalue7
  %ptr_add = getelementptr i8, ptr %getmembervalue, i64 %mul
  ret ptr %ptr_add
}

define void @VecT_free(ptr %"&self") {
entry:
  %"&self1" = alloca ptr, align 8
  store ptr %"&self", ptr %"&self1", align 8
  %"&self2" = load ptr, ptr %"&self1", align 8
  %access = getelementptr inbounds nuw %VecT, ptr %"&self2", i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 8
  call void @free(ptr %getmembervalue)
  %"&self3" = load ptr, ptr %"&self1", align 8
  %access4 = getelementptr inbounds nuw %VecT, ptr %"&self3", i32 0, i32 2
  store i64 0, ptr %access4, align 4
  %"&self5" = load ptr, ptr %"&self1", align 8
  %access6 = getelementptr inbounds nuw %VecT, ptr %"&self5", i32 0, i32 3
  store i64 0, ptr %access6, align 4
  ret void
}

define %VecT @VecT_from(ptr %srcData, i64 %e_size, i64 %size) {
entry:
  %srcData1 = alloca ptr, align 8
  store ptr %srcData, ptr %srcData1, align 8
  %e_size2 = alloca i64, align 8
  store i64 %e_size, ptr %e_size2, align 4
  %size3 = alloca i64, align 8
  store i64 %size, ptr %size3, align 4
  %ret_val = alloca %VecT, align 8
  %v = alloca %VecT, align 8
  store %VecT zeroinitializer, ptr %v, align 8
  %vp = alloca ptr, align 8
  store ptr %v, ptr %vp, align 8
  %e_size4 = load i64, ptr %e_size2, align 4
  %size5 = load i64, ptr %size3, align 4
  %mul = mul i64 %e_size4, %size5
  %malloc_call = call ptr @malloc(i64 %mul)
  %d = alloca ptr, align 8
  store ptr %malloc_call, ptr %d, align 8
  %d6 = load ptr, ptr %d, align 8
  %srcData7 = load ptr, ptr %srcData1, align 8
  %e_size8 = load i64, ptr %e_size2, align 4
  %size9 = load i64, ptr %size3, align 4
  %mul10 = mul i64 %e_size8, %size9
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %d6, ptr align 1 %srcData7, i64 %mul10, i1 false)
  %d11 = load ptr, ptr %d, align 8
  %vp12 = load ptr, ptr %vp, align 8
  %access = getelementptr inbounds nuw %VecT, ptr %vp12, i32 0, i32 0
  store ptr %d11, ptr %access, align 8
  %e_size13 = load i64, ptr %e_size2, align 4
  %vp14 = load ptr, ptr %vp, align 8
  %access15 = getelementptr inbounds nuw %VecT, ptr %vp14, i32 0, i32 1
  store i64 %e_size13, ptr %access15, align 4
  %size16 = load i64, ptr %size3, align 4
  %vp17 = load ptr, ptr %vp, align 8
  %access18 = getelementptr inbounds nuw %VecT, ptr %vp17, i32 0, i32 2
  store i64 %size16, ptr %access18, align 4
  %size19 = load i64, ptr %size3, align 4
  %vp20 = load ptr, ptr %vp, align 8
  %access21 = getelementptr inbounds nuw %VecT, ptr %vp20, i32 0, i32 3
  store i64 %size19, ptr %access21, align 4
  %v22 = load %VecT, ptr %v, align 8
  ret %VecT %v22
}

define ptr @VecT_connect(ptr %"&self", ptr %value) {
entry:
  %"&self1" = alloca ptr, align 8
  store ptr %"&self", ptr %"&self1", align 8
  %value2 = alloca ptr, align 8
  store ptr %value, ptr %value2, align 8
  %ret_val = alloca ptr, align 8
  %"&self3" = load ptr, ptr %"&self1", align 8
  %access = getelementptr inbounds nuw %VecT, ptr %"&self3", i32 0, i32 2
  %getmembervalue = load i64, ptr %access, align 4
  %value4 = load ptr, ptr %value2, align 8
  %access5 = getelementptr inbounds nuw %VecT, ptr %value4, i32 0, i32 2
  %getmembervalue6 = load i64, ptr %access5, align 4
  %add = add i64 %getmembervalue, %getmembervalue6
  %newlen = alloca i64, align 8
  store i64 %add, ptr %newlen, align 4
  %newlen7 = load i64, ptr %newlen, align 4
  %"&self8" = load ptr, ptr %"&self1", align 8
  %access9 = getelementptr inbounds nuw %VecT, ptr %"&self8", i32 0, i32 1
  %getmembervalue10 = load i64, ptr %access9, align 4
  %mul = mul i64 %newlen7, %getmembervalue10
  %needed = alloca i64, align 8
  store i64 %mul, ptr %needed, align 4
  br label %loop_start-capaover

loop_start-capaover:                              ; preds = %entry
  br label %continue-capaover

continue-capaover:                                ; preds = %no_judge_continue-capaover, %loop_start-capaover
  %"&self11" = load ptr, ptr %"&self1", align 8
  %access12 = getelementptr inbounds nuw %VecT, ptr %"&self11", i32 0, i32 3
  %getmembervalue13 = load i64, ptr %access12, align 4
  %newlen14 = load i64, ptr %newlen, align 4
  %sle = icmp sle i64 %getmembervalue13, %newlen14
  br i1 %sle, label %no_judge_continue-capaover, label %break-capaover

no_judge_continue-capaover:                       ; preds = %continue-capaover
  %newlen15 = load i64, ptr %newlen, align 4
  %mul16 = mul i64 %newlen15, 2
  %newcap = alloca i64, align 8
  store i64 %mul16, ptr %newcap, align 4
  %"&self17" = load ptr, ptr %"&self1", align 8
  %access18 = getelementptr inbounds nuw %VecT, ptr %"&self17", i32 0, i32 0
  %getmembervalue19 = load ptr, ptr %access18, align 8
  %newcap20 = load i64, ptr %newcap, align 4
  %"&self21" = load ptr, ptr %"&self1", align 8
  %access22 = getelementptr inbounds nuw %VecT, ptr %"&self21", i32 0, i32 1
  %getmembervalue23 = load i64, ptr %access22, align 4
  %mul24 = mul i64 %newcap20, %getmembervalue23
  %realloc_call = call ptr @realloc(ptr %getmembervalue19, i64 %mul24)
  %"&self25" = load ptr, ptr %"&self1", align 8
  %access26 = getelementptr inbounds nuw %VecT, ptr %"&self25", i32 0, i32 0
  %getmembervalue27 = load ptr, ptr %access26, align 8
  store ptr %realloc_call, ptr %access26, align 8
  %newcap28 = load i64, ptr %newcap, align 4
  %"&self29" = load ptr, ptr %"&self1", align 8
  %access30 = getelementptr inbounds nuw %VecT, ptr %"&self29", i32 0, i32 3
  %getmembervalue31 = load i64, ptr %access30, align 4
  store i64 %newcap28, ptr %access30, align 4
  br label %break-capaover
  br label %continue-capaover

break-capaover:                                   ; preds = %no_judge_continue-capaover, %continue-capaover
  %"&self32" = load ptr, ptr %"&self1", align 8
  %access33 = getelementptr inbounds nuw %VecT, ptr %"&self32", i32 0, i32 0
  %getmembervalue34 = load ptr, ptr %access33, align 8
  %"&self35" = load ptr, ptr %"&self1", align 8
  %access36 = getelementptr inbounds nuw %VecT, ptr %"&self35", i32 0, i32 2
  %getmembervalue37 = load i64, ptr %access36, align 4
  %"&self38" = load ptr, ptr %"&self1", align 8
  %access39 = getelementptr inbounds nuw %VecT, ptr %"&self38", i32 0, i32 1
  %getmembervalue40 = load i64, ptr %access39, align 4
  %mul41 = mul i64 %getmembervalue37, %getmembervalue40
  %ptr_add = getelementptr i8, ptr %getmembervalue34, i64 %mul41
  %value42 = load ptr, ptr %value2, align 8
  %access43 = getelementptr inbounds nuw %VecT, ptr %value42, i32 0, i32 0
  %getmembervalue44 = load ptr, ptr %access43, align 8
  %value45 = load ptr, ptr %value2, align 8
  %access46 = getelementptr inbounds nuw %VecT, ptr %value45, i32 0, i32 2
  %getmembervalue47 = load i64, ptr %access46, align 4
  %value48 = load ptr, ptr %value2, align 8
  %access49 = getelementptr inbounds nuw %VecT, ptr %value48, i32 0, i32 1
  %getmembervalue50 = load i64, ptr %access49, align 4
  %mul51 = mul i64 %getmembervalue47, %getmembervalue50
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %ptr_add, ptr align 1 %getmembervalue44, i64 %mul51, i1 false)
  %newlen52 = load i64, ptr %newlen, align 4
  %"&self53" = load ptr, ptr %"&self1", align 8
  %access54 = getelementptr inbounds nuw %VecT, ptr %"&self53", i32 0, i32 2
  %getmembervalue55 = load i64, ptr %access54, align 4
  store i64 %newlen52, ptr %access54, align 4
  %value56 = load ptr, ptr %value2, align 8
  ret ptr %value56
}

define %VecT @VecT_rangei64(i64 %start, i64 %end, i64 %step) {
entry:
  %start1 = alloca i64, align 8
  store i64 %start, ptr %start1, align 4
  %end2 = alloca i64, align 8
  store i64 %end, ptr %end2, align 4
  %step3 = alloca i64, align 8
  store i64 %step, ptr %step3, align 4
  %ret_val = alloca %VecT, align 8
  %end4 = load i64, ptr %end2, align 4
  %start5 = load i64, ptr %start1, align 4
  %sub = sub i64 %end4, %start5
  %step6 = load i64, ptr %step3, align 4
  %div = sdiv i64 %sub, %step6
  %calltmp = call %VecT @VecT_new(i64 8, i64 %div)
  %v = alloca %VecT, align 8
  store %VecT %calltmp, ptr %v, align 8
  %start7 = load i64, ptr %start1, align 4
  %i = alloca i64, align 8
  store i64 %start7, ptr %i, align 4
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %i8 = load i64, ptr %i, align 4
  %end9 = load i64, ptr %end2, align 4
  %slt = icmp slt i64 %i8, %end9
  br i1 %slt, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %calltmp10 = call ptr @VecT_push(ptr %v, ptr %i)
  %i11 = load i64, ptr %i, align 4
  %step12 = load i64, ptr %step3, align 4
  %add = add i64 %i11, %step12
  store i64 %add, ptr %i, align 4
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %v13 = load %VecT, ptr %v, align 8
  ret %VecT %v13
}

declare i32 @strcmp(ptr, ptr)

define %String @String_new(i64 %capa) {
entry:
  %capa1 = alloca i64, align 8
  store i64 %capa, ptr %capa1, align 4
  %ret_val = alloca %String, align 8
  %v = alloca %String, align 8
  store %String zeroinitializer, ptr %v, align 8
  %vp = alloca ptr, align 8
  store ptr %v, ptr %vp, align 8
  %capa2 = load i64, ptr %capa1, align 4
  %add = add i64 %capa2, 1
  %malloc_call = call ptr @malloc(i64 %add)
  %d = alloca ptr, align 8
  store ptr %malloc_call, ptr %d, align 8
  %d3 = load ptr, ptr %d, align 8
  %vp4 = load ptr, ptr %vp, align 8
  %access = getelementptr inbounds nuw %String, ptr %vp4, i32 0, i32 0
  store ptr %d3, ptr %access, align 8
  %vp5 = load ptr, ptr %vp, align 8
  %access6 = getelementptr inbounds nuw %String, ptr %vp5, i32 0, i32 1
  store i64 0, ptr %access6, align 4
  %capa7 = load i64, ptr %capa1, align 4
  %vp8 = load ptr, ptr %vp, align 8
  %access9 = getelementptr inbounds nuw %String, ptr %vp8, i32 0, i32 2
  store i64 %capa7, ptr %access9, align 4
  %v10 = load %String, ptr %v, align 8
  ret %String %v10
}

define i64 @String_strlen(ptr %c) {
entry:
  %c1 = alloca ptr, align 8
  store ptr %c, ptr %c1, align 8
  %ret_val = alloca i64, align 8
  %i = alloca i64, align 8
  store i64 0, ptr %i, align 4
  br label %LoopStart

LoopStart:                                        ; preds = %InLoop, %entry
  %c2 = load ptr, ptr %c1, align 8
  %i3 = load i64, ptr %i, align 4
  %idx_ptr = getelementptr i8, ptr %c2, i64 %i3
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  %eq = icmp eq i8 %"idx[]_load", 0
  br i1 %eq, label %pending_true, label %pending_false

pending_true:                                     ; preds = %LoopStart
  br label %Break

pending_false:                                    ; preds = %LoopStart
  br label %InLoop

InLoop:                                           ; preds = %pending_false
  %i4 = load i64, ptr %i, align 4
  %add = add i64 %i4, 1
  store i64 %add, ptr %i, align 4
  br label %LoopStart

Break:                                            ; preds = %pending_true
  %i5 = load i64, ptr %i, align 4
  ret i64 %i5
}

define %String @String_from(ptr %c) {
entry:
  %c1 = alloca ptr, align 8
  store ptr %c, ptr %c1, align 8
  %ret_val = alloca %String, align 8
  %v = alloca %String, align 8
  store %String zeroinitializer, ptr %v, align 8
  %vp = alloca ptr, align 8
  store ptr %v, ptr %vp, align 8
  %c2 = load ptr, ptr %c1, align 8
  %calltmp = call i64 @String_strlen(ptr %c2)
  %c_len = alloca i64, align 8
  store i64 %calltmp, ptr %c_len, align 4
  %c_len3 = load i64, ptr %c_len, align 4
  %add = add i64 %c_len3, 1
  %malloc_call = call ptr @malloc(i64 %add)
  %d = alloca ptr, align 8
  store ptr %malloc_call, ptr %d, align 8
  %d4 = load ptr, ptr %d, align 8
  %vp5 = load ptr, ptr %vp, align 8
  %access = getelementptr inbounds nuw %String, ptr %vp5, i32 0, i32 0
  store ptr %d4, ptr %access, align 8
  %c_len6 = load i64, ptr %c_len, align 4
  %vp7 = load ptr, ptr %vp, align 8
  %access8 = getelementptr inbounds nuw %String, ptr %vp7, i32 0, i32 1
  store i64 %c_len6, ptr %access8, align 4
  %c_len9 = load i64, ptr %c_len, align 4
  %vp10 = load ptr, ptr %vp, align 8
  %access11 = getelementptr inbounds nuw %String, ptr %vp10, i32 0, i32 2
  store i64 %c_len9, ptr %access11, align 4
  %vp12 = load ptr, ptr %vp, align 8
  %access13 = getelementptr inbounds nuw %String, ptr %vp12, i32 0, i32 0
  %deref = load ptr, ptr %access13, align 8
  %c14 = load ptr, ptr %c1, align 8
  %c_len15 = load i64, ptr %c_len, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %deref, ptr align 1 %c14, i64 %c_len15, i1 false)
  %vp16 = load ptr, ptr %vp, align 8
  %access17 = getelementptr inbounds nuw %String, ptr %vp16, i32 0, i32 0
  %deref18 = load ptr, ptr %access17, align 8
  %vp19 = load ptr, ptr %vp, align 8
  %access20 = getelementptr inbounds nuw %String, ptr %vp19, i32 0, i32 1
  %deref21 = load i64, ptr %access20, align 4
  %idx_ptr = getelementptr i8, ptr %deref18, i64 %deref21
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  store i8 0, ptr %idx_ptr, align 1
  %v22 = load %String, ptr %v, align 8
  ret %String %v22
}

define ptr @String_push(ptr %"&self", ptr %value) {
entry:
  %"&self1" = alloca ptr, align 8
  store ptr %"&self", ptr %"&self1", align 8
  %value2 = alloca ptr, align 8
  store ptr %value, ptr %value2, align 8
  %ret_val = alloca ptr, align 8
  %"&self3" = load ptr, ptr %"&self1", align 8
  %access = getelementptr inbounds nuw %String, ptr %"&self3", i32 0, i32 1
  %getmembervalue = load i64, ptr %access, align 4
  %value4 = load ptr, ptr %value2, align 8
  %access5 = getelementptr inbounds nuw %String, ptr %value4, i32 0, i32 1
  %getmembervalue6 = load i64, ptr %access5, align 4
  %add = add i64 %getmembervalue, %getmembervalue6
  %needed = alloca i64, align 8
  store i64 %add, ptr %needed, align 4
  br label %loop_start-capaover

loop_start-capaover:                              ; preds = %entry
  br label %continue-capaover

continue-capaover:                                ; preds = %no_judge_continue-capaover, %loop_start-capaover
  %"&self7" = load ptr, ptr %"&self1", align 8
  %access8 = getelementptr inbounds nuw %String, ptr %"&self7", i32 0, i32 2
  %getmembervalue9 = load i64, ptr %access8, align 4
  %needed10 = load i64, ptr %needed, align 4
  %add11 = add i64 %needed10, 1
  %slt = icmp slt i64 %getmembervalue9, %add11
  br i1 %slt, label %no_judge_continue-capaover, label %break-capaover

no_judge_continue-capaover:                       ; preds = %continue-capaover
  %needed12 = load i64, ptr %needed, align 4
  %mul = mul i64 %needed12, 2
  %newcap = alloca i64, align 8
  store i64 %mul, ptr %newcap, align 4
  %"&self13" = load ptr, ptr %"&self1", align 8
  %access14 = getelementptr inbounds nuw %String, ptr %"&self13", i32 0, i32 0
  %getmembervalue15 = load ptr, ptr %access14, align 8
  %newcap16 = load i64, ptr %newcap, align 4
  %add17 = add i64 %newcap16, 1
  %realloc_call = call ptr @realloc(ptr %getmembervalue15, i64 %add17)
  %"&self18" = load ptr, ptr %"&self1", align 8
  %access19 = getelementptr inbounds nuw %String, ptr %"&self18", i32 0, i32 0
  %getmembervalue20 = load ptr, ptr %access19, align 8
  store ptr %realloc_call, ptr %access19, align 8
  %newcap21 = load i64, ptr %newcap, align 4
  %"&self22" = load ptr, ptr %"&self1", align 8
  %access23 = getelementptr inbounds nuw %String, ptr %"&self22", i32 0, i32 2
  %getmembervalue24 = load i64, ptr %access23, align 4
  store i64 %newcap21, ptr %access23, align 4
  br label %break-capaover
  br label %continue-capaover

break-capaover:                                   ; preds = %no_judge_continue-capaover, %continue-capaover
  %"&self25" = load ptr, ptr %"&self1", align 8
  %access26 = getelementptr inbounds nuw %String, ptr %"&self25", i32 0, i32 0
  %getmembervalue27 = load ptr, ptr %access26, align 8
  %"&self28" = load ptr, ptr %"&self1", align 8
  %access29 = getelementptr inbounds nuw %String, ptr %"&self28", i32 0, i32 1
  %getmembervalue30 = load i64, ptr %access29, align 4
  %ptr_add = getelementptr i8, ptr %getmembervalue27, i64 %getmembervalue30
  %value31 = load ptr, ptr %value2, align 8
  %access32 = getelementptr inbounds nuw %String, ptr %value31, i32 0, i32 0
  %getmembervalue33 = load ptr, ptr %access32, align 8
  %value34 = load ptr, ptr %value2, align 8
  %access35 = getelementptr inbounds nuw %String, ptr %value34, i32 0, i32 1
  %getmembervalue36 = load i64, ptr %access35, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %ptr_add, ptr align 1 %getmembervalue33, i64 %getmembervalue36, i1 false)
  %needed37 = load i64, ptr %needed, align 4
  %"&self38" = load ptr, ptr %"&self1", align 8
  %access39 = getelementptr inbounds nuw %String, ptr %"&self38", i32 0, i32 1
  %getmembervalue40 = load i64, ptr %access39, align 4
  store i64 %needed37, ptr %access39, align 4
  %"&self41" = load ptr, ptr %"&self1", align 8
  %access42 = getelementptr inbounds nuw %String, ptr %"&self41", i32 0, i32 0
  %deref = load ptr, ptr %access42, align 8
  %"&self43" = load ptr, ptr %"&self1", align 8
  %access44 = getelementptr inbounds nuw %String, ptr %"&self43", i32 0, i32 1
  %deref45 = load i64, ptr %access44, align 4
  %idx_ptr = getelementptr i8, ptr %deref, i64 %deref45
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  store i8 0, ptr %idx_ptr, align 1
  %"&self46" = load ptr, ptr %"&self1", align 8
  ret ptr %"&self46"
}

define i8 @String_get(ptr %"&self", i64 %indx) {
entry:
  %"&self1" = alloca ptr, align 8
  store ptr %"&self", ptr %"&self1", align 8
  %indx2 = alloca i64, align 8
  store i64 %indx, ptr %indx2, align 4
  %ret_val = alloca i8, align 1
  %"&self3" = load ptr, ptr %"&self1", align 8
  %access = getelementptr inbounds nuw %String, ptr %"&self3", i32 0, i32 0
  %deref = load ptr, ptr %access, align 8
  %indx4 = load i64, ptr %indx2, align 4
  %idx_ptr = getelementptr i8, ptr %deref, i64 %indx4
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  ret i8 %"idx[]_load"
}

define void @String_free(ptr %"&self") {
entry:
  %"&self1" = alloca ptr, align 8
  store ptr %"&self", ptr %"&self1", align 8
  %"&self2" = load ptr, ptr %"&self1", align 8
  %access = getelementptr inbounds nuw %String, ptr %"&self2", i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 8
  call void @free(ptr %getmembervalue)
  %"&self3" = load ptr, ptr %"&self1", align 8
  %access4 = getelementptr inbounds nuw %String, ptr %"&self3", i32 0, i32 1
  store i64 0, ptr %access4, align 4
  %"&self5" = load ptr, ptr %"&self1", align 8
  %access6 = getelementptr inbounds nuw %String, ptr %"&self5", i32 0, i32 2
  store i64 0, ptr %access6, align 4
  ret void
}

define i64 @str_cmp(ptr %str1, ptr %str2) {
entry:
  %str11 = alloca ptr, align 8
  store ptr %str1, ptr %str11, align 8
  %str22 = alloca ptr, align 8
  store ptr %str2, ptr %str22, align 8
  %ret_val = alloca i64, align 8
  %str13 = load ptr, ptr %str11, align 8
  %str24 = load ptr, ptr %str22, align 8
  %calltmp = call i32 @strcmp(ptr %str13, ptr %str24)
  %i32_to_i64 = sext i32 %calltmp to i64
  ret i64 %i32_to_i64
}

define i64 @String_cmp(%String %string1, %String %string2) {
entry:
  %string11 = alloca %String, align 8
  store %String %string1, ptr %string11, align 8
  %string22 = alloca %String, align 8
  store %String %string2, ptr %string22, align 8
  %ret_val = alloca i64, align 8
  %string13 = load %String, ptr %string11, align 8
  %access = getelementptr inbounds nuw %String, ptr %string11, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 8
  %string24 = load %String, ptr %string22, align 8
  %access5 = getelementptr inbounds nuw %String, ptr %string22, i32 0, i32 0
  %getmembervalue6 = load ptr, ptr %access5, align 8
  %calltmp = call i32 @strcmp(ptr %getmembervalue, ptr %getmembervalue6)
  %i32_to_i64 = sext i32 %calltmp to i64
  ret i64 %i32_to_i64
}

define i1 @str_eq(ptr %str1, ptr %str2) {
entry:
  %str11 = alloca ptr, align 8
  store ptr %str1, ptr %str11, align 8
  %str22 = alloca ptr, align 8
  store ptr %str2, ptr %str22, align 8
  %ret_val = alloca i1, align 1
  %str13 = load ptr, ptr %str11, align 8
  %str24 = load ptr, ptr %str22, align 8
  %calltmp = call i32 @strcmp(ptr %str13, ptr %str24)
  %eq = icmp eq i32 %calltmp, 0
  ret i1 %eq
}

define %VecT @String_to_VecT(%String %string) {
entry:
  %string1 = alloca %String, align 8
  store %String %string, ptr %string1, align 8
  %ret_val = alloca %VecT, align 8
  %string2 = load %String, ptr %string1, align 8
  %access = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 8
  %string3 = load %String, ptr %string1, align 8
  %access4 = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 1
  %getmembervalue5 = load i64, ptr %access4, align 4
  %calltmp = call %VecT @VecT_from(ptr %getmembervalue, i64 1, i64 %getmembervalue5)
  ret %VecT %calltmp
}

define %String @String_clone(%String %string) {
entry:
  %string1 = alloca %String, align 8
  store %String %string, ptr %string1, align 8
  %ret_val = alloca %String, align 8
  %clone = alloca %String, align 8
  store %String zeroinitializer, ptr %clone, align 8
  %string2 = load %String, ptr %string1, align 8
  %access = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 1
  %getmembervalue = load i64, ptr %access, align 4
  %clone3 = load %String, ptr %clone, align 8
  %access4 = getelementptr inbounds nuw %String, ptr %clone, i32 0, i32 1
  %getmembervalue5 = load i64, ptr %access4, align 4
  store i64 %getmembervalue, ptr %access4, align 4
  %string6 = load %String, ptr %string1, align 8
  %access7 = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 2
  %getmembervalue8 = load i64, ptr %access7, align 4
  %clone9 = load %String, ptr %clone, align 8
  %access10 = getelementptr inbounds nuw %String, ptr %clone, i32 0, i32 2
  %getmembervalue11 = load i64, ptr %access10, align 4
  store i64 %getmembervalue8, ptr %access10, align 4
  %string12 = load %String, ptr %string1, align 8
  %access13 = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 2
  %getmembervalue14 = load i64, ptr %access13, align 4
  %add = add i64 %getmembervalue14, 1
  %malloc_call = call ptr @malloc(i64 %add)
  %d = alloca ptr, align 8
  store ptr %malloc_call, ptr %d, align 8
  %d15 = load ptr, ptr %d, align 8
  %string16 = load %String, ptr %string1, align 8
  %access17 = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 0
  %getmembervalue18 = load ptr, ptr %access17, align 8
  %string19 = load %String, ptr %string1, align 8
  %access20 = getelementptr inbounds nuw %String, ptr %string1, i32 0, i32 1
  %getmembervalue21 = load i64, ptr %access20, align 4
  %add22 = add i64 %getmembervalue21, 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %d15, ptr align 1 %getmembervalue18, i64 %add22, i1 false)
  %d23 = load ptr, ptr %d, align 8
  %clone24 = load %String, ptr %clone, align 8
  %access25 = getelementptr inbounds nuw %String, ptr %clone, i32 0, i32 0
  %getmembervalue26 = load ptr, ptr %access25, align 8
  store ptr %d23, ptr %access25, align 8
  %clone27 = load %String, ptr %clone, align 8
  ret %String %clone27
}

define ptr @input_i64(i64 %n) {
entry:
  %n1 = alloca i64, align 8
  store i64 %n, ptr %n1, align 4
  %ret_val = alloca ptr, align 8
  %a = alloca ptr, align 8
  store ptr null, ptr %a, align 8
  %n2 = load i64, ptr %n1, align 4
  %mul = mul i64 ptrtoint (ptr getelementptr (i64, ptr null, i32 1) to i64), %n2
  %malloc_call = call ptr @malloc(i64 %mul)
  store ptr %malloc_call, ptr %a, align 8
  %i = alloca i64, align 8
  store i64 0, ptr %i, align 4
  br label %InputStart

InputStart:                                       ; preds = %InputLoop, %entry
  %i3 = load i64, ptr %i, align 4
  %n4 = load i64, ptr %n1, align 4
  %slt = icmp slt i64 %i3, %n4
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %InputStart
  br label %InputLoop

pending_false:                                    ; preds = %InputStart
  br label %InputEnd

InputLoop:                                        ; preds = %pending_true
  %a5 = load ptr, ptr %a, align 8
  %i6 = load i64, ptr %i, align 4
  %ptr_add = getelementptr i64, ptr %a5, i64 %i6
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_7, ptr %ptr_add)
  %i7 = load i64, ptr %i, align 4
  %add = add i64 %i7, 1
  store i64 %add, ptr %i, align 4
  br label %InputStart

InputEnd:                                         ; preds = %pending_false
  br label %Solve

Solve:                                            ; preds = %InputEnd
  %a8 = load ptr, ptr %a, align 8
  ret ptr %a8
}

define ptr @input_f64(i64 %n) {
entry:
  %n1 = alloca i64, align 8
  store i64 %n, ptr %n1, align 4
  %ret_val = alloca ptr, align 8
  %a = alloca ptr, align 8
  store ptr null, ptr %a, align 8
  %n2 = load i64, ptr %n1, align 4
  %mul = mul i64 ptrtoint (ptr getelementptr (double, ptr null, i32 1) to i64), %n2
  %malloc_call = call ptr @malloc(i64 %mul)
  store ptr %malloc_call, ptr %a, align 8
  %i = alloca i64, align 8
  store i64 0, ptr %i, align 4
  br label %InputStart

InputStart:                                       ; preds = %InputLoop, %entry
  %i3 = load i64, ptr %i, align 4
  %n4 = load i64, ptr %n1, align 4
  %slt = icmp slt i64 %i3, %n4
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %InputStart
  br label %InputLoop

pending_false:                                    ; preds = %InputStart
  br label %InputEnd

InputLoop:                                        ; preds = %pending_true
  %a5 = load ptr, ptr %a, align 8
  %i6 = load i64, ptr %i, align 4
  %ptr_add = getelementptr double, ptr %a5, i64 %i6
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_8, ptr %ptr_add)
  %i7 = load i64, ptr %i, align 4
  %add = add i64 %i7, 1
  store i64 %add, ptr %i, align 4
  br label %InputStart

InputEnd:                                         ; preds = %pending_false
  br label %Solve

Solve:                                            ; preds = %InputEnd
  %a8 = load ptr, ptr %a, align 8
  ret ptr %a8
}

define ptr @input_char(i64 %n) {
entry:
  %n1 = alloca i64, align 8
  store i64 %n, ptr %n1, align 4
  %ret_val = alloca ptr, align 8
  %a = alloca ptr, align 8
  store ptr null, ptr %a, align 8
  %n2 = load i64, ptr %n1, align 4
  %mul = mul i64 %n2, 2
  %mul3 = mul i64 ptrtoint (ptr getelementptr (i8, ptr null, i32 1) to i64), %mul
  %malloc_call = call ptr @malloc(i64 %mul3)
  store ptr %malloc_call, ptr %a, align 8
  %i = alloca i64, align 8
  store i64 0, ptr %i, align 4
  br label %InputStart

InputStart:                                       ; preds = %InputLoop, %entry
  %i4 = load i64, ptr %i, align 4
  %n5 = load i64, ptr %n1, align 4
  %slt = icmp slt i64 %i4, %n5
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %InputStart
  br label %InputLoop

pending_false:                                    ; preds = %InputStart
  br label %InputEnd

InputLoop:                                        ; preds = %pending_true
  %a6 = load ptr, ptr %a, align 8
  %i7 = load i64, ptr %i, align 4
  %ptr_add = getelementptr i8, ptr %a6, i64 %i7
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_9, ptr %ptr_add)
  %i8 = load i64, ptr %i, align 4
  %add = add i64 %i8, 1
  store i64 %add, ptr %i, align 4
  br label %InputStart

InputEnd:                                         ; preds = %pending_false
  br label %Solve

Solve:                                            ; preds = %InputEnd
  %a9 = load ptr, ptr %a, align 8
  ret ptr %a9
}

define ptr @input_str() {
entry:
  %ret_val = alloca ptr, align 8
  %malloc_call = call ptr @malloc(i64 1000005)
  %a = alloca ptr, align 8
  store ptr %malloc_call, ptr %a, align 8
  %a1 = load ptr, ptr %a, align 8
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_10, ptr %a1)
  %a2 = load ptr, ptr %a, align 8
  ret ptr %a2
}

define ptr @input_Strings(i64 %n) {
entry:
  %n1 = alloca i64, align 8
  store i64 %n, ptr %n1, align 4
  %ret_val = alloca ptr, align 8
  %a = alloca ptr, align 8
  store ptr null, ptr %a, align 8
  %n2 = load i64, ptr %n1, align 4
  %mul = mul i64 ptrtoint (ptr getelementptr (%String, ptr null, i32 1) to i64), %n2
  %malloc_call = call ptr @malloc(i64 %mul)
  store ptr %malloc_call, ptr %a, align 8
  %i = alloca i64, align 8
  store i64 0, ptr %i, align 4
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %i3 = load i64, ptr %i, align 4
  %n4 = load i64, ptr %n1, align 4
  %slt = icmp slt i64 %i3, %n4
  br i1 %slt, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %calltmp = call ptr @input_str()
  %calltmp5 = call %String @String_from(ptr %calltmp)
  %a6 = load ptr, ptr %a, align 8
  %i7 = load i64, ptr %i, align 4
  %idx_ptr = getelementptr %String, ptr %a6, i64 %i7
  %"idx[]_load" = load %String, ptr %idx_ptr, align 8
  store %String %calltmp5, ptr %idx_ptr, align 8
  %i8 = load i64, ptr %i, align 4
  %add = add i64 %i8, 1
  store i64 %add, ptr %i, align 4
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %a9 = load ptr, ptr %a, align 8
  ret ptr %a9
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
  store i64 %x, ptr %x1, align 4
  %ret_val = alloca i64, align 8
  %x2 = load i64, ptr %x1, align 4
  %sge = icmp sge i64 %x2, 0
  %x3 = load i64, ptr %x1, align 4
  %x4 = load i64, ptr %x1, align 4
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
  %a1 = alloca ptr, align 8
  store ptr %a, ptr %a1, align 8
  %b2 = alloca ptr, align 8
  store ptr %b, ptr %b2, align 8
  %a3 = load ptr, ptr %a1, align 8
  %deref = load i64, ptr %a3, align 4
  %t = alloca i64, align 8
  store i64 %deref, ptr %t, align 4
  %b4 = load ptr, ptr %b2, align 8
  %deref5 = load i64, ptr %b4, align 4
  %a6 = load ptr, ptr %a1, align 8
  store i64 %deref5, ptr %a6, align 4
  %t7 = load i64, ptr %t, align 4
  %b8 = load ptr, ptr %b2, align 8
  store i64 %t7, ptr %b8, align 4
  ret void
}

define void @sort_swap_String(ptr %a, ptr %b) {
entry:
  %a1 = alloca ptr, align 8
  store ptr %a, ptr %a1, align 8
  %b2 = alloca ptr, align 8
  store ptr %b, ptr %b2, align 8
  %a3 = load ptr, ptr %a1, align 8
  %deref = load %String, ptr %a3, align 8
  %t = alloca %String, align 8
  store %String %deref, ptr %t, align 8
  %b4 = load ptr, ptr %b2, align 8
  %deref5 = load %String, ptr %b4, align 8
  %a6 = load ptr, ptr %a1, align 8
  store %String %deref5, ptr %a6, align 8
  %t7 = load %String, ptr %t, align 8
  %b8 = load ptr, ptr %b2, align 8
  store %String %t7, ptr %b8, align 8
  ret void
}

define i64 @qsort_i64_partition(ptr %arr, i64 %left, i64 %right) {
entry:
  %arr1 = alloca ptr, align 8
  store ptr %arr, ptr %arr1, align 8
  %left2 = alloca i64, align 8
  store i64 %left, ptr %left2, align 4
  %right3 = alloca i64, align 8
  store i64 %right, ptr %right3, align 4
  %ret_val = alloca i64, align 8
  %arr4 = load ptr, ptr %arr1, align 8
  %right5 = load i64, ptr %right3, align 4
  %idx_ptr = getelementptr i64, ptr %arr4, i64 %right5
  %"idx[]_load" = load i64, ptr %idx_ptr, align 4
  %pivot = alloca i64, align 8
  store i64 %"idx[]_load", ptr %pivot, align 4
  %left6 = load i64, ptr %left2, align 4
  %sub = sub i64 %left6, 1
  %i = alloca i64, align 8
  store i64 %sub, ptr %i, align 4
  %left7 = load i64, ptr %left2, align 4
  %j = alloca i64, align 8
  store i64 %left7, ptr %j, align 4
  br label %loopstart

loopstart:                                        ; preds = %NoSwap, %entry
  %j8 = load i64, ptr %j, align 4
  %right9 = load i64, ptr %right3, align 4
  %slt = icmp slt i64 %j8, %right9
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %loopstart
  br label %InLoop

pending_false:                                    ; preds = %loopstart
  br label %Break

InLoop:                                           ; preds = %pending_true
  %arr10 = load ptr, ptr %arr1, align 8
  %j11 = load i64, ptr %j, align 4
  %idx_ptr12 = getelementptr i64, ptr %arr10, i64 %j11
  %"idx[]_load13" = load i64, ptr %idx_ptr12, align 4
  %pivot14 = load i64, ptr %pivot, align 4
  %slt15 = icmp slt i64 %"idx[]_load13", %pivot14
  br i1 %slt15, label %pending_true16, label %pending_false17

pending_true16:                                   ; preds = %InLoop
  br label %Swap

pending_false17:                                  ; preds = %InLoop
  br label %NoSwap

Swap:                                             ; preds = %pending_true16
  %i18 = load i64, ptr %i, align 4
  %add = add i64 %i18, 1
  store i64 %add, ptr %i, align 4
  %arr19 = load ptr, ptr %arr1, align 8
  %i20 = load i64, ptr %i, align 4
  %ptr_add = getelementptr i64, ptr %arr19, i64 %i20
  %arr21 = load ptr, ptr %arr1, align 8
  %j22 = load i64, ptr %j, align 4
  %ptr_add23 = getelementptr i64, ptr %arr21, i64 %j22
  call void @sort_swap_i64(ptr %ptr_add, ptr %ptr_add23)
  br label %NoSwap

NoSwap:                                           ; preds = %Swap, %pending_false17
  %j24 = load i64, ptr %j, align 4
  %add25 = add i64 %j24, 1
  store i64 %add25, ptr %j, align 4
  br label %loopstart

Break:                                            ; preds = %pending_false
  %arr26 = load ptr, ptr %arr1, align 8
  %i27 = load i64, ptr %i, align 4
  %add28 = add i64 %i27, 1
  %ptr_add29 = getelementptr i64, ptr %arr26, i64 %add28
  %arr30 = load ptr, ptr %arr1, align 8
  %right31 = load i64, ptr %right3, align 4
  %ptr_add32 = getelementptr i64, ptr %arr30, i64 %right31
  call void @sort_swap_i64(ptr %ptr_add29, ptr %ptr_add32)
  %i33 = load i64, ptr %i, align 4
  %add34 = add i64 %i33, 1
  ret i64 %add34
}

define i64 @qsort_String_partition(ptr %arr, i64 %left, i64 %right) {
entry:
  %arr1 = alloca ptr, align 8
  store ptr %arr, ptr %arr1, align 8
  %left2 = alloca i64, align 8
  store i64 %left, ptr %left2, align 4
  %right3 = alloca i64, align 8
  store i64 %right, ptr %right3, align 4
  %ret_val = alloca i64, align 8
  %arr4 = load ptr, ptr %arr1, align 8
  %right5 = load i64, ptr %right3, align 4
  %idx_ptr = getelementptr %String, ptr %arr4, i64 %right5
  %"idx[]_load" = load %String, ptr %idx_ptr, align 8
  %pivot = alloca %String, align 8
  store %String %"idx[]_load", ptr %pivot, align 8
  %left6 = load i64, ptr %left2, align 4
  %sub = sub i64 %left6, 1
  %i = alloca i64, align 8
  store i64 %sub, ptr %i, align 4
  %left7 = load i64, ptr %left2, align 4
  %j = alloca i64, align 8
  store i64 %left7, ptr %j, align 4
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %NoSwap, %loop_start-loop
  %j8 = load i64, ptr %j, align 4
  %right9 = load i64, ptr %right3, align 4
  %slt = icmp slt i64 %j8, %right9
  br i1 %slt, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %arr10 = load ptr, ptr %arr1, align 8
  %j11 = load i64, ptr %j, align 4
  %idx_ptr12 = getelementptr %String, ptr %arr10, i64 %j11
  %"idx[]_load13" = load %String, ptr %idx_ptr12, align 8
  %pivot14 = load %String, ptr %pivot, align 8
  %calltmp = call i64 @String_cmp(%String %"idx[]_load13", %String %pivot14)
  %slt15 = icmp slt i64 %calltmp, 0
  br i1 %slt15, label %pending_true, label %pending_false

break-loop:                                       ; preds = %continue-loop
  %arr24 = load ptr, ptr %arr1, align 8
  %i25 = load i64, ptr %i, align 4
  %add26 = add i64 %i25, 1
  %ptr_add27 = getelementptr %String, ptr %arr24, i64 %add26
  %arr28 = load ptr, ptr %arr1, align 8
  %right29 = load i64, ptr %right3, align 4
  %ptr_add30 = getelementptr %String, ptr %arr28, i64 %right29
  call void @sort_swap_String(ptr %ptr_add27, ptr %ptr_add30)
  %i31 = load i64, ptr %i, align 4
  %add32 = add i64 %i31, 1
  ret i64 %add32

pending_true:                                     ; preds = %no_judge_continue-loop
  br label %Swap

pending_false:                                    ; preds = %no_judge_continue-loop
  br label %NoSwap

Swap:                                             ; preds = %pending_true
  %i16 = load i64, ptr %i, align 4
  %add = add i64 %i16, 1
  store i64 %add, ptr %i, align 4
  %arr17 = load ptr, ptr %arr1, align 8
  %i18 = load i64, ptr %i, align 4
  %ptr_add = getelementptr %String, ptr %arr17, i64 %i18
  %arr19 = load ptr, ptr %arr1, align 8
  %j20 = load i64, ptr %j, align 4
  %ptr_add21 = getelementptr %String, ptr %arr19, i64 %j20
  call void @sort_swap_String(ptr %ptr_add, ptr %ptr_add21)
  br label %NoSwap

NoSwap:                                           ; preds = %Swap, %pending_false
  %j22 = load i64, ptr %j, align 4
  %add23 = add i64 %j22, 1
  store i64 %add23, ptr %j, align 4
  br label %continue-loop
}

define void @qsort_i64(ptr %arr, i64 %left, i64 %right) {
entry:
  %arr1 = alloca ptr, align 8
  store ptr %arr, ptr %arr1, align 8
  %left2 = alloca i64, align 8
  store i64 %left, ptr %left2, align 4
  %right3 = alloca i64, align 8
  store i64 %right, ptr %right3, align 4
  %left4 = load i64, ptr %left2, align 4
  %right5 = load i64, ptr %right3, align 4
  %slt = icmp slt i64 %left4, %right5
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %entry
  br label %then

pending_false:                                    ; preds = %entry
  br label %End

then:                                             ; preds = %pending_true
  %arr6 = load ptr, ptr %arr1, align 8
  %left7 = load i64, ptr %left2, align 4
  %right8 = load i64, ptr %right3, align 4
  %calltmp = call i64 @qsort_i64_partition(ptr %arr6, i64 %left7, i64 %right8)
  %p = alloca i64, align 8
  store i64 %calltmp, ptr %p, align 4
  %arr9 = load ptr, ptr %arr1, align 8
  %left10 = load i64, ptr %left2, align 4
  %p11 = load i64, ptr %p, align 4
  %sub = sub i64 %p11, 1
  call void @qsort_i64(ptr %arr9, i64 %left10, i64 %sub)
  %arr12 = load ptr, ptr %arr1, align 8
  %p13 = load i64, ptr %p, align 4
  %add = add i64 %p13, 1
  %right14 = load i64, ptr %right3, align 4
  call void @qsort_i64(ptr %arr12, i64 %add, i64 %right14)
  br label %End

End:                                              ; preds = %then, %pending_false
  ret void
}

define void @qsort_String(ptr %arr, i64 %left, i64 %right) {
entry:
  %arr1 = alloca ptr, align 8
  store ptr %arr, ptr %arr1, align 8
  %left2 = alloca i64, align 8
  store i64 %left, ptr %left2, align 4
  %right3 = alloca i64, align 8
  store i64 %right, ptr %right3, align 4
  %left4 = load i64, ptr %left2, align 4
  %right5 = load i64, ptr %right3, align 4
  %slt = icmp slt i64 %left4, %right5
  br i1 %slt, label %pending_true, label %pending_false

pending_true:                                     ; preds = %entry
  br label %then

pending_false:                                    ; preds = %entry
  br label %End

then:                                             ; preds = %pending_true
  %arr6 = load ptr, ptr %arr1, align 8
  %left7 = load i64, ptr %left2, align 4
  %right8 = load i64, ptr %right3, align 4
  %calltmp = call i64 @qsort_String_partition(ptr %arr6, i64 %left7, i64 %right8)
  %p = alloca i64, align 8
  store i64 %calltmp, ptr %p, align 4
  %arr9 = load ptr, ptr %arr1, align 8
  %left10 = load i64, ptr %left2, align 4
  %p11 = load i64, ptr %p, align 4
  %sub = sub i64 %p11, 1
  call void @qsort_String(ptr %arr9, i64 %left10, i64 %sub)
  %arr12 = load ptr, ptr %arr1, align 8
  %p13 = load i64, ptr %p, align 4
  %add = add i64 %p13, 1
  %right14 = load i64, ptr %right3, align 4
  call void @qsort_String(ptr %arr12, i64 %add, i64 %right14)
  br label %End

End:                                              ; preds = %then, %pending_false
  ret void
}

define i64 @"++"(ptr %p) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %ret_val = alloca i64, align 8
  %p2 = load ptr, ptr %p1, align 8
  %deref = load i64, ptr %p2, align 4
  %add = add i64 %deref, 1
  %p3 = load ptr, ptr %p1, align 8
  store i64 %add, ptr %p3, align 4
  %p4 = load ptr, ptr %p1, align 8
  %deref5 = load i64, ptr %p4, align 4
  ret i64 %deref5
}

define i64 @--(ptr %p) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %ret_val = alloca i64, align 8
  %p2 = load ptr, ptr %p1, align 8
  %deref = load i64, ptr %p2, align 4
  %sub = sub i64 %deref, 1
  %p3 = load ptr, ptr %p1, align 8
  store i64 %sub, ptr %p3, align 4
  %p4 = load ptr, ptr %p1, align 8
  %deref5 = load i64, ptr %p4, align 4
  ret i64 %deref5
}

define i64 @"+="(ptr %p, i64 %a) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %a2 = alloca i64, align 8
  store i64 %a, ptr %a2, align 4
  %ret_val = alloca i64, align 8
  %p3 = load ptr, ptr %p1, align 8
  %deref = load i64, ptr %p3, align 4
  %a4 = load i64, ptr %a2, align 4
  %add = add i64 %deref, %a4
  %p5 = load ptr, ptr %p1, align 8
  store i64 %add, ptr %p5, align 4
  %p6 = load ptr, ptr %p1, align 8
  %deref7 = load i64, ptr %p6, align 4
  ret i64 %deref7
}

define i64 @"-="(ptr %p, i64 %a) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %a2 = alloca i64, align 8
  store i64 %a, ptr %a2, align 4
  %ret_val = alloca i64, align 8
  %p3 = load ptr, ptr %p1, align 8
  %deref = load i64, ptr %p3, align 4
  %a4 = load i64, ptr %a2, align 4
  %sub = sub i64 %deref, %a4
  %p5 = load ptr, ptr %p1, align 8
  store i64 %sub, ptr %p5, align 4
  %p6 = load ptr, ptr %p1, align 8
  %deref7 = load i64, ptr %p6, align 4
  ret i64 %deref7
}

define i64 @"*="(ptr %p, i64 %a) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %a2 = alloca i64, align 8
  store i64 %a, ptr %a2, align 4
  %ret_val = alloca i64, align 8
  %p3 = load ptr, ptr %p1, align 8
  %deref = load i64, ptr %p3, align 4
  %a4 = load i64, ptr %a2, align 4
  %mul = mul i64 %deref, %a4
  %p5 = load ptr, ptr %p1, align 8
  store i64 %mul, ptr %p5, align 4
  %p6 = load ptr, ptr %p1, align 8
  %deref7 = load i64, ptr %p6, align 4
  ret i64 %deref7
}

define i64 @"/="(ptr %p, i64 %a) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %a2 = alloca i64, align 8
  store i64 %a, ptr %a2, align 4
  %ret_val = alloca i64, align 8
  %p3 = load ptr, ptr %p1, align 8
  %deref = load i64, ptr %p3, align 4
  %a4 = load i64, ptr %a2, align 4
  %div = sdiv i64 %deref, %a4
  %p5 = load ptr, ptr %p1, align 8
  store i64 %div, ptr %p5, align 4
  %p6 = load ptr, ptr %p1, align 8
  %deref7 = load i64, ptr %p6, align 4
  ret i64 %deref7
}

define i64 @"%="(ptr %p, i64 %a) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %a2 = alloca i64, align 8
  store i64 %a, ptr %a2, align 4
  %ret_val = alloca i64, align 8
  %p3 = load ptr, ptr %p1, align 8
  %deref = load i64, ptr %p3, align 4
  %a4 = load i64, ptr %a2, align 4
  %rem = srem i64 %deref, %a4
  %p5 = load ptr, ptr %p1, align 8
  store i64 %rem, ptr %p5, align 4
  %p6 = load ptr, ptr %p1, align 8
  %deref7 = load i64, ptr %p6, align 4
  ret i64 %deref7
}

declare i32 @timespec_get(ptr, i32)

declare i32 @nanosleep(ptr, ptr)

define i32 @Time_get(ptr %ts) {
entry:
  %ts1 = alloca ptr, align 8
  store ptr %ts, ptr %ts1, align 8
  %ret_val = alloca i32, align 4
  %i = alloca i64, align 8
  store i64 1, ptr %i, align 4
  %ts2 = load ptr, ptr %ts1, align 8
  %deref = load i32, ptr %i, align 4
  %calltmp = call i32 @timespec_get(ptr %ts2, i32 %deref)
  ret i32 %calltmp
}

define i32 @Time_sleep(ptr %ts) {
entry:
  %ts1 = alloca ptr, align 8
  store ptr %ts, ptr %ts1, align 8
  %ret_val = alloca i32, align 4
  %null = alloca ptr, align 8
  store ptr null, ptr %null, align 8
  %ts2 = load ptr, ptr %ts1, align 8
  %null3 = load ptr, ptr %null, align 8
  %calltmp = call i32 @nanosleep(ptr %ts2, ptr %null3)
  ret i32 %calltmp
}

define %timespec @Time_new() {
entry:
  %ret_val = alloca %timespec, align 8
  %time = alloca %timespec, align 8
  store %timespec zeroinitializer, ptr %time, align 4
  %time1 = load %timespec, ptr %time, align 4
  %access = getelementptr inbounds nuw %timespec, ptr %time, i32 0, i32 0
  %getmembervalue = load i64, ptr %access, align 4
  store i64 0, ptr %access, align 4
  %time2 = load %timespec, ptr %time, align 4
  %access3 = getelementptr inbounds nuw %timespec, ptr %time, i32 0, i32 1
  %getmembervalue4 = load i64, ptr %access3, align 4
  store i64 0, ptr %access3, align 4
  %time5 = load %timespec, ptr %time, align 4
  ret %timespec %time5
}

define double @Time_delta(%timespec %start, %timespec %end) {
entry:
  %start1 = alloca %timespec, align 8
  store %timespec %start, ptr %start1, align 4
  %end2 = alloca %timespec, align 8
  store %timespec %end, ptr %end2, align 4
  %ret_val = alloca double, align 8
  %end3 = load %timespec, ptr %end2, align 4
  %access = getelementptr inbounds nuw %timespec, ptr %end2, i32 0, i32 0
  %getmembervalue = load i64, ptr %access, align 4
  %start4 = load %timespec, ptr %start1, align 4
  %access5 = getelementptr inbounds nuw %timespec, ptr %start1, i32 0, i32 0
  %getmembervalue6 = load i64, ptr %access5, align 4
  %sub = sub i64 %getmembervalue, %getmembervalue6
  %sec_diff = alloca i64, align 8
  store i64 %sub, ptr %sec_diff, align 4
  %end7 = load %timespec, ptr %end2, align 4
  %access8 = getelementptr inbounds nuw %timespec, ptr %end2, i32 0, i32 1
  %getmembervalue9 = load i64, ptr %access8, align 4
  %start10 = load %timespec, ptr %start1, align 4
  %access11 = getelementptr inbounds nuw %timespec, ptr %start1, i32 0, i32 1
  %getmembervalue12 = load i64, ptr %access11, align 4
  %sub13 = sub i64 %getmembervalue9, %getmembervalue12
  %nsec_diff = alloca i64, align 8
  store i64 %sub13, ptr %nsec_diff, align 4
  %sec_diff14 = load i64, ptr %sec_diff, align 4
  %i64_to_f64 = sitofp i64 %sec_diff14 to double
  %nsec_diff15 = load i64, ptr %nsec_diff, align 4
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
  store %timespec zeroinitializer, ptr %time, align 4
  %time1 = load %timespec, ptr %time, align 4
  %access = getelementptr inbounds nuw %timespec, ptr %time, i32 0, i32 0
  %getmembervalue = load i64, ptr %access, align 4
  store i64 0, ptr %access, align 4
  %time2 = load %timespec, ptr %time, align 4
  %access3 = getelementptr inbounds nuw %timespec, ptr %time, i32 0, i32 1
  %getmembervalue4 = load i64, ptr %access3, align 4
  store i64 0, ptr %access3, align 4
  %i = alloca i64, align 8
  store i64 1, ptr %i, align 4
  %deref = load i32, ptr %i, align 4
  %calltmp = call i32 @timespec_get(ptr %time, i32 %deref)
  %time5 = load %timespec, ptr %time, align 4
  ret %timespec %time5
}

define double @Time_as_f64(%timespec %ts) {
entry:
  %ts1 = alloca %timespec, align 8
  store %timespec %ts, ptr %ts1, align 4
  %ret_val = alloca double, align 8
  %ts2 = load %timespec, ptr %ts1, align 4
  %access = getelementptr inbounds nuw %timespec, ptr %ts1, i32 0, i32 0
  %getmembervalue = load i64, ptr %access, align 4
  %sec_diff = alloca i64, align 8
  store i64 %getmembervalue, ptr %sec_diff, align 4
  %ts3 = load %timespec, ptr %ts1, align 4
  %access4 = getelementptr inbounds nuw %timespec, ptr %ts1, i32 0, i32 1
  %getmembervalue5 = load i64, ptr %access4, align 4
  %nsec_diff = alloca i64, align 8
  store i64 %getmembervalue5, ptr %nsec_diff, align 4
  %sec_diff6 = load i64, ptr %sec_diff, align 4
  %i64_to_f64 = sitofp i64 %sec_diff6 to double
  %nsec_diff7 = load i64, ptr %nsec_diff, align 4
  %i64_to_f648 = sitofp i64 %nsec_diff7 to double
  %fmul = fmul double %i64_to_f648, 1.000000e-09
  %fadd = fadd double %i64_to_f64, %fmul
  %f_num = alloca double, align 8
  store double %fadd, ptr %f_num, align 8
  %f_num9 = load double, ptr %f_num, align 8
  ret double %f_num9
}

declare i32 @open(ptr, i32, i32)

declare i64 @read(i32, ptr, i64)

declare i32 @close(i32)

declare i64 @lseek(i32, i64, i32)

define %String @read_text_file(ptr %path) {
entry:
  %path1 = alloca ptr, align 8
  store ptr %path, ptr %path1, align 8
  %ret_val = alloca %String, align 8
  %O_RDONLY = alloca i32, align 4
  store i32 0, ptr %O_RDONLY, align 4
  %SEEK_SET = alloca i32, align 4
  store i32 0, ptr %SEEK_SET, align 4
  %SEEK_END = alloca i32, align 4
  store i32 2, ptr %SEEK_END, align 4
  %path2 = load ptr, ptr %path1, align 8
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
  %calltmp4 = call %String @String_new(i64 0)
  ret %String %calltmp4
  br label %break-f
  br label %continue-f

break-f:                                          ; preds = %no_judge_continue-f, %continue-f
  %fd5 = load i32, ptr %fd, align 4
  %calltmp6 = call i64 @lseek(i32 %fd5, i64 0, i32 2)
  %size = alloca i64, align 8
  store i64 %calltmp6, ptr %size, align 4
  br label %loop_start-size_error

loop_start-size_error:                            ; preds = %break-f
  br label %continue-size_error

continue-size_error:                              ; preds = %no_judge_continue-size_error, %loop_start-size_error
  %size7 = load i64, ptr %size, align 4
  %sgt = icmp sgt i64 %size7, 100000000
  br i1 %sgt, label %no_judge_continue-size_error, label %break-size_error

no_judge_continue-size_error:                     ; preds = %continue-size_error
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_12, ptr @str_11)
  %size8 = load i64, ptr %size, align 4
  %fmt_buf = alloca [128 x i8], align 1
  %sprintf = call i32 (ptr, ptr, ...) @sprintf(ptr %fmt_buf, ptr @str_13, i64 %size8)
  %printf9 = call i32 (ptr, ...) @printf(ptr @println_fmt_14, ptr %fmt_buf)
  br label %break-size_error
  br label %continue-size_error

break-size_error:                                 ; preds = %no_judge_continue-size_error, %continue-size_error
  %fd10 = load i32, ptr %fd, align 4
  %calltmp11 = call i64 @lseek(i32 %fd10, i64 0, i32 0)
  br label %loop_start-s

loop_start-s:                                     ; preds = %break-size_error
  br label %continue-s

continue-s:                                       ; preds = %no_judge_continue-s, %loop_start-s
  %size12 = load i64, ptr %size, align 4
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
  %size16 = load i64, ptr %size, align 4
  %add = add i64 %size16, 1
  %malloc_call = call ptr @malloc(i64 %add)
  %buf = alloca ptr, align 8
  store ptr %malloc_call, ptr %buf, align 8
  %total = alloca i64, align 8
  store i64 0, ptr %total, align 4
  br label %loop_start-r

loop_start-r:                                     ; preds = %break-s
  br label %continue-r

continue-r:                                       ; preds = %break-e, %loop_start-r
  %total17 = load i64, ptr %total, align 4
  %size18 = load i64, ptr %size, align 4
  %slt19 = icmp slt i64 %total17, %size18
  br i1 %slt19, label %no_judge_continue-r, label %break-r

no_judge_continue-r:                              ; preds = %continue-r
  %fd20 = load i32, ptr %fd, align 4
  %buf21 = load ptr, ptr %buf, align 8
  %total22 = load i64, ptr %total, align 4
  %ptr_add = getelementptr i8, ptr %buf21, i64 %total22
  %size23 = load i64, ptr %size, align 4
  %total24 = load i64, ptr %total, align 4
  %sub = sub i64 %size23, %total24
  %calltmp25 = call i64 @read(i32 %fd20, ptr %ptr_add, i64 %sub)
  %n = alloca i64, align 8
  store i64 %calltmp25, ptr %n, align 4
  br label %loop_start-e

break-r:                                          ; preds = %no_judge_continue-e, %continue-r
  %buf31 = load ptr, ptr %buf, align 8
  %total32 = load i64, ptr %total, align 4
  %idx_ptr = getelementptr i8, ptr %buf31, i64 %total32
  %"idx[]_load" = load i8, ptr %idx_ptr, align 1
  store i8 0, ptr %idx_ptr, align 1
  %fd33 = load i32, ptr %fd, align 4
  %calltmp34 = call i32 @close(i32 %fd33)
  %buf35 = load ptr, ptr %buf, align 8
  %calltmp36 = call %String @String_from(ptr %buf35)
  %ret = alloca %String, align 8
  store %String %calltmp36, ptr %ret, align 8
  %buf37 = load ptr, ptr %buf, align 8
  call void @free(ptr %buf37)
  %ret38 = load %String, ptr %ret, align 8
  ret %String %ret38

loop_start-e:                                     ; preds = %no_judge_continue-r
  br label %continue-e

continue-e:                                       ; preds = %no_judge_continue-e, %loop_start-e
  %n26 = load i64, ptr %n, align 4
  %sle27 = icmp sle i64 %n26, 0
  br i1 %sle27, label %no_judge_continue-e, label %break-e

no_judge_continue-e:                              ; preds = %continue-e
  br label %break-r
  br label %break-e
  br label %continue-e

break-e:                                          ; preds = %no_judge_continue-e, %continue-e
  %total28 = load i64, ptr %total, align 4
  %n29 = load i64, ptr %n, align 4
  %add30 = add i64 %total28, %n29
  store i64 %add30, ptr %total, align 4
  br label %continue-r
}

declare void @exit(i32)

define %KeyMap @KeyMap_new(i64 %val_size, i64 %capa) {
entry:
  %val_size1 = alloca i64, align 8
  store i64 %val_size, ptr %val_size1, align 4
  %capa2 = alloca i64, align 8
  store i64 %capa, ptr %capa2, align 4
  %ret_val = alloca %KeyMap, align 8
  %keymap = alloca %KeyMap, align 8
  store %KeyMap zeroinitializer, ptr %keymap, align 8
  %keymap3 = load %KeyMap, ptr %keymap, align 8
  %access = getelementptr inbounds nuw %KeyMap, ptr %keymap, i32 0, i32 1
  %getmembervalue = load i64, ptr %access, align 4
  store i64 0, ptr %access, align 4
  %capa4 = load i64, ptr %capa2, align 4
  %keymap5 = load %KeyMap, ptr %keymap, align 8
  %access6 = getelementptr inbounds nuw %KeyMap, ptr %keymap, i32 0, i32 2
  %getmembervalue7 = load i64, ptr %access6, align 4
  store i64 %capa4, ptr %access6, align 4
  %val_size8 = load i64, ptr %val_size1, align 4
  %keymap9 = load %KeyMap, ptr %keymap, align 8
  %access10 = getelementptr inbounds nuw %KeyMap, ptr %keymap, i32 0, i32 3
  %getmembervalue11 = load i64, ptr %access10, align 4
  store i64 %val_size8, ptr %access10, align 4
  %sz = alloca i64, align 8
  store i64 ptrtoint (ptr getelementptr (%Entry, ptr null, i32 1) to i64), ptr %sz, align 4
  %sz12 = load i64, ptr %sz, align 4
  %capa13 = load i64, ptr %capa2, align 4
  %mul = mul i64 %sz12, %capa13
  %malloc_call = call ptr @malloc(i64 %mul)
  %entries = alloca ptr, align 8
  store ptr %malloc_call, ptr %entries, align 8
  %entries14 = load ptr, ptr %entries, align 8
  %keymap15 = load %KeyMap, ptr %keymap, align 8
  %access16 = getelementptr inbounds nuw %KeyMap, ptr %keymap, i32 0, i32 0
  %getmembervalue17 = load ptr, ptr %access16, align 8
  store ptr %entries14, ptr %access16, align 8
  %keymap18 = load %KeyMap, ptr %keymap, align 8
  ret %KeyMap %keymap18
}

define ptr @KeyMap_get(ptr %m, %String %key) {
entry:
  %m1 = alloca ptr, align 8
  store ptr %m, ptr %m1, align 8
  %key2 = alloca %String, align 8
  store %String %key, ptr %key2, align 8
  %ret_val = alloca ptr, align 8
  %left = alloca i64, align 8
  store i64 0, ptr %left, align 4
  %m3 = load ptr, ptr %m1, align 8
  %access = getelementptr inbounds nuw %KeyMap, ptr %m3, i32 0, i32 1
  %getmembervalue = load i64, ptr %access, align 4
  %sub = sub i64 %getmembervalue, 1
  %right = alloca i64, align 8
  store i64 %sub, ptr %right, align 4
  %left4 = load i64, ptr %left, align 4
  %right5 = load i64, ptr %right, align 4
  %add = add i64 %left4, %right5
  %div = sdiv i64 %add, 2
  %mid = alloca i64, align 8
  store i64 %div, ptr %mid, align 4
  %calltmp = call ptr @null()
  %ret = alloca ptr, align 8
  store ptr %calltmp, ptr %ret, align 8
  br label %loop_start-search

loop_start-search:                                ; preds = %entry
  br label %continue-search

continue-search:                                  ; preds = %break-L, %no_judge_continue-L, %no_judge_continue-R, %loop_start-search
  %left6 = load i64, ptr %left, align 4
  %right7 = load i64, ptr %right, align 4
  %sle = icmp sle i64 %left6, %right7
  br i1 %sle, label %no_judge_continue-search, label %break-search

no_judge_continue-search:                         ; preds = %continue-search
  %left8 = load i64, ptr %left, align 4
  %right9 = load i64, ptr %right, align 4
  %add10 = add i64 %left8, %right9
  %div11 = sdiv i64 %add10, 2
  store i64 %div11, ptr %mid, align 4
  %key12 = load %String, ptr %key2, align 8
  %m13 = load ptr, ptr %m1, align 8
  %access14 = getelementptr inbounds nuw %KeyMap, ptr %m13, i32 0, i32 0
  %getmembervalue15 = load ptr, ptr %access14, align 8
  %mid16 = load i64, ptr %mid, align 4
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue15, i64 %mid16
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 8
  %access17 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 0
  %getmembervalue18 = load %String, ptr %access17, align 8
  %calltmp19 = call i64 @String_cmp(%String %key12, %String %getmembervalue18)
  %cmp = alloca i64, align 8
  store i64 %calltmp19, ptr %cmp, align 4
  br label %loop_start-ret

break-search:                                     ; preds = %no_judge_continue-ret, %continue-search
  %ret35 = load ptr, ptr %ret, align 8
  ret ptr %ret35

loop_start-ret:                                   ; preds = %no_judge_continue-search
  br label %continue-ret

continue-ret:                                     ; preds = %no_judge_continue-ret, %loop_start-ret
  %cmp20 = load i64, ptr %cmp, align 4
  %eq = icmp eq i64 %cmp20, 0
  br i1 %eq, label %no_judge_continue-ret, label %break-ret

no_judge_continue-ret:                            ; preds = %continue-ret
  %m21 = load ptr, ptr %m1, align 8
  %access22 = getelementptr inbounds nuw %KeyMap, ptr %m21, i32 0, i32 0
  %getmembervalue23 = load ptr, ptr %access22, align 8
  %mid24 = load i64, ptr %mid, align 4
  %idx_ptr25 = getelementptr %Entry, ptr %getmembervalue23, i64 %mid24
  %"idx[]_load26" = load %Entry, ptr %idx_ptr25, align 8
  %access27 = getelementptr inbounds nuw %Entry, ptr %idx_ptr25, i32 0, i32 1
  %getmembervalue28 = load ptr, ptr %access27, align 8
  store ptr %getmembervalue28, ptr %ret, align 8
  br label %break-search
  br label %continue-ret

break-ret:                                        ; preds = %continue-ret
  br label %loop_start-R

loop_start-R:                                     ; preds = %break-ret
  br label %continue-R

continue-R:                                       ; preds = %no_judge_continue-R, %loop_start-R
  %cmp29 = load i64, ptr %cmp, align 4
  %slt = icmp slt i64 %cmp29, 0
  br i1 %slt, label %no_judge_continue-R, label %break-R

no_judge_continue-R:                              ; preds = %continue-R
  %mid30 = load i64, ptr %mid, align 4
  %sub31 = sub i64 %mid30, 1
  store i64 %sub31, ptr %right, align 4
  br label %continue-search
  br label %continue-R

break-R:                                          ; preds = %continue-R
  br label %loop_start-L

loop_start-L:                                     ; preds = %break-R
  br label %continue-L

continue-L:                                       ; preds = %no_judge_continue-L, %loop_start-L
  %cmp32 = load i64, ptr %cmp, align 4
  %sgt = icmp sgt i64 %cmp32, 0
  br i1 %sgt, label %no_judge_continue-L, label %break-L

no_judge_continue-L:                              ; preds = %continue-L
  %mid33 = load i64, ptr %mid, align 4
  %add34 = add i64 %mid33, 1
  store i64 %add34, ptr %left, align 4
  br label %continue-search
  br label %continue-L

break-L:                                          ; preds = %continue-L
  br label %continue-search
}

define i64 @KeyMap_get_index(ptr %m, %String %key) {
entry:
  %m1 = alloca ptr, align 8
  store ptr %m, ptr %m1, align 8
  %key2 = alloca %String, align 8
  store %String %key, ptr %key2, align 8
  %ret_val = alloca i64, align 8
  %left = alloca i64, align 8
  store i64 0, ptr %left, align 4
  %m3 = load ptr, ptr %m1, align 8
  %access = getelementptr inbounds nuw %KeyMap, ptr %m3, i32 0, i32 1
  %getmembervalue = load i64, ptr %access, align 4
  %sub = sub i64 %getmembervalue, 1
  %right = alloca i64, align 8
  store i64 %sub, ptr %right, align 4
  %left4 = load i64, ptr %left, align 4
  %right5 = load i64, ptr %right, align 4
  %add = add i64 %left4, %right5
  %div = sdiv i64 %add, 2
  %mid = alloca i64, align 8
  store i64 %div, ptr %mid, align 4
  %ret = alloca i64, align 8
  store i64 -1, ptr %ret, align 4
  br label %loop_start-search

loop_start-search:                                ; preds = %entry
  br label %continue-search

continue-search:                                  ; preds = %break-L, %no_judge_continue-L, %no_judge_continue-R, %loop_start-search
  %left6 = load i64, ptr %left, align 4
  %right7 = load i64, ptr %right, align 4
  %sle = icmp sle i64 %left6, %right7
  br i1 %sle, label %no_judge_continue-search, label %break-search

no_judge_continue-search:                         ; preds = %continue-search
  %left8 = load i64, ptr %left, align 4
  %right9 = load i64, ptr %right, align 4
  %add10 = add i64 %left8, %right9
  %div11 = sdiv i64 %add10, 2
  store i64 %div11, ptr %mid, align 4
  %key12 = load %String, ptr %key2, align 8
  %m13 = load ptr, ptr %m1, align 8
  %access14 = getelementptr inbounds nuw %KeyMap, ptr %m13, i32 0, i32 0
  %getmembervalue15 = load ptr, ptr %access14, align 8
  %mid16 = load i64, ptr %mid, align 4
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue15, i64 %mid16
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 8
  %access17 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 0
  %getmembervalue18 = load %String, ptr %access17, align 8
  %calltmp = call i64 @String_cmp(%String %key12, %String %getmembervalue18)
  %cmp = alloca i64, align 8
  store i64 %calltmp, ptr %cmp, align 4
  br label %loop_start-ret

break-search:                                     ; preds = %no_judge_continue-ret, %continue-search
  %ret27 = load i64, ptr %ret, align 4
  ret i64 %ret27

loop_start-ret:                                   ; preds = %no_judge_continue-search
  br label %continue-ret

continue-ret:                                     ; preds = %no_judge_continue-ret, %loop_start-ret
  %cmp19 = load i64, ptr %cmp, align 4
  %eq = icmp eq i64 %cmp19, 0
  br i1 %eq, label %no_judge_continue-ret, label %break-ret

no_judge_continue-ret:                            ; preds = %continue-ret
  %mid20 = load i64, ptr %mid, align 4
  store i64 %mid20, ptr %ret, align 4
  br label %break-search
  br label %continue-ret

break-ret:                                        ; preds = %continue-ret
  br label %loop_start-R

loop_start-R:                                     ; preds = %break-ret
  br label %continue-R

continue-R:                                       ; preds = %no_judge_continue-R, %loop_start-R
  %cmp21 = load i64, ptr %cmp, align 4
  %slt = icmp slt i64 %cmp21, 0
  br i1 %slt, label %no_judge_continue-R, label %break-R

no_judge_continue-R:                              ; preds = %continue-R
  %mid22 = load i64, ptr %mid, align 4
  %sub23 = sub i64 %mid22, 1
  store i64 %sub23, ptr %right, align 4
  br label %continue-search
  br label %continue-R

break-R:                                          ; preds = %continue-R
  br label %loop_start-L

loop_start-L:                                     ; preds = %break-R
  br label %continue-L

continue-L:                                       ; preds = %no_judge_continue-L, %loop_start-L
  %cmp24 = load i64, ptr %cmp, align 4
  %sgt = icmp sgt i64 %cmp24, 0
  br i1 %sgt, label %no_judge_continue-L, label %break-L

no_judge_continue-L:                              ; preds = %continue-L
  %mid25 = load i64, ptr %mid, align 4
  %add26 = add i64 %mid25, 1
  store i64 %add26, ptr %left, align 4
  br label %continue-search
  br label %continue-L

break-L:                                          ; preds = %continue-L
  br label %continue-search
}

define void @KeyMap_insert(ptr %m, %String %key, ptr %value) {
entry:
  %m1 = alloca ptr, align 8
  store ptr %m, ptr %m1, align 8
  %key2 = alloca %String, align 8
  store %String %key, ptr %key2, align 8
  %value3 = alloca ptr, align 8
  store ptr %value, ptr %value3, align 8
  %m4 = load ptr, ptr %m1, align 8
  %access = getelementptr inbounds nuw %KeyMap, ptr %m4, i32 0, i32 1
  %getmembervalue = load i64, ptr %access, align 4
  %add = add i64 %getmembervalue, 1
  %newsize = alloca i64, align 8
  store i64 %add, ptr %newsize, align 4
  %sz = alloca i64, align 8
  store i64 ptrtoint (ptr getelementptr (%Entry, ptr null, i32 1) to i64), ptr %sz, align 4
  br label %loop_start-check_capa

loop_start-check_capa:                            ; preds = %entry
  br label %continue-check_capa

continue-check_capa:                              ; preds = %break-loop, %loop_start-check_capa
  %newsize5 = load i64, ptr %newsize, align 4
  %m6 = load ptr, ptr %m1, align 8
  %access7 = getelementptr inbounds nuw %KeyMap, ptr %m6, i32 0, i32 2
  %getmembervalue8 = load i64, ptr %access7, align 4
  %sge = icmp sge i64 %newsize5, %getmembervalue8
  br i1 %sge, label %no_judge_continue-check_capa, label %break-check_capa

no_judge_continue-check_capa:                     ; preds = %continue-check_capa
  %newsize9 = load i64, ptr %newsize, align 4
  %mul = mul i64 %newsize9, 2
  %newcap = alloca i64, align 8
  store i64 %mul, ptr %newcap, align 4
  %m10 = load ptr, ptr %m1, align 8
  %access11 = getelementptr inbounds nuw %KeyMap, ptr %m10, i32 0, i32 0
  %getmembervalue12 = load ptr, ptr %access11, align 8
  %newcap13 = load i64, ptr %newcap, align 4
  %sz14 = load i64, ptr %sz, align 4
  %mul15 = mul i64 %newcap13, %sz14
  %realloc_call = call ptr @realloc(ptr %getmembervalue12, i64 %mul15)
  %m16 = load ptr, ptr %m1, align 8
  %access17 = getelementptr inbounds nuw %KeyMap, ptr %m16, i32 0, i32 0
  %getmembervalue18 = load ptr, ptr %access17, align 8
  store ptr %realloc_call, ptr %access17, align 8
  br label %loop_start-loop

break-check_capa:                                 ; preds = %break-loop, %continue-check_capa
  %m26 = load ptr, ptr %m1, align 8
  %access27 = getelementptr inbounds nuw %KeyMap, ptr %m26, i32 0, i32 1
  %getmembervalue28 = load i64, ptr %access27, align 4
  %i = alloca i64, align 8
  store i64 %getmembervalue28, ptr %i, align 4
  br label %loop_start-loop29

loop_start-loop:                                  ; preds = %no_judge_continue-check_capa
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %m19 = load ptr, ptr %m1, align 8
  %access20 = getelementptr inbounds nuw %KeyMap, ptr %m19, i32 0, i32 0
  %getmembervalue21 = load ptr, ptr %access20, align 8
  %calltmp = call ptr @null()
  %ptr_a_i = ptrtoint ptr %getmembervalue21 to i64
  %ptr_b_i = ptrtoint ptr %calltmp to i64
  %eq = icmp eq i64 %ptr_a_i, %ptr_b_i
  br i1 %eq, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_16, ptr @str_15)
  call void @exit(i32 0)
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %newcap22 = load i64, ptr %newcap, align 4
  %m23 = load ptr, ptr %m1, align 8
  %access24 = getelementptr inbounds nuw %KeyMap, ptr %m23, i32 0, i32 2
  %getmembervalue25 = load i64, ptr %access24, align 4
  store i64 %newcap22, ptr %access24, align 4
  br label %break-check_capa
  br label %continue-check_capa

loop_start-loop29:                                ; preds = %break-check_capa
  br label %continue-loop30

continue-loop30:                                  ; preds = %no_judge_continue-loop31, %loop_start-loop29
  %i33 = load i64, ptr %i, align 4
  %sgt = icmp sgt i64 %i33, 0
  br i1 %sgt, label %and.rhs, label %and.false

no_judge_continue-loop31:                         ; preds = %and.merge
  %m42 = load ptr, ptr %m1, align 8
  %access43 = getelementptr inbounds nuw %KeyMap, ptr %m42, i32 0, i32 0
  %getmembervalue44 = load ptr, ptr %access43, align 8
  %i45 = load i64, ptr %i, align 4
  %sub46 = sub i64 %i45, 1
  %idx_ptr47 = getelementptr %Entry, ptr %getmembervalue44, i64 %sub46
  %"idx[]_load48" = load %Entry, ptr %idx_ptr47, align 8
  %m49 = load ptr, ptr %m1, align 8
  %access50 = getelementptr inbounds nuw %KeyMap, ptr %m49, i32 0, i32 0
  %getmembervalue51 = load ptr, ptr %access50, align 8
  %i52 = load i64, ptr %i, align 4
  %idx_ptr53 = getelementptr %Entry, ptr %getmembervalue51, i64 %i52
  %"idx[]_load54" = load %Entry, ptr %idx_ptr53, align 8
  store %Entry %"idx[]_load48", ptr %idx_ptr53, align 8
  %i55 = load i64, ptr %i, align 4
  %sub56 = sub i64 %i55, 1
  store i64 %sub56, ptr %i, align 4
  br label %continue-loop30

break-loop32:                                     ; preds = %and.merge
  %key57 = load %String, ptr %key2, align 8
  %calltmp58 = call %String @String_clone(%String %key57)
  %m59 = load ptr, ptr %m1, align 8
  %access60 = getelementptr inbounds nuw %KeyMap, ptr %m59, i32 0, i32 0
  %getmembervalue61 = load ptr, ptr %access60, align 8
  %i62 = load i64, ptr %i, align 4
  %idx_ptr63 = getelementptr %Entry, ptr %getmembervalue61, i64 %i62
  %"idx[]_load64" = load %Entry, ptr %idx_ptr63, align 8
  %access65 = getelementptr inbounds nuw %Entry, ptr %idx_ptr63, i32 0, i32 0
  %getmembervalue66 = load %String, ptr %access65, align 8
  store %String %calltmp58, ptr %access65, align 8
  %m67 = load ptr, ptr %m1, align 8
  %access68 = getelementptr inbounds nuw %KeyMap, ptr %m67, i32 0, i32 3
  %getmembervalue69 = load i64, ptr %access68, align 4
  %malloc_call = call ptr @malloc(i64 %getmembervalue69)
  %valptr = alloca ptr, align 8
  store ptr %malloc_call, ptr %valptr, align 8
  %valptr70 = load ptr, ptr %valptr, align 8
  %value71 = load ptr, ptr %value3, align 8
  %m72 = load ptr, ptr %m1, align 8
  %access73 = getelementptr inbounds nuw %KeyMap, ptr %m72, i32 0, i32 3
  %getmembervalue74 = load i64, ptr %access73, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %valptr70, ptr align 1 %value71, i64 %getmembervalue74, i1 false)
  %valptr75 = load ptr, ptr %valptr, align 8
  %m76 = load ptr, ptr %m1, align 8
  %access77 = getelementptr inbounds nuw %KeyMap, ptr %m76, i32 0, i32 0
  %getmembervalue78 = load ptr, ptr %access77, align 8
  %i79 = load i64, ptr %i, align 4
  %idx_ptr80 = getelementptr %Entry, ptr %getmembervalue78, i64 %i79
  %"idx[]_load81" = load %Entry, ptr %idx_ptr80, align 8
  %access82 = getelementptr inbounds nuw %Entry, ptr %idx_ptr80, i32 0, i32 1
  %getmembervalue83 = load ptr, ptr %access82, align 8
  store ptr %valptr75, ptr %access82, align 8
  %m84 = load ptr, ptr %m1, align 8
  %access85 = getelementptr inbounds nuw %KeyMap, ptr %m84, i32 0, i32 1
  %getmembervalue86 = load i64, ptr %access85, align 4
  %add87 = add i64 %getmembervalue86, 1
  %m88 = load ptr, ptr %m1, align 8
  %access89 = getelementptr inbounds nuw %KeyMap, ptr %m88, i32 0, i32 1
  %getmembervalue90 = load i64, ptr %access89, align 4
  store i64 %add87, ptr %access89, align 4
  ret void

and.rhs:                                          ; preds = %continue-loop30
  %key34 = load %String, ptr %key2, align 8
  %m35 = load ptr, ptr %m1, align 8
  %access36 = getelementptr inbounds nuw %KeyMap, ptr %m35, i32 0, i32 0
  %getmembervalue37 = load ptr, ptr %access36, align 8
  %i38 = load i64, ptr %i, align 4
  %sub = sub i64 %i38, 1
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue37, i64 %sub
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 8
  %access39 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 0
  %getmembervalue40 = load %String, ptr %access39, align 8
  %calltmp41 = call i64 @String_cmp(%String %key34, %String %getmembervalue40)
  %slt = icmp slt i64 %calltmp41, 0
  br label %and.merge

and.false:                                        ; preds = %continue-loop30
  br label %and.merge

and.merge:                                        ; preds = %and.false, %and.rhs
  %and.result = phi i1 [ %slt, %and.rhs ], [ false, %and.false ]
  br i1 %and.result, label %no_judge_continue-loop31, label %break-loop32
}

define i32 @KeyMap_assign(ptr %m, i64 %index, ptr %value) {
entry:
  %m1 = alloca ptr, align 8
  store ptr %m, ptr %m1, align 8
  %index2 = alloca i64, align 8
  store i64 %index, ptr %index2, align 4
  %value3 = alloca ptr, align 8
  store ptr %value, ptr %value3, align 8
  %ret_val = alloca i32, align 4
  %m4 = load ptr, ptr %m1, align 8
  %access = getelementptr inbounds nuw %KeyMap, ptr %m4, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 8
  %index5 = load i64, ptr %index2, align 4
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue, i64 %index5
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 8
  %access6 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 1
  %getmembervalue7 = load ptr, ptr %access6, align 8
  %value8 = load ptr, ptr %value3, align 8
  %m9 = load ptr, ptr %m1, align 8
  %access10 = getelementptr inbounds nuw %KeyMap, ptr %m9, i32 0, i32 3
  %getmembervalue11 = load i64, ptr %access10, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %getmembervalue7, ptr align 1 %value8, i64 %getmembervalue11, i1 false)
  ret i32 1
}

define i32 @KeyMap_insert_or_assign(ptr %m, %String %key, ptr %value) {
entry:
  %m1 = alloca ptr, align 8
  store ptr %m, ptr %m1, align 8
  %key2 = alloca %String, align 8
  store %String %key, ptr %key2, align 8
  %value3 = alloca ptr, align 8
  store ptr %value, ptr %value3, align 8
  %ret_val = alloca i32, align 4
  %m4 = load ptr, ptr %m1, align 8
  %key5 = load %String, ptr %key2, align 8
  %calltmp = call i64 @KeyMap_get_index(ptr %m4, %String %key5)
  %index = alloca i64, align 8
  store i64 %calltmp, ptr %index, align 4
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %index6 = load i64, ptr %index, align 4
  %sge = icmp sge i64 %index6, 0
  br i1 %sge, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %m7 = load ptr, ptr %m1, align 8
  %index8 = load i64, ptr %index, align 4
  %value9 = load ptr, ptr %value3, align 8
  %calltmp10 = call i32 @KeyMap_assign(ptr %m7, i64 %index8, ptr %value9)
  ret i32 0
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %m11 = load ptr, ptr %m1, align 8
  %access = getelementptr inbounds nuw %KeyMap, ptr %m11, i32 0, i32 1
  %getmembervalue = load i64, ptr %access, align 4
  %add = add i64 %getmembervalue, 1
  %newsize = alloca i64, align 8
  store i64 %add, ptr %newsize, align 4
  %sz = alloca i64, align 8
  store i64 ptrtoint (ptr getelementptr (%Entry, ptr null, i32 1) to i64), ptr %sz, align 4
  br label %loop_start-check_capa

loop_start-check_capa:                            ; preds = %break-loop
  br label %continue-check_capa

continue-check_capa:                              ; preds = %break-loop30, %loop_start-check_capa
  %newsize12 = load i64, ptr %newsize, align 4
  %m13 = load ptr, ptr %m1, align 8
  %access14 = getelementptr inbounds nuw %KeyMap, ptr %m13, i32 0, i32 2
  %getmembervalue15 = load i64, ptr %access14, align 4
  %sge16 = icmp sge i64 %newsize12, %getmembervalue15
  br i1 %sge16, label %no_judge_continue-check_capa, label %break-check_capa

no_judge_continue-check_capa:                     ; preds = %continue-check_capa
  %newsize17 = load i64, ptr %newsize, align 4
  %mul = mul i64 %newsize17, 2
  %newcap = alloca i64, align 8
  store i64 %mul, ptr %newcap, align 4
  %m18 = load ptr, ptr %m1, align 8
  %access19 = getelementptr inbounds nuw %KeyMap, ptr %m18, i32 0, i32 0
  %getmembervalue20 = load ptr, ptr %access19, align 8
  %newcap21 = load i64, ptr %newcap, align 4
  %sz22 = load i64, ptr %sz, align 4
  %mul23 = mul i64 %newcap21, %sz22
  %realloc_call = call ptr @realloc(ptr %getmembervalue20, i64 %mul23)
  %m24 = load ptr, ptr %m1, align 8
  %access25 = getelementptr inbounds nuw %KeyMap, ptr %m24, i32 0, i32 0
  %getmembervalue26 = load ptr, ptr %access25, align 8
  store ptr %realloc_call, ptr %access25, align 8
  br label %loop_start-loop27

break-check_capa:                                 ; preds = %break-loop30, %continue-check_capa
  %m39 = load ptr, ptr %m1, align 8
  %access40 = getelementptr inbounds nuw %KeyMap, ptr %m39, i32 0, i32 1
  %getmembervalue41 = load i64, ptr %access40, align 4
  %i = alloca i64, align 8
  store i64 %getmembervalue41, ptr %i, align 4
  br label %loop_start-loop42

loop_start-loop27:                                ; preds = %no_judge_continue-check_capa
  br label %continue-loop28

continue-loop28:                                  ; preds = %no_judge_continue-loop29, %loop_start-loop27
  %m31 = load ptr, ptr %m1, align 8
  %access32 = getelementptr inbounds nuw %KeyMap, ptr %m31, i32 0, i32 0
  %getmembervalue33 = load ptr, ptr %access32, align 8
  %calltmp34 = call ptr @null()
  %ptr_a_i = ptrtoint ptr %getmembervalue33 to i64
  %ptr_b_i = ptrtoint ptr %calltmp34 to i64
  %eq = icmp eq i64 %ptr_a_i, %ptr_b_i
  br i1 %eq, label %no_judge_continue-loop29, label %break-loop30

no_judge_continue-loop29:                         ; preds = %continue-loop28
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_18, ptr @str_17)
  call void @exit(i32 0)
  br label %continue-loop28

break-loop30:                                     ; preds = %continue-loop28
  %newcap35 = load i64, ptr %newcap, align 4
  %m36 = load ptr, ptr %m1, align 8
  %access37 = getelementptr inbounds nuw %KeyMap, ptr %m36, i32 0, i32 2
  %getmembervalue38 = load i64, ptr %access37, align 4
  store i64 %newcap35, ptr %access37, align 4
  br label %break-check_capa
  br label %continue-check_capa

loop_start-loop42:                                ; preds = %break-check_capa
  br label %continue-loop43

continue-loop43:                                  ; preds = %no_judge_continue-loop44, %loop_start-loop42
  %i46 = load i64, ptr %i, align 4
  %sgt = icmp sgt i64 %i46, 0
  br i1 %sgt, label %and.rhs, label %and.false

no_judge_continue-loop44:                         ; preds = %and.merge
  %m55 = load ptr, ptr %m1, align 8
  %access56 = getelementptr inbounds nuw %KeyMap, ptr %m55, i32 0, i32 0
  %getmembervalue57 = load ptr, ptr %access56, align 8
  %i58 = load i64, ptr %i, align 4
  %sub59 = sub i64 %i58, 1
  %idx_ptr60 = getelementptr %Entry, ptr %getmembervalue57, i64 %sub59
  %"idx[]_load61" = load %Entry, ptr %idx_ptr60, align 8
  %m62 = load ptr, ptr %m1, align 8
  %access63 = getelementptr inbounds nuw %KeyMap, ptr %m62, i32 0, i32 0
  %getmembervalue64 = load ptr, ptr %access63, align 8
  %i65 = load i64, ptr %i, align 4
  %idx_ptr66 = getelementptr %Entry, ptr %getmembervalue64, i64 %i65
  %"idx[]_load67" = load %Entry, ptr %idx_ptr66, align 8
  store %Entry %"idx[]_load61", ptr %idx_ptr66, align 8
  %i68 = load i64, ptr %i, align 4
  %sub69 = sub i64 %i68, 1
  store i64 %sub69, ptr %i, align 4
  br label %continue-loop43

break-loop45:                                     ; preds = %and.merge
  %key70 = load %String, ptr %key2, align 8
  %calltmp71 = call %String @String_clone(%String %key70)
  %m72 = load ptr, ptr %m1, align 8
  %access73 = getelementptr inbounds nuw %KeyMap, ptr %m72, i32 0, i32 0
  %getmembervalue74 = load ptr, ptr %access73, align 8
  %i75 = load i64, ptr %i, align 4
  %idx_ptr76 = getelementptr %Entry, ptr %getmembervalue74, i64 %i75
  %"idx[]_load77" = load %Entry, ptr %idx_ptr76, align 8
  %access78 = getelementptr inbounds nuw %Entry, ptr %idx_ptr76, i32 0, i32 0
  %getmembervalue79 = load %String, ptr %access78, align 8
  store %String %calltmp71, ptr %access78, align 8
  %m80 = load ptr, ptr %m1, align 8
  %access81 = getelementptr inbounds nuw %KeyMap, ptr %m80, i32 0, i32 3
  %getmembervalue82 = load i64, ptr %access81, align 4
  %malloc_call = call ptr @malloc(i64 %getmembervalue82)
  %valptr = alloca ptr, align 8
  store ptr %malloc_call, ptr %valptr, align 8
  %valptr83 = load ptr, ptr %valptr, align 8
  %value84 = load ptr, ptr %value3, align 8
  %m85 = load ptr, ptr %m1, align 8
  %access86 = getelementptr inbounds nuw %KeyMap, ptr %m85, i32 0, i32 3
  %getmembervalue87 = load i64, ptr %access86, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %valptr83, ptr align 1 %value84, i64 %getmembervalue87, i1 false)
  %valptr88 = load ptr, ptr %valptr, align 8
  %m89 = load ptr, ptr %m1, align 8
  %access90 = getelementptr inbounds nuw %KeyMap, ptr %m89, i32 0, i32 0
  %getmembervalue91 = load ptr, ptr %access90, align 8
  %i92 = load i64, ptr %i, align 4
  %idx_ptr93 = getelementptr %Entry, ptr %getmembervalue91, i64 %i92
  %"idx[]_load94" = load %Entry, ptr %idx_ptr93, align 8
  %access95 = getelementptr inbounds nuw %Entry, ptr %idx_ptr93, i32 0, i32 1
  %getmembervalue96 = load ptr, ptr %access95, align 8
  store ptr %valptr88, ptr %access95, align 8
  %m97 = load ptr, ptr %m1, align 8
  %access98 = getelementptr inbounds nuw %KeyMap, ptr %m97, i32 0, i32 1
  %getmembervalue99 = load i64, ptr %access98, align 4
  %add100 = add i64 %getmembervalue99, 1
  %m101 = load ptr, ptr %m1, align 8
  %access102 = getelementptr inbounds nuw %KeyMap, ptr %m101, i32 0, i32 1
  %getmembervalue103 = load i64, ptr %access102, align 4
  store i64 %add100, ptr %access102, align 4
  ret i32 0

and.rhs:                                          ; preds = %continue-loop43
  %key47 = load %String, ptr %key2, align 8
  %m48 = load ptr, ptr %m1, align 8
  %access49 = getelementptr inbounds nuw %KeyMap, ptr %m48, i32 0, i32 0
  %getmembervalue50 = load ptr, ptr %access49, align 8
  %i51 = load i64, ptr %i, align 4
  %sub = sub i64 %i51, 1
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue50, i64 %sub
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 8
  %access52 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 0
  %getmembervalue53 = load %String, ptr %access52, align 8
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
  %m1 = alloca ptr, align 8
  store ptr %m, ptr %m1, align 8
  %i = alloca i64, align 8
  store i64 0, ptr %i, align 4
  br label %loop_start-loop

loop_start-loop:                                  ; preds = %entry
  br label %continue-loop

continue-loop:                                    ; preds = %no_judge_continue-loop, %loop_start-loop
  %i2 = load i64, ptr %i, align 4
  %m3 = load ptr, ptr %m1, align 8
  %access = getelementptr inbounds nuw %KeyMap, ptr %m3, i32 0, i32 1
  %getmembervalue = load i64, ptr %access, align 4
  %slt = icmp slt i64 %i2, %getmembervalue
  br i1 %slt, label %no_judge_continue-loop, label %break-loop

no_judge_continue-loop:                           ; preds = %continue-loop
  %m4 = load ptr, ptr %m1, align 8
  %access5 = getelementptr inbounds nuw %KeyMap, ptr %m4, i32 0, i32 0
  %getmembervalue6 = load ptr, ptr %access5, align 8
  %i7 = load i64, ptr %i, align 4
  %idx_ptr = getelementptr %Entry, ptr %getmembervalue6, i64 %i7
  %"idx[]_load" = load %Entry, ptr %idx_ptr, align 8
  %access8 = getelementptr inbounds nuw %Entry, ptr %idx_ptr, i32 0, i32 1
  %getmembervalue9 = load ptr, ptr %access8, align 8
  call void @free(ptr %getmembervalue9)
  %m10 = load ptr, ptr %m1, align 8
  %access11 = getelementptr inbounds nuw %KeyMap, ptr %m10, i32 0, i32 0
  %getmembervalue12 = load ptr, ptr %access11, align 8
  %i13 = load i64, ptr %i, align 4
  %idx_ptr14 = getelementptr %Entry, ptr %getmembervalue12, i64 %i13
  %"idx[]_load15" = load %Entry, ptr %idx_ptr14, align 8
  %access16 = getelementptr inbounds nuw %Entry, ptr %idx_ptr14, i32 0, i32 0
  %getmembervalue17 = load %String, ptr %access16, align 8
  call void @String_free(ptr %access16)
  %i18 = load i64, ptr %i, align 4
  %add = add i64 %i18, 1
  store i64 %add, ptr %i, align 4
  br label %continue-loop

break-loop:                                       ; preds = %continue-loop
  %m19 = load ptr, ptr %m1, align 8
  %access20 = getelementptr inbounds nuw %KeyMap, ptr %m19, i32 0, i32 0
  %getmembervalue21 = load ptr, ptr %access20, align 8
  call void @free(ptr %getmembervalue21)
  ret void
}

define void @clear_cli_screen() {
entry:
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_20, ptr @str_19)
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
  %sprintf = call i32 (ptr, ptr, ...) @sprintf(ptr %fmt_buf, ptr @str_21, double %getmembervalue, double %getmembervalue5)
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_22, ptr %fmt_buf)
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

define %Option @Option_new(i1 %is_some, ptr %value) {
entry:
  %is_some1 = alloca i1, align 1
  store i1 %is_some, ptr %is_some1, align 1
  %value2 = alloca ptr, align 8
  store ptr %value, ptr %value2, align 8
  %ret_val = alloca %Option, align 8
  %ret = alloca %Option, align 8
  store %Option zeroinitializer, ptr %ret, align 8
  %is_some3 = load i1, ptr %is_some1, align 1
  %ret4 = load %Option, ptr %ret, align 8
  %access = getelementptr inbounds nuw %Option, ptr %ret, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  store i1 %is_some3, ptr %access, align 1
  %value5 = load ptr, ptr %value2, align 8
  %ret6 = load %Option, ptr %ret, align 8
  %access7 = getelementptr inbounds nuw %Option, ptr %ret, i32 0, i32 1
  %getmembervalue8 = load ptr, ptr %access7, align 8
  store ptr %value5, ptr %access7, align 8
  %ret9 = load %Option, ptr %ret, align 8
  ret %Option %ret9
}

define %Option @Some(ptr %value) {
entry:
  %value1 = alloca ptr, align 8
  store ptr %value, ptr %value1, align 8
  %ret_val = alloca %Option, align 8
  %value2 = load ptr, ptr %value1, align 8
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
  store %Option %self, ptr %self1, align 8
  %ret_val = alloca i1, align 1
  %self2 = load %Option, ptr %self1, align 8
  %access = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  ret i1 %getmembervalue
}

define ptr @unwrap(%Option %self) {
entry:
  %self1 = alloca %Option, align 8
  store %Option %self, ptr %self1, align 8
  %ret_val = alloca ptr, align 8
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self2 = load %Option, ptr %self1, align 8
  %access = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  br i1 %getmembervalue, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %self3 = load %Option, ptr %self1, align 8
  %access4 = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 1
  %getmembervalue5 = load ptr, ptr %access4, align 8
  ret ptr %getmembervalue5

if.else:                                          ; preds = %if.cond.0
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_24, ptr @str_23)
  call void @exit(i32 1)
  %calltmp = call ptr @null()
  ret ptr %calltmp
}

define ptr @expect(%Option %self, ptr %error_message) {
entry:
  %self1 = alloca %Option, align 8
  store %Option %self, ptr %self1, align 8
  %error_message2 = alloca ptr, align 8
  store ptr %error_message, ptr %error_message2, align 8
  %ret_val = alloca ptr, align 8
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self3 = load %Option, ptr %self1, align 8
  %access = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 0
  %getmembervalue = load i1, ptr %access, align 1
  br i1 %getmembervalue, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %self4 = load %Option, ptr %self1, align 8
  %access5 = getelementptr inbounds nuw %Option, ptr %self1, i32 0, i32 1
  %getmembervalue6 = load ptr, ptr %access5, align 8
  ret ptr %getmembervalue6

if.else:                                          ; preds = %if.cond.0
  %error_message7 = load ptr, ptr %error_message2, align 8
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_25, ptr %error_message7)
  call void @exit(i32 1)
  %calltmp = call ptr @null()
  ret ptr %calltmp
}

define %Iterator @iter_new(ptr %pointer, ptr %start, ptr %end, i64 %elem_size) {
entry:
  %pointer1 = alloca ptr, align 8
  store ptr %pointer, ptr %pointer1, align 8
  %start2 = alloca ptr, align 8
  store ptr %start, ptr %start2, align 8
  %end3 = alloca ptr, align 8
  store ptr %end, ptr %end3, align 8
  %elem_size4 = alloca i64, align 8
  store i64 %elem_size, ptr %elem_size4, align 4
  %ret_val = alloca %Iterator, align 8
  %iter = alloca %Iterator, align 8
  store %Iterator zeroinitializer, ptr %iter, align 8
  %pointer5 = load ptr, ptr %pointer1, align 8
  %iter6 = load %Iterator, ptr %iter, align 8
  %access = getelementptr inbounds nuw %Iterator, ptr %iter, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 8
  store ptr %pointer5, ptr %access, align 8
  %start7 = load ptr, ptr %start2, align 8
  %iter8 = load %Iterator, ptr %iter, align 8
  %access9 = getelementptr inbounds nuw %Iterator, ptr %iter, i32 0, i32 1
  %getmembervalue10 = load ptr, ptr %access9, align 8
  store ptr %start7, ptr %access9, align 8
  %end11 = load ptr, ptr %end3, align 8
  %iter12 = load %Iterator, ptr %iter, align 8
  %access13 = getelementptr inbounds nuw %Iterator, ptr %iter, i32 0, i32 2
  %getmembervalue14 = load ptr, ptr %access13, align 8
  store ptr %end11, ptr %access13, align 8
  %elem_size15 = load i64, ptr %elem_size4, align 4
  %iter16 = load %Iterator, ptr %iter, align 8
  %access17 = getelementptr inbounds nuw %Iterator, ptr %iter, i32 0, i32 3
  %getmembervalue18 = load i64, ptr %access17, align 4
  store i64 %elem_size15, ptr %access17, align 4
  %iter19 = load %Iterator, ptr %iter, align 8
  ret %Iterator %iter19
}

define %Iterator @iter(ptr %contents, ptr %end, i64 %elem_size) {
entry:
  %contents1 = alloca ptr, align 8
  store ptr %contents, ptr %contents1, align 8
  %end2 = alloca ptr, align 8
  store ptr %end, ptr %end2, align 8
  %elem_size3 = alloca i64, align 8
  store i64 %elem_size, ptr %elem_size3, align 4
  %ret_val = alloca %Iterator, align 8
  %contents4 = load ptr, ptr %contents1, align 8
  %contents5 = load ptr, ptr %contents1, align 8
  %end6 = load ptr, ptr %end2, align 8
  %elem_size7 = load i64, ptr %elem_size3, align 4
  %calltmp = call %Iterator @iter_new(ptr %contents4, ptr %contents5, ptr %end6, i64 %elem_size7)
  ret %Iterator %calltmp
}

define %Option @iter_next(ptr %self) {
entry:
  %self1 = alloca ptr, align 8
  store ptr %self, ptr %self1, align 8
  %ret_val = alloca %Option, align 8
  %self2 = load ptr, ptr %self1, align 8
  %access = getelementptr inbounds nuw %Iterator, ptr %self2, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 8
  %ret = alloca ptr, align 8
  store ptr %getmembervalue, ptr %ret, align 8
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self3 = load ptr, ptr %self1, align 8
  %access4 = getelementptr inbounds nuw %Iterator, ptr %self3, i32 0, i32 0
  %getmembervalue5 = load ptr, ptr %access4, align 8
  %self6 = load ptr, ptr %self1, align 8
  %access7 = getelementptr inbounds nuw %Iterator, ptr %self6, i32 0, i32 2
  %getmembervalue8 = load ptr, ptr %access7, align 8
  %ptr_a_i = ptrtoint ptr %getmembervalue5 to i64
  %ptr_b_i = ptrtoint ptr %getmembervalue8 to i64
  %slt = icmp slt i64 %ptr_a_i, %ptr_b_i
  br i1 %slt, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %ret9 = load ptr, ptr %ret, align 8
  %self10 = load ptr, ptr %self1, align 8
  %access11 = getelementptr inbounds nuw %Iterator, ptr %self10, i32 0, i32 3
  %getmembervalue12 = load i64, ptr %access11, align 4
  %ptr_add = getelementptr i8, ptr %ret9, i64 %getmembervalue12
  %self13 = load ptr, ptr %self1, align 8
  %access14 = getelementptr inbounds nuw %Iterator, ptr %self13, i32 0, i32 0
  %getmembervalue15 = load ptr, ptr %access14, align 8
  store ptr %ptr_add, ptr %access14, align 8
  %ret16 = load ptr, ptr %ret, align 8
  %calltmp = call %Option @Some(ptr %ret16)
  ret %Option %calltmp

if.else:                                          ; preds = %if.cond.0
  %calltmp17 = call %Option @None()
  ret %Option %calltmp17
}

define %Option @iter_peek(ptr %self) {
entry:
  %self1 = alloca ptr, align 8
  store ptr %self, ptr %self1, align 8
  %ret_val = alloca %Option, align 8
  %self2 = load ptr, ptr %self1, align 8
  %access = getelementptr inbounds nuw %Iterator, ptr %self2, i32 0, i32 0
  %getmembervalue = load ptr, ptr %access, align 8
  %ret = alloca ptr, align 8
  store ptr %getmembervalue, ptr %ret, align 8
  br label %if.cond.0

if.cond.0:                                        ; preds = %entry
  %self3 = load ptr, ptr %self1, align 8
  %access4 = getelementptr inbounds nuw %Iterator, ptr %self3, i32 0, i32 0
  %getmembervalue5 = load ptr, ptr %access4, align 8
  %self6 = load ptr, ptr %self1, align 8
  %access7 = getelementptr inbounds nuw %Iterator, ptr %self6, i32 0, i32 2
  %getmembervalue8 = load ptr, ptr %access7, align 8
  %ptr_a_i = ptrtoint ptr %getmembervalue5 to i64
  %ptr_b_i = ptrtoint ptr %getmembervalue8 to i64
  %slt = icmp slt i64 %ptr_a_i, %ptr_b_i
  br i1 %slt, label %if.then.0, label %if.else

if.then.0:                                        ; preds = %if.cond.0
  %ret9 = load ptr, ptr %ret, align 8
  %calltmp = call %Option @Some(ptr %ret9)
  ret %Option %calltmp

if.else:                                          ; preds = %if.cond.0
  %calltmp10 = call %Option @None()
  ret %Option %calltmp10
}

define i32 @main() {
entry:
  %ret_val = alloca i32, align 4
  %calltmp = call i32 @_TOPLEVEL_()
  %ans = alloca i64, align 8
  store i64 0, ptr %ans, align 4
  %n = alloca i64, align 8
  store i64 0, ptr %n, align 4
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_26, ptr %n)
  %ans1 = load i64, ptr %ans, align 4
  %fmt_buf = alloca [128 x i8], align 1
  %sprintf = call i32 (ptr, ptr, ...) @sprintf(ptr %fmt_buf, ptr @str_27, i64 %ans1)
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_28, ptr %fmt_buf)
  ret i32 0
}

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
