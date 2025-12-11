; ModuleID = 'wapl_module'
source_filename = "wapl_module"

%VecT = type { ptr, i64, i64, i64 }
%String = type { ptr, i64, i64 }
%timespec = type { i64, i64 }

@str_0 = private unnamed_addr constant [13 x i8] c"Hello World!\00", align 1
@println_fmt_1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@str_2 = private unnamed_addr constant [13 x i8] c"Hello World!\00", align 1
@str_3 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@str_4 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@str_5 = private unnamed_addr constant [4 x i8] c"Yes\00", align 1
@str_6 = private unnamed_addr constant [3 x i8] c"No\00", align 1
@str_7 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@str_8 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@str_9 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@str_10 = private unnamed_addr constant [10 x i8] c"%1000000s\00", align 1
@str_11 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@str_12 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@println_fmt_13 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

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

define ptr @SayHello() {
entry:
  %ret_val = alloca ptr, align 8
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_1, ptr @str_0)
  %fmt_buf = alloca [128 x i8], align 1
  %sprintf = call i32 (ptr, ptr, ...) @sprintf(ptr %fmt_buf, ptr @str_2)
  ret ptr %fmt_buf
}

define ptr @bool_to_str(i1 %b) {
entry:
  %b1 = alloca i1, align 1
  store i1 %b, ptr %b1, align 1
  %ret_val = alloca ptr, align 8
  %b2 = load i1, ptr %b1, align 1
  %if = select i1 %b2, ptr @str_3, ptr @str_4
  ret ptr %if
}

define ptr @yes_no(i1 %b) {
entry:
  %b1 = alloca i1, align 1
  store i1 %b, ptr %b1, align 1
  %ret_val = alloca ptr, align 8
  %b2 = load i1, ptr %b1, align 1
  %if = select i1 %b2, ptr @str_5, ptr @str_6
  ret ptr %if
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
  %access = getelementptr inbounds nuw %VecT, ptr %"&self3", i32 0, i32 3
  %getmembervalue = load i64, ptr %access, align 4
  %"&self4" = load ptr, ptr %"&self1", align 8
  %access5 = getelementptr inbounds nuw %VecT, ptr %"&self4", i32 0, i32 2
  %getmembervalue6 = load i64, ptr %access5, align 4
  %value7 = load ptr, ptr %value2, align 8
  %access8 = getelementptr inbounds nuw %VecT, ptr %value7, i32 0, i32 2
  %getmembervalue9 = load i64, ptr %access8, align 4
  %add = add i64 %getmembervalue6, %getmembervalue9
  %sle = icmp sle i64 %getmembervalue, %add
  br i1 %sle, label %pending_true, label %pending_false

pending_true:                                     ; preds = %entry
  br label %capaover

pending_false:                                    ; preds = %entry
  br label %push

capaover:                                         ; preds = %pending_true
  %"&self10" = load ptr, ptr %"&self1", align 8
  %access11 = getelementptr inbounds nuw %VecT, ptr %"&self10", i32 0, i32 0
  %getmembervalue12 = load ptr, ptr %access11, align 8
  %"&self13" = load ptr, ptr %"&self1", align 8
  %access14 = getelementptr inbounds nuw %VecT, ptr %"&self13", i32 0, i32 2
  %getmembervalue15 = load i64, ptr %access14, align 4
  %value16 = load ptr, ptr %value2, align 8
  %access17 = getelementptr inbounds nuw %VecT, ptr %value16, i32 0, i32 2
  %getmembervalue18 = load i64, ptr %access17, align 4
  %add19 = add i64 %getmembervalue15, %getmembervalue18
  %"&self20" = load ptr, ptr %"&self1", align 8
  %access21 = getelementptr inbounds nuw %VecT, ptr %"&self20", i32 0, i32 1
  %getmembervalue22 = load i64, ptr %access21, align 4
  %mul = mul i64 %add19, %getmembervalue22
  %realloc_call = call ptr @realloc(ptr %getmembervalue12, i64 %mul)
  %"&self23" = load ptr, ptr %"&self1", align 8
  %access24 = getelementptr inbounds nuw %VecT, ptr %"&self23", i32 0, i32 0
  store ptr %realloc_call, ptr %access24, align 8
  %"&self25" = load ptr, ptr %"&self1", align 8
  %access26 = getelementptr inbounds nuw %VecT, ptr %"&self25", i32 0, i32 2
  %getmembervalue27 = load i64, ptr %access26, align 4
  %value28 = load ptr, ptr %value2, align 8
  %access29 = getelementptr inbounds nuw %VecT, ptr %value28, i32 0, i32 2
  %getmembervalue30 = load i64, ptr %access29, align 4
  %add31 = add i64 %getmembervalue27, %getmembervalue30
  %"&self32" = load ptr, ptr %"&self1", align 8
  %access33 = getelementptr inbounds nuw %VecT, ptr %"&self32", i32 0, i32 3
  store i64 %add31, ptr %access33, align 4
  br label %push

push:                                             ; preds = %capaover, %pending_false
  %"&self34" = load ptr, ptr %"&self1", align 8
  %access35 = getelementptr inbounds nuw %VecT, ptr %"&self34", i32 0, i32 0
  %getmembervalue36 = load ptr, ptr %access35, align 8
  %"&self37" = load ptr, ptr %"&self1", align 8
  %access38 = getelementptr inbounds nuw %VecT, ptr %"&self37", i32 0, i32 2
  %getmembervalue39 = load i64, ptr %access38, align 4
  %ptr_add = getelementptr i8, ptr %getmembervalue36, i64 %getmembervalue39
  %value40 = load ptr, ptr %value2, align 8
  %access41 = getelementptr inbounds nuw %VecT, ptr %value40, i32 0, i32 0
  %getmembervalue42 = load ptr, ptr %access41, align 8
  %value43 = load ptr, ptr %value2, align 8
  %access44 = getelementptr inbounds nuw %VecT, ptr %value43, i32 0, i32 2
  %getmembervalue45 = load i64, ptr %access44, align 4
  %value46 = load ptr, ptr %value2, align 8
  %access47 = getelementptr inbounds nuw %VecT, ptr %value46, i32 0, i32 1
  %getmembervalue48 = load i64, ptr %access47, align 4
  %mul49 = mul i64 %getmembervalue45, %getmembervalue48
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %ptr_add, ptr align 1 %getmembervalue42, i64 %mul49, i1 false)
  %"&self50" = load ptr, ptr %"&self1", align 8
  %access51 = getelementptr inbounds nuw %VecT, ptr %"&self50", i32 0, i32 2
  %getmembervalue52 = load i64, ptr %access51, align 4
  %value53 = load ptr, ptr %value2, align 8
  %access54 = getelementptr inbounds nuw %VecT, ptr %value53, i32 0, i32 2
  %getmembervalue55 = load i64, ptr %access54, align 4
  %add56 = add i64 %getmembervalue52, %getmembervalue55
  %"&self57" = load ptr, ptr %"&self1", align 8
  %access58 = getelementptr inbounds nuw %VecT, ptr %"&self57", i32 0, i32 2
  store i64 %add56, ptr %access58, align 4
  %value59 = load ptr, ptr %value2, align 8
  ret ptr %value59
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
  %idx_load = load i8, ptr %idx_ptr, align 1
  %eq = icmp eq i8 %idx_load, 0
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
  %idx_ptr = getelementptr ptr, ptr %deref18, i64 %deref21
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
  %access = getelementptr inbounds nuw %String, ptr %"&self3", i32 0, i32 2
  %getmembervalue = load i64, ptr %access, align 4
  %"&self4" = load ptr, ptr %"&self1", align 8
  %access5 = getelementptr inbounds nuw %String, ptr %"&self4", i32 0, i32 1
  %getmembervalue6 = load i64, ptr %access5, align 4
  %value7 = load ptr, ptr %value2, align 8
  %access8 = getelementptr inbounds nuw %String, ptr %value7, i32 0, i32 1
  %getmembervalue9 = load i64, ptr %access8, align 4
  %add = add i64 %getmembervalue6, %getmembervalue9
  %sle = icmp sle i64 %getmembervalue, %add
  br i1 %sle, label %pending_true, label %pending_false

pending_true:                                     ; preds = %entry
  br label %capaover

pending_false:                                    ; preds = %entry
  br label %push

capaover:                                         ; preds = %pending_true
  %"&self10" = load ptr, ptr %"&self1", align 8
  %access11 = getelementptr inbounds nuw %String, ptr %"&self10", i32 0, i32 0
  %getmembervalue12 = load ptr, ptr %access11, align 8
  %"&self13" = load ptr, ptr %"&self1", align 8
  %access14 = getelementptr inbounds nuw %String, ptr %"&self13", i32 0, i32 1
  %getmembervalue15 = load i64, ptr %access14, align 4
  %value16 = load ptr, ptr %value2, align 8
  %access17 = getelementptr inbounds nuw %String, ptr %value16, i32 0, i32 1
  %getmembervalue18 = load i64, ptr %access17, align 4
  %add19 = add i64 %getmembervalue15, %getmembervalue18
  %add20 = add i64 %add19, 1
  %mul = mul i64 %add20, 2
  %add21 = add i64 %mul, 1
  %realloc_call = call ptr @realloc(ptr %getmembervalue12, i64 %add21)
  %"&self22" = load ptr, ptr %"&self1", align 8
  %access23 = getelementptr inbounds nuw %String, ptr %"&self22", i32 0, i32 0
  store ptr %realloc_call, ptr %access23, align 8
  %"&self24" = load ptr, ptr %"&self1", align 8
  %access25 = getelementptr inbounds nuw %String, ptr %"&self24", i32 0, i32 1
  %getmembervalue26 = load i64, ptr %access25, align 4
  %value27 = load ptr, ptr %value2, align 8
  %access28 = getelementptr inbounds nuw %String, ptr %value27, i32 0, i32 1
  %getmembervalue29 = load i64, ptr %access28, align 4
  %add30 = add i64 %getmembervalue26, %getmembervalue29
  %add31 = add i64 %add30, 1
  %mul32 = mul i64 %add31, 2
  %"&self33" = load ptr, ptr %"&self1", align 8
  %access34 = getelementptr inbounds nuw %String, ptr %"&self33", i32 0, i32 2
  store i64 %mul32, ptr %access34, align 4
  br label %push

push:                                             ; preds = %capaover, %pending_false
  %"&self35" = load ptr, ptr %"&self1", align 8
  %access36 = getelementptr inbounds nuw %String, ptr %"&self35", i32 0, i32 0
  %getmembervalue37 = load ptr, ptr %access36, align 8
  %"&self38" = load ptr, ptr %"&self1", align 8
  %access39 = getelementptr inbounds nuw %String, ptr %"&self38", i32 0, i32 1
  %getmembervalue40 = load i64, ptr %access39, align 4
  %ptr_add = getelementptr i8, ptr %getmembervalue37, i64 %getmembervalue40
  %value41 = load ptr, ptr %value2, align 8
  %access42 = getelementptr inbounds nuw %String, ptr %value41, i32 0, i32 0
  %getmembervalue43 = load ptr, ptr %access42, align 8
  %value44 = load ptr, ptr %value2, align 8
  %access45 = getelementptr inbounds nuw %String, ptr %value44, i32 0, i32 1
  %getmembervalue46 = load i64, ptr %access45, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %ptr_add, ptr align 1 %getmembervalue43, i64 %getmembervalue46, i1 false)
  %"&self47" = load ptr, ptr %"&self1", align 8
  %access48 = getelementptr inbounds nuw %String, ptr %"&self47", i32 0, i32 1
  %getmembervalue49 = load i64, ptr %access48, align 4
  %value50 = load ptr, ptr %value2, align 8
  %access51 = getelementptr inbounds nuw %String, ptr %value50, i32 0, i32 1
  %getmembervalue52 = load i64, ptr %access51, align 4
  %add53 = add i64 %getmembervalue49, %getmembervalue52
  %"&self54" = load ptr, ptr %"&self1", align 8
  %access55 = getelementptr inbounds nuw %String, ptr %"&self54", i32 0, i32 1
  store i64 %add53, ptr %access55, align 4
  %"&self56" = load ptr, ptr %"&self1", align 8
  %access57 = getelementptr inbounds nuw %String, ptr %"&self56", i32 0, i32 0
  %deref = load ptr, ptr %access57, align 8
  %"&self58" = load ptr, ptr %"&self1", align 8
  %access59 = getelementptr inbounds nuw %String, ptr %"&self58", i32 0, i32 1
  %deref60 = load i64, ptr %access59, align 4
  %idx_ptr = getelementptr ptr, ptr %deref, i64 %deref60
  store i8 0, ptr %idx_ptr, align 1
  %value61 = load ptr, ptr %value2, align 8
  ret ptr %value61
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
  %idx_load = load i8, ptr %idx_ptr, align 1
  ret i8 %idx_load
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
  %if = select i1 %sge, i64 %x3, i64 %mul
  ret i64 %if
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
  %if = select i1 %sge, double %x3, double %fmul
  ret double %if
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
  %idx_load = load i64, ptr %idx_ptr, align 4
  %pivot = alloca i64, align 8
  store i64 %idx_load, ptr %pivot, align 4
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
  %idx_load13 = load i64, ptr %idx_ptr12, align 4
  %pivot14 = load i64, ptr %pivot, align 4
  %slt15 = icmp slt i64 %idx_load13, %pivot14
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
  %idx_load = load %String, ptr %idx_ptr, align 8
  %pivot = alloca %String, align 8
  store %String %idx_load, ptr %pivot, align 8
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
  %idx_load13 = load %String, ptr %idx_ptr12, align 8
  %pivot14 = load %String, ptr %pivot, align 8
  %calltmp = call i64 @String_cmp(%String %idx_load13, %String %pivot14)
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
  %time5 = load %timespec, ptr %time, align 4
  %deref = load i32, ptr %i, align 4
  %calltmp = call i32 @timespec_get(%timespec %time5, i32 %deref)
  %time6 = load %timespec, ptr %time, align 4
  ret %timespec %time6
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

define i32 @main() {
entry:
  %ret_val = alloca i32, align 4
  %calltmp = call i32 @_TOPLEVEL_()
  %ans = alloca i64, align 8
  store i64 0, ptr %ans, align 4
  %n = alloca i64, align 8
  store i64 0, ptr %n, align 4
  %scanf = call i32 (ptr, ...) @scanf(ptr @str_11, ptr %n)
  %n1 = load i64, ptr %n, align 4
  %calltmp2 = call ptr @input_i64(i64 %n1)
  %a = alloca ptr, align 8
  store ptr %calltmp2, ptr %a, align 8
  %ans3 = load i64, ptr %ans, align 4
  %fmt_buf = alloca [128 x i8], align 1
  %sprintf = call i32 (ptr, ptr, ...) @sprintf(ptr %fmt_buf, ptr @str_12, i64 %ans3)
  %printf = call i32 (ptr, ...) @printf(ptr @println_fmt_13, ptr %fmt_buf)
  %a4 = load ptr, ptr %a, align 8
  call void @free(ptr %a4)
  ret i32 0
}

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
