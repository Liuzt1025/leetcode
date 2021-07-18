# [剑指 Offer 53 - I. 在排序数组中查找数字 I](https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof/)

---

## Description

<section>
<p>统计一个数字在排序数组中出现的次数。</p>
<p>&nbsp;</p>
<p><strong>示例 1:</strong></p>
<pre><strong>输入:</strong> nums = [<code>5,7,7,8,8,10]</code>, target = 8
<strong>输出:</strong> 2</pre>
<p><strong>示例&nbsp;2:</strong></p>
<pre><strong>输入:</strong> nums = [<code>5,7,7,8,8,10]</code>, target = 6
<strong>输出:</strong> 0</pre>
<p>&nbsp;</p>
<p><strong>限制：</strong></p>
<p><code>0 &lt;= 数组长度 &lt;= 50000</code></p>
<p>&nbsp;</p>
<p><strong>注意：</strong>本题与主站 34 题相同（仅返回值不同）：<a href="https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/">https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/</a></p>
</section>


## My Solution

```cpp
class Solution {
public:
    int bin_search(vector<int> &nums, int target){
        int left = 0, right = nums.size() - 1;
        while(left < right){
            int mid = (right - left) / 2 + left;
            if(nums[mid] >= target){
                right = mid;
            }else{
                left = mid + 1;
            }
        }
        return right;
    }
    int search(vector<int>& nums, int target) {
        // 二分法查找左边界
        int count = 0;
        int start = bin_search(nums, target);
        while(start < nums.size() && nums[start] == target){
            ++count;
            ++start;
        }
        return count;
    }
};
```