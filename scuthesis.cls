\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{scuthesis}[2016/01/11 v0.1 scuthesis document class]
% 基于ctexrep模版，增加专有内容
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexrep}}
\ProcessOptions\relax
\LoadClass[cs4size,a4paper]{ctexrep}

\RequirePackage{ifthen,calc}
\RequirePackage{amsmath,amssymb}
\RequirePackage{txfonts}
\RequirePackage{graphicx}
% \RequirePackage[config]{subfig}
\RequirePackage{subfigure}
\RequirePackage{fancyhdr}
% 中文
\RequirePackage{indentfirst}
\RequirePackage{fontspec}
\RequirePackage{xltxtra}
\RequirePackage[normalindentfirst]{xeCJK}
\punctstyle{quanjiao}
\defaultfontfeatures{Mapping=tex-text} %如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
\setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{KaiTi}
\setCJKfamilyfont{song}{SimSun}
\setCJKfamilyfont{zhsong}{STZhongsong}
\setCJKfamilyfont{hei}{SimHei}
\setCJKfamilyfont{fs}{FangSong}
\setCJKfamilyfont{kai}{KaiTi}
\newcommand{\song}{\CJKfamily{song}}    % 宋体
\def\songti{\song}
\newcommand{\zhsong}{\CJKfamily{zhsong}}    % 华文中宋
\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体
\def\fangsong{\fs}
\newcommand{\kai}{\CJKfamily{kai}}      % 楷体
\def\kaishu{\kai}
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体
\def\heiti{\hei}

\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Menlo}
\def\scuthesis{\fontspec[SmallCapsFont=Minion Pro,SmallCapsFeatures={Letters=SmallCaps},]{Times New Roman}\textsc{ScuThesis}}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
% 表格
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{tabularx}
% 参考文献
\RequirePackage[square,numbers,super,sort&compress]{natbib}
% 书签
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\hypersetup{%
	CJKbookmarks=true,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfpagelabels,
  pdfborder=0 0 0}
\RequirePackage{hypernat}

\renewcommand\chapter{\clearpage\thispagestyle{fancy}\global\@topnum\z@
											\@afterindenttrue\secdef\@chapter\@schapter}

% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
\renewcommand\section{\@startsection{section}{1}{\z@}%
										 {-3.5ex \@plus -1ex \@minus -.2ex}%
										 {2.3ex \@plus.2ex}%
										 {\zihao{4}\xeCJKsetemboldenfactor{1}\bf\CJKfamily{song}}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
										 {-3.5ex \@plus -1ex \@minus -.2ex}%
										 {2.3ex \@plus.2ex}%
										 {\zihao{-4}\xeCJKsetemboldenfactor{1}\bf\CJKfamily{song}}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
										 {-3.5ex \@plus -1ex \@minus -.2ex}%
										 {2.3ex \@plus.2ex}%
										 {\zihao{-4}\xeCJKsetemboldenfactor{1}\bf\CJKfamily{song}}}

% setupcounter
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
% setup chapter format
\CTEXsetup[beforeskip={-15pt}]{chapter}
\CTEXsetup[afterskip={10pt}]{chapter}
\CTEXsetup[name={,}]{chapter}
\CTEXsetup[number={\arabic{chapter}}]{chapter}
\CTEXsetup[nameformat={\zihao{3}\xeCJKsetemboldenfactor{1}\bfseries\CJKfamily{song}}]{chapter}
\CTEXsetup[titleformat={\zihao{3}\xeCJKsetemboldenfactor{1}\bfseries\CJKfamily{song}}]{chapter}
% setup appendix format
\let\scu@appendix\appendix
\renewenvironment{appendix}{
  \scu@appendix
  \CTEXsetup[number=\Alph{chapter}]{appendix}
	\renewcommand\theequation{\Alph{section}.\arabic{equation}}
	\CTEXsetup[nameformat={\zihao{3} \bfseries \heiti \raggedright}]{chapter}}{}
% setup acknoledge format
\newenvironment{ack}{\chapter*{\raggedright\scu@acknowledgement@pre}}{\addcontentsline{toc}{chapter}{\scu@acknowledgement@pre}\clearpage}

% 封面
\def\scu@define@term#1{
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname scu@#1@value\endcsname{##1}}
  \csname #1\endcsname{}}
\scu@define@term{ctitle}
\scu@define@term{etitle}
\scu@define@term{cdepartment}
\scu@define@term{edepartment}
\scu@define@term{cmajor}
\scu@define@term{emajor}
\scu@define@term{cname}
\scu@define@term{ename}
\scu@define@term{csupervisor}
\scu@define@term{esupervisor}
\scu@define@term{sid}
\scu@define@term{session}

\newcommand\thu@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\newcommand\scu@cover{
	\begin{center}
	\vspace*{.1cm}
	\includegraphics[height=1.6cm]{./images/scu}\par\vskip1.35cm % 四川大学 Logo
	{\zhsong \zihao{1}\scu@bachelor@report@title}\par\vskip1.2cm      % 论文标题
	\includegraphics[height=3.5cm]{./images/logo}\par\vskip0.4cm % 四川大学 校徽
	
  \newcolumntype{A}{>{\song}r<{}}
  \newcolumntype{B}{>{\bf\kai}l<{}}
	\zihao{4}
	\begin{tabular}{AB}
		\scu@ctitle@pre & \thu@underline[8cm]\scu@ctitle@value\\[1.16cm]
		\scu@cdepartment@pre & \thu@underline[8cm]\scu@cdepartment@value\\[1.16cm]
		\scu@cmajor@pre & \thu@underline[8cm]\scu@cmajor@value\\[1.16cm]
		\scu@cname@p  & \thu@underline[8cm]\scu@cname@value\\[1.16cm]
	\end{tabular}\\
	\begin{tabular}{ABAB}
		\scu@sid@pre & \thu@underline[3cm]\scu@sid@value 
		& \scu@session@pre & \thu@underline[3cm]\scu@session@value\\[1.0cm]
	\end{tabular}\\
	\begin{tabular}{AB}
		\scu@csupervisor@pre & \thu@underline[8cm]\scu@csupervisor@value\\[0.6cm]
	\end{tabular}\par\vskip0.9cm
	{\song\zihao{-3}\scu@jiaowuchu@title}\par\vskip-3pt
	{\song\zihao{-3}\scu@jiaowuchu@date}
	\end{center}
}

\newcommand\makecover{
	% 封面
	\begin{titlepage}
		\scu@cover
	\end{titlepage}
	% 摘要
	\normalsize
	\scu@makeabstract
}

%% 摘要
\long\@xp\def\@xp\collect@@body\@xp#\@xp1\@xp\end\@xp#\@xp2\@xp{%
  \collect@@body{#1}\end{#2}}
\long\@xp\def\@xp\push@begins\@xp#\@xp1\@xp\begin\@xp#\@xp2\@xp{%
  \push@begins{#1}\begin{#2}}
\long\@xp\def\@xp\addto@envbody\@xp#\@xp1\@xp{%
  \addto@envbody{#1}}
\newcommand{\scu@@cabstract}[1]{\long\gdef\scu@cabstract{#1}}
\newenvironment{cabstract}[1][]{\collect@body\scu@@cabstract\gdef\scu@cabstract@key{#1}}{}
\newcommand{\scu@@eabstract}[1]{\long\gdef\scu@eabstract{#1}}
\newenvironment{eabstract}[1][]{\collect@body\scu@@eabstract\gdef\scu@eabstract@key{#1}}{}

\newcommand\scu@makeabstract{
	\clearpage
	\begin{center}
	\vspace*{1.0cm}
	{\bf\song\zihao{-2} \scu@ctitle@value}\par\vskip1.2cm
	{\kai\zihao{4} \scu@cmajor@value}\par\vskip.75cm
	{\kai\zihao{4} \scu@cname@pre\hskip.6cm  \scu@cname@value \hskip1cm \scu@csupervisor@pre\hskip.6cm  \scu@csupervisor@value}\par
	\end{center}\par\vskip1.1cm
	{\addtolength\leftskip{1.7cm}
	\addtolength\rightskip{.9cm}
	{\bf\kai\zihao{5}\texttt{[}摘要\texttt{]}}\hskip.2cm\kai\zihao{5} \scu@cabstract \vskip1.3cm
	{\bf\kai\zihao{5}\texttt{[}主题词\texttt{]}}\hskip.2cm\kai\zihao{5} \scu@cabstract@key
	\clearpage}
	% English Abstract
	\begin{center}
	\vspace*{.75cm}
	{\bf\zihao{-2} \scu@etitle@value}\par\vskip1.5cm
	{\sf\zihao{4} \scu@emajor@value}\par\vskip.8cm
	{\sf\zihao{4} \scu@ename@pre : \scu@ename@value \hskip1cm \scu@esupervisor@pre : \scu@esupervisor@value}\par
	\end{center}\par\vskip1.1cm
	{\bf\zihao{5}[Abstract]}\hskip.2cm\zihao{5} \scu@eabstract \vskip1cm
	{\bf\zihao{5}[Key Words]}\hskip.2cm\zihao{5} \scu@eabstract@key}

\RequirePackage[a4paper,
top=2.5cm,bottom=2.5cm,left=2.5cm,right=2cm,
headsep=0.5cm,footskip=0.9cm,
]{geometry}
\usepackage{setspace}
\linespread{1.4} %脚注和浮动对象中标题的行距也受影响
% \linestretch{1.4} 不影响标题的行距
% 可用 
% \renewcommand{\captionfont}{\linespread{1.6}\normalsize} 
% 单独修改浮动对象的标题行距

%% 页眉页脚
\fancypagestyle{plain}{%
  \fancyhf{}% 先清除当前页面的页眉页脚定义，是fancyhdr包中的定义
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
  \fancyfoot[C]{\zihao{-5} \thepage}
}
\pagestyle{fancy}
\fancyhead{} %clear all fields  
\fancyhead[L]{\zihao{5} \scu@report@name}  
\fancyhead[R]{\zihao{5} \scu@ctitle@value}
\fancyfoot[C]{\zihao{-5} \thepage}

\AtEndOfClass{\input{scuthesis.cfg}}
%%
%% End of file `scuthesis.cls'.
