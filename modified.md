# ScuThesis 变更手册
## ScuThesis v1.0.1
_2020-03-23_

1. 修复摘要部分左括号在新版xelatex中可能缺失或编译错误的问题。

## ScuThesis v1.0
_2016-12-09_

正式发布1.0版本。

## ScuThesis v0.6.2
_2016-05-22_

本次变更文件为 `scuthesis.cls`、`scuthesis.cfg`。

1. 目录第一页去除了页码。
2. 页脚页码默认采用奇偶不同。
3. 修改论文标题为「设计」。

## ScuThesis v0.6.1
_2016-05-12_
本次变更文件为 `scuthesis.cls`。

1. 为翻译原文的参考文献添加一个包装好的 enumerate 环境 `originbbl`。

## ScuThesis v0.6
_2016-05-10_
本次变更文件为 `scuthesis.cls`。

1. 为文献翻译添加 `\title` 命令，添加文献标题
2. 对于课题名称过长添加折行功能，折行需要满足的条件
	1. 长度超过 200 pt
	2. `basic.tex` 文件中在需要折行的位置加入一个空格

## ScuThesis v0.5.3
_2016-05-04_

本次变更文件为 `scuthesis.cls` 与 `ctex-fonts-scuthesis.def`：

1. 由于之前情报错误，现在恢复「章」左对齐
2. 修改目录字体以符合学院规定（一级小三中易宋体加粗、二级四号中易宋体、三级小四中易楷体）
3. 修改标题字体（二级四号中易黑体加粗、三级小四中易楷体、四级小四中易宋体加粗）
4. 修改插图表格标题字体为五号无衬线（中文中易黑体与西文Arial）
5. 修改中易宋体、中易黑体的伪粗因子

## ScuThesis v0.5.2
_2016-04-30_

本次变更文件为 `scuthesis.cls`：

1. 修改目录深度为2
2. 修复子图标题字体问题

## ScuThesis v0.5.1
_2016-04-26_

本次变更文件为 `scuthesis.cls` 与 `scuthesis.cfg`：

1. 添加插图、表格、参考文献目录
2. 修改插图、表格、参考文献代码以居中标题
3. 修改目录含插图、表格目录中 Chapter 的间距
4. 修改 cftdot 样式
5. 修改点之间的间距 cftdotsep
6. 修改参考文献条目之间距离

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
