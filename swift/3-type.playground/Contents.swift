import Cocoa

/**
 * 可选类型
 *  有些值可能为nil
 */
var a:Int? = nil
print(a)

var b:Int?=nil
print(b)

print(b ?? 20)

var c:String? = "today"
print(c!)

if c == nil
{
    print("没有值")
}
else
{
    print("有值")
}
