---
title: java虚拟机
date: 2018-10-09
layout: post
---

# 一、 运行时数据区域

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/jvm/540631a4-6018-40a5-aed7-081e2eeeaeea.png)

## 程序计数器

Program Counter Register 如果正在执行的是一个Java方法，记录的是正在执行的虚拟机字节码指令的地址; 如果是Native方法，则为空

## 虚拟机栈

Virtual Machine Stacks 是线程私有的，生命周期和线程相同，每个方法在执行的同时，都会创建一个栈帧用于存放局部变量表，操作数栈，动态链接，方法出口等信息。每个方法从调用直至完成的过程，就对应着一个栈帧在虚拟机栈中入栈到出栈的过程。

该区域可能抛出以下两种异常：

- 当线程请求的栈深度大于虚拟机所允许的深度，会抛出StackOverflowError异常
- 虚拟机栈可以动态扩展时无法申请到足够的内存，会抛出OutOfMemoryError异常

## 本地方法栈

Native Method  Stack 为虚拟机使用的Native方法服务

## 堆

所有的对象实例都在这里分配内存。

是垃圾收集的主要区域，也叫做“GC堆”，现在的收集器基本上都是采用分代手机算法，可以将堆分为三块：

* 新生代 

* 老年代

  新生代还可以分为三的空间：

* Eden 空间

* From Survivor 空间

* To Survivor 空间

无论如何划分，都与存放内容无关，无论哪个区域，存放的仍是对象实例

Java 堆可以处于物理上不连续的内存空间中，只要逻辑上连续即可，可以动态增加内存，增加失败时，会抛出OutOfMemoryError

可以通过修改初始值-Xms和最大值-Xmx两个参数来指定一盒java堆的内存大小，	

~~~
java -Xms=1M -Xmx=2M HackTheJava
~~~

## 方法区

在hotSpot虚拟机上，很多人愿意把方法区称为“永久代”（Permanent Generation）,但两者并不等价，仅仅是hotSport虚拟机用永久代来实现方法区。在JDK1.7以前，HotSpot把它当永久代进行垃圾回收，在JDK1.8之后，取消的永久代，用metaspace(元数据)区代替。

用于存放已被虚拟机加载的类信息，常量，静态变量，即时编译器编译后的代码等数据

和java堆内存一样不需要连续的内存，并且可以动态扩展，无法满足内存分配需求时，将会抛出OutOfMemoryError异常。

对这一块的垃圾回收的目标主要是针对常量池的回收和对类型的卸载

## 运行常量池

Runtime Constant Pool 是方法区的一部分

存放编译器生成的各种字面量和符号饮用，会在类加载进去方法区的的时候放入这个区域

除了编译器生成的常量，还可以动态生成

## 直接内存

Direct Memory并不是虚拟机运行时数据区的一部分，也不是java虚拟机规范中定义的内存区域，但这部分区域也被频繁的使用。

在JDK1.4中加入了NIO类，他可以直接使用Native函数库直接分配堆外内存，然后通过存储在堆中的DirectByteBuffer对象作为这块内存的引用进行操作。

进行动态扩展时也会出现OutOfMemoryError异常



# 二、 虚拟机对象

虚拟机遇到一条new指令时，首先将去检查这个指令的参数是否能够在常量池中定位到一个类的符号引用，并且检查这个符号引用的类是否已被加载，解析和初始化。

## 对象的内存布局

对象在内存中的布局可以分为3块区域

* 对象头（Header）
* 实例数据 （Instance Data）
* 对齐填充 （Padding）

## 对象的访问定位

句柄访问 ：java堆将会划分出来一块内存来作为句柄池，reference中存储的就是对象的句柄地址。

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/jvm/WX20180707-184919.png)

直接指针访问：refercnce中存储的直接就是对象地址

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/jvm/WX20180707-185154.png)

使用直接指针访问的方式速度更快，节省了一次指针定位的时间开销

## java 堆溢出

只要不断的创造对象，并且保证GC Roots到达对象之间有可达的路径来避免垃圾回收机制来清除这些对象，在对象数量达到堆的最大的容量限制后就会产生内存溢出异常。

* 内存泄露 (Memory Leak)
* 内存溢出 (Memory OverFlow)

## 虚拟机栈和本地方法区栈溢出

如果线程请求的栈深度大于虚拟机所允许的最大深度，将会抛出StackOverFlowError

如果虚拟栈在扩展栈时无法获取到足够的内存空间，将会抛出OutOfMemoryError

## 方法区和运行时的常量池溢出

一个类要被垃圾收集器回收掉，判定条件时比较苛刻的

在经常动态生成大了的Class的应用中，需要注意类的回收情况



# 三、 垃圾收集

## 判断一个对象是否存活

### 1：引用计数法

### 2:  可达性算法

### 3：引用类型

**强引用**

**软引用**

**弱引用**

**虚引用**

### 4: 方法区的回收



## 垃圾收集算法

### 1: 标记 - 清除

### 2 ：标记 - 整理

### 3 ：复制

### 4 ：分代收集



## 垃圾收集器

### 1 : Serial 收集器

### 2 ：ParNew 收集器

### 3 :  Parallel Scavenge 收集器

### 4 ：Serial Old 收集器

### 5 ：Parallel Old 收集器

### 6 ：CMS 收集器  

### 7 ：G1 收集器



## 内存分配和回收策略

### 1 : Minor GC 和 Full GC

### 2 : 内存分配

### 3 ：Fucc GC 的触发条件



# 四、 虚拟机性能监控

## JDK命令行工具

jps 

* -q
* -m
* -l
* -v



# 五、类加载机制

## 类的生命周期

* 加载（Loading）
* 验证 （Verification）
* 准备 (Preparation)
* 解析 （Resolution）
* 初始化 （Initialization）
* 使用 （Using）
* 卸载 （Unloading）

## 类初始化时机



## 类加载过程

### 1:加载

### 2:验证

### 3:准备

### 4:解析

### 5:初始化



## 类加载器

### 1:类与类加载器

### 2: 类加载器分类

### 3:双亲委派模式
