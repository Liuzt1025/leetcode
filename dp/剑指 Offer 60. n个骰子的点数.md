# [剑指 Offer 60. n个骰子的点数](https://leetcode-cn.com/problems/nge-tou-zi-de-dian-shu-lcof/)

---

## Description

<section>
<p>把n个骰子扔在地上，所有骰子朝上一面的点数之和为s。输入n，打印出s的所有可能的值出现的概率。</p>
<p>&nbsp;</p>
<p>你需要用一个浮点数数组返回答案，其中第 i 个元素代表这 n 个骰子所能掷出的点数集合中第 i 小的那个的概率。</p>
<p>&nbsp;</p>
<p><strong>示例 1:</strong></p>
<pre><strong>输入:</strong> 1
<strong>输出:</strong> [0.16667,0.16667,0.16667,0.16667,0.16667,0.16667]
</pre>
<p><strong>示例&nbsp;2:</strong></p>
<pre><strong>输入:</strong> 2
<strong>输出:</strong> [0.02778,0.05556,0.08333,0.11111,0.13889,0.16667,0.13889,0.11111,0.08333,0.05556,0.02778]</pre>
<p>&nbsp;</p>
<p><strong>限制：</strong></p>
<p><code>1 &lt;= n &lt;= 11</code></p>
</section>


## My Solution

```cpp
class Solution {
public:
    // 这个是常规方法，暴力破解
    // int n_;
    // void dfs(vector<int> &count, int sum, int n){   // n从0开始的
    //     if(n == n_){
    //         ++count[sum - n];
    //         return ;
    //     }

    //     for(int i = 1; i < 7; ++i){
    //         dfs(count, sum + i, n+1);
    //     }
    // }

    // vector<double> dicesProbability(int n) {
        
    //     int existNumber = n == 1 ? 6 : n * 5;
    //     n_ = n;
    //     vector<int> count(existNumber);
    //     vector<double> result(existNumber);
    //     double div = 1 / pow(6, n);
    //     dfs(count, 0, 0);
    //     for(int i = 0; i < existNumber; ++i){
    //         result[i] = div * count[i];
    //     }
    //     return result;
    // }

    // 动态规划
    // 比如掷两次色子， 7-12这些数字中， 比如12，6出现了一次，那么剩下的那个6也就确定了
    // 比如11 5出现了1次，那么另外一个筛子必然是6， 6出现了一次，另外一个色子5， 综合来说就是11出现了两次
    // 这是一个经典的组合问题
    vector<double> dicesProbability(int n){
        int dp[70];
        memset(dp, 0, sizeof(int) * 70);
        for(int i = 1; i <= 6; ++i){
            dp[i] = 1;
        }

        for(int i = 2; i <= n; ++i){
            for(int j = i * 6; j >= i; --j){
                dp[j] = 0;
                for(int k = 1; k <= 6; ++k){
                    if(j - k < i - 1)break;
                    dp[j] += dp[j-k];
                }
            }
        }

        double all = pow(6, n);
        vector<double> result;
        int end = 6*n;
        for(int i = n; i <= 6*n; ++i){
            result.push_back((double)dp[i] / all);
        }

        return result;
    }
};
```