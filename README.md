# leetcode
日常刷题记录，对各个算法做了分类，方便复习。

使用的插件为：[LeetCode-Digest-Chrome](https://github.com/tankgit/LeetCode-Digest-Chrome)

## 1、双指针

1、[80. 删除有序数组中的重复项 II](https://github.com/Liuzt1025/leetcode/blob/master/doublePointer/80.%20%E5%88%A0%E9%99%A4%E6%9C%89%E5%BA%8F%E6%95%B0%E7%BB%84%E4%B8%AD%E7%9A%84%E9%87%8D%E5%A4%8D%E9%A1%B9%20II.md)



### 1、1 滑动窗口

滑动窗口通常用于解决区间问题。从经验上看：滑动窗口适合求某个连续子区间的长度 或者连续子区间的和这一类的问题。

#### 1、1、1 经典求区间长度问题

1、[1838. 最高频元素的频数](https://leetcode-cn.com/problems/frequency-of-the-most-frequent-element/)

2、[424. 替换后的最长重复字符](https://leetcode-cn.com/problems/longest-repeating-character-replacement/)

这道题不同的是，**在左右指针中间使用了一个数组记录左右指针所指区间内所有字母出现的频率，这道题实际上就是找区间内同样的字母出现频率最高的区间（区间长度为freq+k）**

另外，求最大区间长度还有一个可以利用的特点：**left和right之间的距离可以维持之前保存的最大的长度，即使目前这个区间的长度不满足条件也无所谓（对结果没有造成影响），因为要找的是最大的长度。**

3、[611. 有效三角形的个数](https://leetcode-cn.com/problems/valid-triangle-number/)

note: 2题是一道典型的滑动问题，因为要求是统计个数，那么排序之后，根据有序性，可以根据索引直接确定有效三角形的个数，而不需要一个一个遍历。当left + mid > right时，说明left+1，left+2,......到mid-1之间的以上的不等式都是成立的，可以直接根据索引求出满足的不等式个数，这个时候应该--mid，这样就left+mid的值可能会减小，然后再检查不等式成立与否，如果不成立，left++,重复以上过程即可。

4、[1800. 最大升序子数组和](https://leetcode-cn.com/problems/maximum-ascending-subarray-sum/)

## 2、字符数组

1、[1417. 重新格式化字符串](https://github.com/Liuzt1025/leetcode/blob/master/string/1417.%20%E9%87%8D%E6%96%B0%E6%A0%BC%E5%BC%8F%E5%8C%96%E5%AD%97%E7%AC%A6%E4%B8%B2.md)



## 3、贪心问题

1、[面试题 16.17. 连续数列](https://leetcode-cn.com/problems/contiguous-sequence-lcci/)（连接还没改）

2、[1877. 数组中最大数对和的最小值](https://leetcode-cn.com/problems/minimize-maximum-pair-sum-in-array/)

3、[1736. 替换隐藏数字得到的最晚时间](https://leetcode-cn.com/problems/latest-time-by-replacing-hidden-digits/)

4、[1713. 得到子序列的最少操作次数](https://leetcode-cn.com/problems/minimum-operations-to-make-a-subsequence/)

第四题的关键点是：target是不重复的数组，那么元素的索引的哈希映射也就是一个升序的数组，要求的是arr中找到最长的升序数组的个数就好了。如果转化为这个问题之后，那么问题就好办了。

还有一个点，如何求最大升序和呢？如果找到一个数，比现有数组的最后一个位置还要小，那么就替代，反之，那么就插入到后面。

## 4、哈希

1、[面试题 10.02. 变位词组](https://leetcode-cn.com/problems/group-anagrams-lcci/)

变位词是指字母相同，但排列不同的字符串。变位词的哈希有两种主要的方法：

1、排序之后再作为key

2、记录每个字母出现的频率数组，作为hash，然后自定义哈希函数

2、[剑指 Offer 52. 两个链表的第一个公共节点](https://leetcode-cn.com/problems/liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof/)

3、[138. 复制带随机指针的链表](https://leetcode-cn.com/problems/copy-list-with-random-pointer/)

使用哈希映射非常适合用于加强链表的随机访问能力。

4、[1893. 检查是否区域内所有整数都被覆盖](https://leetcode-cn.com/problems/check-if-all-the-integers-in-a-range-are-covered/)

5、[1743. 从相邻元素对还原数组](https://leetcode-cn.com/problems/restore-the-array-from-adjacent-pairs/)

第5题 相邻元素之间的一个性质就是 在头尾位置的两个节点，他们的入度为0，出度为1，通过这样就可以找到头和尾。题解另外一个巧妙的地方在于判断环的存在（因为一个pair是含有一个入度和一个出度的，因此会存在环）。result[i] = result[i-2] == vec[0] ? vec[1] : vec[0];**这道题目明显有着非常鲜明的图的风格，但是做的时候没有发现。**

## 5、DFS

1、[676. 实现一个魔法字典](https://leetcode-cn.com/problems/implement-magic-dictionary/)

2、[剑指 Offer 12. 矩阵中的路径](https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof/)

## 6、前缀树

前缀树中每一个节点的表示：

```cpp
struct Node{
	array<Node *, 26> next;
    bool isOccupied;
    Node(bool t = false) : next({nullptr}), isOccupied(t){};
};
```

1、[676. 实现一个魔法字典](https://leetcode-cn.com/problems/implement-magic-dictionary/)

这道题给的启发有：

一、在使用递归的时候，在子底向上的时候，返回值可以采用如下的形式。这样的直接的结果就是带着结果按照调用的顺序原路返回返回值。

```cpp
if(dfs(...))return ...; 
```

二、思维僵化，没有考虑到 即使对于的next存在，也可以选择替换的情况。

三、递归代码设计水平还是有所欠缺。（结束条件要多考虑一下）

2、[720. 词典中最长的单词](https://leetcode-cn.com/problems/longest-word-in-dictionary/)



**汉明距离**

汉明距离是以理查德·卫斯里·汉明的名字命名的。在信息论中，两个等长字符串之间的汉明距离是两个字符串对应位置的不同字符的个数。换句话说，它就是将一个字符串变换成另外一个字符串所需要替换的字符个数。例如：

1011101 与 1001001 之间的汉明距离是 2。

2143896 与 2233796 之间的汉明距离是 3。

"toned" 与 "roses" 之间的汉明距离是 3。

## 7、二叉树

1、[671. 二叉树中第二小的节点](https://leetcode-cn.com/problems/second-minimum-node-in-a-binary-tree/)

这道题目主要的问题出在：没有想到以下两点

一、root->val = min(root->left->val, root->right->val)中没有想到左右子节点相等的情况。

二、还有maxv=INT_MAX中如果出现测试用例中出现了INT_MAX的情况。

2、[1104. 二叉树寻路](https://leetcode-cn.com/problems/path-in-zigzag-labelled-binary-tree/)

这道题目的问题出在:对**二叉树的性质**理解不到位

如果从左到右对二叉树的节点进行标号，那么每一层的节点的起始标号为left = pow(2, level), 终止标号为right = left * 2 - 1，level从0开始计算。每一层的节点数量是pow(2, level)，减一之后的数量是以上所有节点数量之和。

如果对二叉树的节点进行标号，通过标号就可以得到该节点的具体位置。标号除2就得到父节点的标号。乘以2可以得到其左儿子，再加一就可以得到右儿子。

以上都是针对从1开始计数而言的，那么从2开始计数有什么区别呢？

3、[987. 二叉树的垂序遍历](https://leetcode-cn.com/problems/vertical-order-traversal-of-a-binary-tree/)

## 

## 8、图

1、[863. 二叉树中所有距离为 K 的结点](https://leetcode-cn.com/problems/all-nodes-distance-k-in-binary-tree/)

这道题涉及如何**将一颗二叉树转换为图**的实现，可以通过一次递归实现，但是必须自底上向上，代码如下：

```cpp
 struct Node {
        int val;
        vector<Node *> next;
        Node(int v = -1) : val(v), next(){};
    };

    Node *tar;

    Node * dfs(TreeNode *tnode, Node *farther, TreeNode *target){
        if(!tnode)return nullptr;   // 这一句可以去掉了  
        // 只有自底向下 才可以重建一个图
        Node *node = new Node(tnode->val);
        if(tnode->left)node->next.push_back(dfs(tnode->left, node, target));
        if(tnode->right)node->next.push_back(dfs(tnode->right, node, target));

        if(tnode == target){
            tar = node;
        }

        // 还有一个操作没有搞定
        if(farther)node->next.push_back(farther);
        return node;
    }
```

还有一种方法，就是通过广度优先遍历遍历所有的树节点，然后使用map来保存节父子节点之间的拓扑关系。这样的好处是不需要额外创建新的数据结构，并且使用TreeNode 指针作为key不容易发生碰撞。

### 8.1 拓扑排序

拓扑排序通常用来判断图中是否有环

### 8.2 并查集



### 8.3 图的遍历

图的遍历通常用dfs方法，但是一个节点一个节点去遍历效率是比较低的，一个比较好的方法是使用三色标记法：

**三色标记法：**给每个节点一个设置状态: 

0: 表示未访问过

1: 表示访问中，但是还没有返回，或者在图的一个环中

2: 访问过

每个节点的访问逻辑：首先判断是否为0，如果不为0判断是不是2，如果是2，那么返回true表示这个节点已经访问过了，如果是1，说明存在环，不能继续访问。

然后将节点设置为1，寻找下一个节点进入。所有的结点都进入之后，然后返回之后，将节点设置为2，然后返回true。

**使用三色标记法遍历图的一个优点是**:

1、进过节点之后的状态可以保存下来，下次不用重复的访问，因此效率较高，这种方法本质上是一种剪枝的操作。

2、可以判断图中是否有环的存在。在所有的图

1、[802. 找到最终的安全状态](https://leetcode-cn.com/problems/find-eventual-safe-states/)

### 8.4 最短路算法

#### 迪杰斯特拉算法：

1、[743. 网络延迟时间](https://leetcode-cn.com/problems/network-delay-time/)

## 9、前缀和

1、[1893. 检查是否区域内所有整数都被覆盖](https://leetcode-cn.com/problems/check-if-all-the-integers-in-a-range-are-covered/)

总结：**区间覆盖问题**

对于区间覆盖问题，最优解是使用差分数组和前缀和的方法。

差分数组diff表示相邻格之间，是否被覆盖的变化量。
diff[i]++,代表在i位置上有新的覆盖
若覆盖到j结束了呢？此时j依然是覆盖，但是j+1不在覆盖状态，所以在j+1处 -1；
即diff[j+1]--;

## 10、排序

1、[1337. 矩阵中战斗力最弱的 K 行](https://leetcode-cn.com/problems/the-k-weakest-rows-in-a-matrix/)
