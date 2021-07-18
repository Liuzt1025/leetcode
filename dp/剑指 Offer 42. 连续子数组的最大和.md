# [剑指 Offer 42. 连续子数组的最大和](https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/)

---

## Description

<section>
<p>输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。</p>
<p>要求时间复杂度为O(n)。</p>
<p>&nbsp;</p>
<p><strong>示例1:</strong></p>
<pre><strong>输入:</strong> nums = [-2,1,-3,4,-1,2,1,-5,4]
<strong>输出:</strong> 6
<strong>解释:</strong>&nbsp;连续子数组&nbsp;[4,-1,2,1] 的和最大，为&nbsp;6。</pre>
<p>&nbsp;</p>
<p><strong>提示：</strong></p>
<ul>
	<li><code>1 &lt;=&nbsp;arr.length &lt;= 10^5</code></li>
	<li><code>-100 &lt;= arr[i] &lt;= 100</code></li>
</ul>
<p>注意：本题与主站 53 题相同：<a href="https://leetcode-cn.com/problems/maximum-subarray/">https://leetcode-cn.com/problems/maximum-subarray/</a></p>
<p>&nbsp;</p>
</section>


## My Solution

```cpp
class Solution {
public:
    // int maxSubArray(vector<int>& nums) {
    //     int result = INT_MIN;
    //     // 如果局部和为负数，那么丢掉这个值
    //     int sum = 0;
    //     for(int i = 0; i < nums.size(); ++i){
    //         sum += nums[i];
    //         if(sum > result)result = sum;
    //         if(sum < 0)sum = 0;
    //     }

    //     return result;
    // }

    int maxSubArray(vector<int>& nums){
        int result = nums[0];
        int dp = 0;
        for(int i = 0; i < nums.size(); ++i){
            // dp = max(nums[i] + dp, nums[i]); 
            dp = max(nums[i] + dp, nums[i]);
            if(result < dp)result = dp;
        }

        return result;
    }
};
```