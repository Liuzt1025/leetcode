# [剑指 Offer 49. 丑数](https://leetcode-cn.com/problems/chou-shu-lcof/)

---

## Description

<section>
<p>我们把只包含质因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。</p>
<p>&nbsp;</p>
<p><strong>示例:</strong></p>
<pre><strong>输入:</strong> n = 10
<strong>输出:</strong> 12
<strong>解释: </strong><code>1, 2, 3, 4, 5, 6, 8, 9, 10, 12</code> 是前 10 个丑数。</pre>
<p><strong>说明:&nbsp;</strong>&nbsp;</p>
<ol>
	<li><code>1</code>&nbsp;是丑数。</li>
	<li><code>n</code>&nbsp;<strong>不超过</strong>1690。</li>
</ol>
<p>注意：本题与主站 264 题相同：<a href="https://leetcode-cn.com/problems/ugly-number-ii/">https://leetcode-cn.com/problems/ugly-number-ii/</a></p>
</section>


## My Solution

```cpp
class Solution {
public:
    int nthUglyNumber(int n) {
        priority_queue<long long, vector<long long>, greater<long long>> que; // 小顶堆
        unordered_set<long long> check;
        que.push(1);
        check.insert(1);
        long long result = 1;
        while(n--){
            result = que.top();
            que.pop();
            long long tmp = result * 2;
            if(!check.count(tmp)){
                que.push(tmp);
                check.insert(tmp);
            }
            tmp = result * 3;
            if(!check.count(tmp)){
                que.push(tmp);
                check.insert(tmp);
            }
            tmp = result * 5;
            if(!check.count(tmp)){
                que.push(tmp);
                check.insert(tmp);
            }
        }
        return result;
    }
};
```