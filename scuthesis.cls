\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{scuthesis}[2016/01/11 v0.1 scuthesis document class]
% 基于ctexrep模版，增加专有内容
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexrep}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{ctexrep}

\RequirePackage{ifthen,calc}
\RequirePackage{amsmath,amssymb}
\RequirePackage{txfonts}
\RequirePackage{graphicx}
\RequirePackage[config]{subfig}
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
\setCJKfamilyfont{hei}{SimHei}
\setCJKfamilyfont{fs}{FangSong}
\setCJKfamilyfont{kai}{KaiTi}
\newcommand{\song}{\CJKfamily{song}}    % 宋体
\def\songti{\song}
\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体
\def\fangsong{\fs}
\newcommand{\kai}{\CJKfamily{kai}}      % 楷体
\def\kaishu{\kai}
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体
\def\heiti{\hei}
\setmainfont{Times}
\setsansfont{Arial}
\setmonofont{Menlo}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
% 表格
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
% 参考文献
\RequirePackage[numbers,super,sort&compress]{natbib}
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

% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
\renewcommand\section{\@startsection{section}{1}{\z@}%
										 {-3.5ex \@plus -1ex \@minus -.2ex}%
										 {2.3ex \@plus.2ex}%
										 {\normalfont\normalsize\CJKfamily{hei}}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
										 {-3.5ex \@plus -1ex \@minus -.2ex}%
										 {2.3ex \@plus.2ex}%
										 {\normalfont\normalsize\CJKfamily{hei}}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
										 {-3.5ex \@plus -1ex \@minus -.2ex}%
										 {2.3ex \@plus.2ex}%
										 {\normalfont\normalsize\CJKfamily{hei}}}

%setupcounter
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
%setup chapter format
\CTEXsetup[beforeskip={-15pt}]{chapter}
\CTEXsetup[afterskip={10pt}]{chapter}
\CTEXsetup[name={,}]{chapter}
\CTEXsetup[number={\arabic{chapter}}]{chapter}
\CTEXsetup[nameformat={\zihao{3} \bfseries \heiti}]{chapter}
\CTEXsetup[titleformat={\zihao{3} \bfseries \heiti}]{chapter}

% 封面
\long\@xp\def\@xp\collect@@body\@xp#\@xp1\@xp\end\@xp#\@xp2\@xp{%
  \collect@@body{#1}\end{#2}}
\long\@xp\def\@xp\push@begins\@xp#\@xp1\@xp\begin\@xp#\@xp2\@xp{%
  \push@begins{#1}\begin{#2}}
\long\@xp\def\@xp\addto@envbody\@xp#\@xp1\@xp{%
  \addto@envbody{#1}}
\newcommand{\scu@@cabstract}[1]{\long\gdef\scu@cabstract{#1}}
\newenvironment{cabstract}{\collect@body\scu@@cabstract}{}
\newcommand{\scu@@eabstract}[1]{\long\gdef\scu@eabstract{#1}}
\newenvironment{eabstract}{\collect@body\scu@@eabstract}{}

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
	\vspace*{0cm}
	\includegraphics[height=1.6cm]{./images/scu}\par\vskip1.2cm
	{\zihao{1}\scu@bachelor@report@title}\par\vskip1cm
	\includegraphics[height=3.5cm]{./images/logo}\par\vskip0.5cm
	
  \newcolumntype{A}{>{\song}r<{}}
  \newcolumntype{B}{>{\kai}l<{}}
	\zihao{4}
	\begin{tabular}{AB}
		\scu@ctitle@pre & \thu@underline[8cm]\scu@ctitle@value\\[0.6cm]
		\scu@cdepartment@pre & \thu@underline[8cm]\scu@cdepartment@value\\[0.6cm]
		\scu@cmajor@pre & \thu@underline[8cm]\scu@cmajor@value\\[0.6cm]
		\scu@cname@pre  & \thu@underline[8cm]\scu@cname@value\\[0.6cm]
	\end{tabular}\\
	\begin{tabular}{ABAB}
		\scu@sid@pre & \thu@underline[3cm]\scu@sid@value 
		& \scu@session@pre & \thu@underline[3cm]\scu@session@value\\[0.6cm]
	\end{tabular}\\
	\begin{tabular}{AB}
		\scu@csupervisor@pre & \thu@underline[8cm]\scu@csupervisor@value\\[0.6cm]
	\end{tabular}\par\vskip2cm
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
}

\AtEndOfClass{\input{scuthesis.cfg}}
%%
%% End of file `ZJUthesis.cls'.
