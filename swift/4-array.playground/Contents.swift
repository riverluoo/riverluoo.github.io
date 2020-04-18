import Cocoa

/**
 *  元组类型
 *
 */
// 不指定类型
var a = (1,1.3,"today",true)

print(a)

// 指定类型

var b:(String,Int)=("today",20)
print(b)

// 取值 按照索引
print(a.1)

// 修改值
a.1=3
print(a.1)

// 常量不能修改
let c = ("today",40)

// 元组修改是值传递
var d = ("today",50)
var f = d
f.0 = "aa"
print(d)
print(f)

// 元组名称
var (name1,name2) = ("today",60)
print(name1)
