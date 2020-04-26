# ScuThesis
ScuThsis 是一个**非官方**的四川大学本科生毕业设计论文模板，模板的制作目的是为了让大家可以更容易的利用 LaTeX 排版引擎制作出排版精美的毕业论文，一来提高毕业论文的排版质量，二来可以将更多的精力放在论文内容的输出上。

在2016届毕业生中共有10多位参与ScuThesis内测，并有4位获得四川大学本科优秀毕业论文，其中1位被打回，要求提交`doc`格式文档。

## 注意事项
使用之前请阅读使用说明，并务必向指导老师咨询是否允许你提交PDF文档。

## 使用方法
使用 `git clone` 获取本项目，并使用 `git pull` 更新。

建议将模板与论文项目放置在不同的文件夹下，论文项目下使用符号链接链接到模板所在文件夹下，这样方便同时使用 git 管理模板版本和你自己的论文版本。

README文件夹下为帮助文档的源码，可以作为一个参考看看。

### 封面中文标题过长溢出如何换行？
在需要换行的地方加上一个空格即可，如果标题超过三行，可能会把封面日期挤到下一页，可能需要手动修改 `scuthesis.cls` 245-249 行的行距。


## License
The content of this project itself is licensed under the [LaTeX Project Public License 1.3c][lppl] license.

[lppl]: http://latex-project.org/lppl/
