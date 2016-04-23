# ScuThesis 变更手册
## SchThesis.bst 0.1
_2016-04-24_

完成《参考文献著录要求》所要求的参考文献格式。

## 升级方法
1. 将 `scuthesis.bst` 文件拷入（建议符号链接）论文文件夹中
2. 修改原有的 `main.tex` 文件：

    ```diff
    - \bibliographystyle{bstutf8}
    + \bibliographystyle{scuthesis}
    ```

3. 另外，在论文目录下的 `bstutf8.bst` 也可以删除了。

## ScuThesis v0.5
_2016-04-23_

### 变更内容
1. 默认章标题居中
2. 附录章标题左对齐
3. 目录中对附录部分索引深度为0
4. 添加声明
5. 修改目录、表格和图片的章名

### 升级方法
直接替换 `scuthesis.cls` 与 `scuthesis.cfg` 文件，并在 `chapters/epilogue.tex` 文件最前方添加 `\announcement`，现在文件前三行应该如下

```diff
+ \announcement
+
  \begin{ack}
```

