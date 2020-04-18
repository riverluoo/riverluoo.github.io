import Cocoa

var a = 10

// 没有穿透
switch a {
  case 130:
    print("A")
case 20:
    print("B")
default:
    print("C")
}

// 有穿透 fallthrough

switch a {
  case 130:
    print("A")
    fallthrough
case 20:
    print("B")
default:
    print("C")
}


