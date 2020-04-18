import Cocoa

/**
 基础运算符
 */
var a = 1+2*3

print(a)

// 合并空值
var b:Int? = 200
var c = b ?? 0

print(c)

// 三元运算符
var e = b != nil ? b! : 0
print(e)
