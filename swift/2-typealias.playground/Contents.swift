import Cocoa

// 类型别名
typealias luoo = Int
var a:luoo = 20
// 20
print(a)

typealias river = String
let b:river = "today"
print(b)

// 类型转换
var c = 30
print("字符串"+String(c))
var d:Bool = true
print("字符串"+String(d))
var e = "40"
//Optional(40)
print(Int(e))

// ?? 语法 前面无法满足类型转换，会赋值后面的值
var f = Double(e) ?? 50
// 结果 40.0
print(f)
var j = "40aa"
var k = Double(j) ?? 50
// 结果 50.0
print(k)


