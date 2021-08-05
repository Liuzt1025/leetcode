# [剑指 Offer 12. 矩阵中的路径](https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof/)

---

## Description

<section>
<p>给定一个&nbsp;<code>m x n</code> 二维字符网格&nbsp;<code>board</code> 和一个字符串单词&nbsp;<code>word</code> 。如果&nbsp;<code>word</code> 存在于网格中，返回 <code>true</code> ；否则，返回 <code>false</code> 。</p>
<p>单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。</p>
<p>&nbsp;</p>
<p>例如，在下面的 3×4 的矩阵中包含单词 "ABCCED"（单词中的字母已标出）。</p>
<p><img style="width: 322px; height: 242px;" src="https://assets.leetcode.com/uploads/2020/11/04/word2.jpg" alt=""></p>
<p>&nbsp;</p>
<p><strong>示例 1：</strong></p>
<pre><strong>输入：</strong>board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
<strong>输出：</strong>true
</pre>
<p><strong>示例 2：</strong></p>
<pre><strong>输入：</strong>board = [["a","b"],["c","d"]], word = "abcd"
<strong>输出：</strong>false
</pre>
<p>&nbsp;</p>
<p><strong>提示：</strong></p>
<ul>
	<li><code>1 &lt;= board.length &lt;= 200</code></li>
	<li><code>1 &lt;= board[i].length &lt;= 200</code></li>
	<li><code>board</code> 和 <code>word</code> 仅由大小写英文字母组成</li>
</ul>
<p>&nbsp;</p>
<p><strong>注意：</strong>本题与主站 79 题相同：<a href="https://leetcode-cn.com/problems/word-search/">https://leetcode-cn.com/problems/word-search/</a></p>
</section>


## My Solution

```cpp
        if(k == word.size()){
            ok = true;
            return ;
        }
        if(i < 0 || i >= rows || j < 0 || j >= cols)return ;
        if(visited[i][j])return ;
        if(board[i][j] != word[k])return ;

        visited[i][j] = 1;
        dfs(board, i - 1, j , word, k+1);
        dfs(board, i + 1, j , word, k+1);
        dfs(board, i, j + 1 , word, k+1);
        dfs(board, i, j - 1, word, k+1);
        visited[i][j] = 0;
    }

    bool exist(vector<vector<char>>& board, string word) {
        // 回溯算法
        if(word.size() == 0)return true;
        char first = word[0];
        rows = board.size(), cols = board[0].size();
        visited.resize(rows, vector<char>(cols, 0));

        for(int i = 0; i < rows; ++i){
            for(int j = 0; j < cols; ++j){
                if(first == board[i][j]){
                    dfs(board, i, j, word, 0);
                    if(ok)return ok;
                }
            }
        }

        return ok;
    }
};
```