# 并发的历史

- 资源利用
- 公平
- 方便

## JDK 提供的并发容器

JDK 提供的大部分在 java.util.concurrent 包中

- ConcurrentHashMap：线程安全的 HashMap
- CopyOnWirteArrayList : 线程安全的 list,在读多写少的情况下，性能非常好
- ConcurrentLinkedQueue ：高效的并发队列，使用链表实习，可以看作一个线程安全的 LinkedList
- ConcurrentSkipListMap : 是一个 map 使用跳表的数据结构进行快速查找

## ConcurrentHashMap

我们知道 HashMap 不是线程安全的，在并发场景下如果要保证一种可行的方法使用
Collection.synchronizedMap() 方法来包装 HashMap，但这种通过使用一个全局的同步不同线程间的并发访问，
会带来不可忽视的性能问题

以此 有了 ConcurrentHashMap ,在 concurrentHashMap 中，无论是连续的读操作还是写操作
都能保证很高的性能。在进行读操作不需要加锁，在写操作时通过锁分段技术只对所操作的段加锁而不影响其他的访问

### ConcurrentHashMap 的实现

- jdk1.7
  首先将数据分为一段一段的存储,然后给每一段数据加一把锁，当一个线程占用锁访问其中一个断数据时
  其他段数据也能被其他线程访问,CoucurrentHashMap 由 Segment 数组结构和 HashEntry 数组结构组成
  Segment 是一种可重入锁 ReentrantLock,在 ConcurrentHashMap 中扮演锁的角色
  HashEntry 用于存储键值对数据,一个 ConcurrentHashMap 里包含一个 Segment 数组，Segment 结构和 HashMap 类似
  是一种数组和链表的结构,一个 Segment 数组包含一个 HashEntry 数组，每个 HashEntry 是一个链表结构的元素，
  每个 Segment 守护着一个 HashEntry 数组里的元素，当对 HashEntry 数组的数据进行修改时，必须首先获得它对应的 Segment 锁

```java
static class Segment<K,V> extends ReentrantLock implements Serializable {
}
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20181219221241.png)

- jdk1.8

ConcurrentHashMap取消了Segment分段锁，采用CAS和synchronized来保证并发安全。
数据结构跟HashMap1.8的结构类似，数组+链表/红黑二叉树

synchronized只锁定当前链表或红黑二叉树的首节点，这样只要hash不冲突，就不会产生并发

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20181219221700.png)
