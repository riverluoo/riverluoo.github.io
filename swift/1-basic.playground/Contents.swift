import Cocoa

// 基础数据类型
// 变量 var 常量 let
// 基础变量类型 Int Float Double Bool Character

var a:String = "today"

var b:Int = 100

var c:Float = 1.3

var d:Double = 1.5

var e:Bool = true

var f:Character = "a"

// 常量
let i:String="12"
let j:Int = 20

// 类型推断
var m = "today"
var n = 20
m = "rain"

print(type(of:m))

// 拼接字符串
print(a+m)
print(a+"\(n)")


