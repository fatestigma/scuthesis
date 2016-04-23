%% scuthesis.cls
%% Copyright 2016 Xi Jin <fate.stigma@gmail.com>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Xi Jin.
%
% This work consists of the files scuthesis.cls and scuthesis.cfg.

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{scuthesis}[2016/04/23 v0.5 scuthesis document class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=scu,prefix=scu@opt@,setkeys=\kvsetkeys}
\DeclareBoolOption[true]{chapc}
\DeclareComplementaryOption{chapl}{chapc}
\DeclareBoolOption[true]{abstract}
\DeclareComplementaryOption{noabstract}{abstract}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\LoadClass[a4paper,UTF8,zihao=-4,scheme=chinese,fontset=none,linespread=1.4]{ctexbook}[2016/02/02]

\RequirePackage{ifthen,calc}
\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{fancyhdr}
\RequirePackage{indentfirst}
\RequirePackage{fontspec}
\ctexset{%
  punct=quanjiao,
  space=auto,
  autoindent=true}
\defaultfontfeatures{Mapping=tex-text}
\IfFileExists{ctex-fontset-scuthesis.def}
  {\ctexset{fontset=scuthesis}}
  {\ctexset{fontset=mac}}

\setmainfont[
  Ligatures=TeX,
  SmallCapsFont={Minion Pro},
  SmallCapsFeatures={Letters=SmallCaps},]{Times New Roman}
% \setsansfont{Arial}
% \setmonofont{Menlo}
\def\scuthesis{\textsc{ScuThesis}}
\def\version{0.5}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
% 表格
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
% 参考文献
\RequirePackage[square,numbers,super,sort&compress]{natbib}
% 书签
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\hypersetup{%
  CJKbookmarks=true,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfpagelabels,
  pdfborder=0 0 0}
\RequirePackage{hypernat}

\RequirePackage{geometry}
\geometry{a4paper,
  top=2.5cm,
  bottom=2.5cm,
  left=2.5cm,
  right=2cm,
  headheight=4.5mm,
  headsep=0.5cm,
  footskip=0.9cm}

\let\scu@cleardoublepage\cleardoublepage
\newcommand\scu@clearemptydoublepage{\clearpage{\thispagestyle{plain}\scu@cleardoublepage}}
\let\cleardoublepage\scu@clearemptydoublepage
\renewcommand\frontmatter{%
  % \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}}
\renewcommand\backmatter{%
  % \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue}

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

\DeclareCaptionLabelFormat{scu}{{\zihao{5}\songti #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{scu}{\hspace{1em}}
\DeclareCaptionFont{scu}{\zihao{5}}
\captionsetup{labelformat=scu,labelsep=scu,font=scu}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=3bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=3bp}
\captionsetup[sub]{font=thu,skip=6bp}

\ctexset{%
  chapter={
    % afterindent=true,
    pagestyle={fancy},
    beforeskip={-15pt},
    aftername=\hskip\ccwd,
    afterskip={10pt},
    name={,},
    number=\arabic{chapter},
    nameformat={\zihao{3}\xeCJKsetemboldenfactor{1}\bfseries\songti},
    titleformat={\zihao{3}\xeCJKsetemboldenfactor{1}\bfseries\songti},
  },
  section={
    % afterindent=true,
    beforeskip={3.5ex \@plus 1ex \@minus .2ex},
    afterskip={2.3ex \@plus.2ex},
    format={\zihao{4}\xeCJKsetemboldenfactor{1}\bf\songti},
  },
  subsection={
    % afterindent=true,
    beforeskip={3.25ex \@plus 1ex \@minus .2ex},
    afterskip={2.3ex \@plus.2ex},
    format={\zihao{-4}\xeCJKsetemboldenfactor{1}\bf\songti},
  },
  subsubsection={
    % afterindent=true,
    beforeskip={3.25ex \@plus 1ex \@minus .2ex},
    afterskip={2.3ex \@plus.2ex},
    format={\zihao{-4}\xeCJKsetemboldenfactor{1}\bf\songti},
  },
  appendix={
    number=\Alph{chapter},
  },
  % paragraph/afterindent=true,
  % subparagraph/afterindent=true
  contentsname=\scu@contentsname,
  listfigurename=\scu@listfigurename,
  listtablename=\scu@listtablename
}
\ifscu@opt@chapc\ctexset{chapter/format=\centering}
\else\ctexset{chapter/format=\raggedright}\fi


% Setup appendix format
\let\scu@appendix\appendix
\renewenvironment{appendix}{
  \scu@appendix
  \ctexset{chapter/format=\raggedright}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \renewcommand\theequation{\Alph{section}.\arabic{equation}}
  \ctexset{chapter/nameformat+=\raggedright}
}{}
% setup acknoledge format
\newenvironment{ack}{\chapter*{\raggedright\scu@acknowledgement@pre}}{\addcontentsline{toc}{chapter}{\scu@acknowledgement@pre}\clearpage}

\let\scu@tableofcontents\tableofcontents
\newcommand\scu@maketableofcontents{\clearpage\pdfbookmark[0]{目录}{tableofcontents}\scu@tableofcontents}
\let\tableofcontents\scu@maketableofcontents

% Cover
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
  \pdfbookmark[-1]{\scu@ctitle@value}{ctitle}
  \begin{center}
  \vspace*{.1cm}
  \includegraphics[height=1.6cm]{./images/scu}\par\vskip1.35cm % Logo
  {\zhsong\zihao{1}\scu@bachelor@report@title}\par\vskip1.2cm      % Title
  \includegraphics[height=3.5cm]{./images/logo}\par\vskip0.4cm % Badge
  \newcolumntype{A}{>{\songti}r<{}}
  \newcolumntype{B}{>{\bf\kaishu}l<{}}
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
  {\songti\zihao{-3}\scu@jiaowuchu@title}\par\vskip-3pt
  {\songti\zihao{-3}\scu@jiaowuchu@date}
  \end{center}
  \clearpage
  % \thispagestyle{empty} \phantom{s}
}
\def\scu@setup@pdfinfo{%
  \hypersetup{%
    pdftitle={\scu@ctitle@value},
    pdfauthor={\scu@cname@value},
    pdfsubject={\scu@bachelor@report@title},
    pdfcreator={\scuthesis-v\version}}}

\newcommand\makecover{
  \scu@setup@pdfinfo
  \begin{titlepage}
    \scu@cover
  \end{titlepage}
  \setcounter{page}{1}
  \normalsize
  \ifscu@opt@abstract
  \scu@makeabstract
  \fi
}

% Abstract
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
  \pdfbookmark[0]{摘要}{cabstract}
  \begin{center}
  \vspace*{1.0cm}
  {\bf\songti\zihao{-2} \scu@ctitle@value}\par\vskip1.2cm
  {\kaishu\zihao{4} \scu@cmajor@value}\par\vskip.75cm
  {\kaishu\zihao{4} \scu@cname@pre\hskip.6cm  \scu@cname@value \hskip1cm \scu@csupervisor@pre\hskip.6cm  \scu@csupervisor@value}\par
  \end{center}\par\vskip1.1cm
  {\addtolength\leftskip{1.7cm}
  \addtolength\rightskip{.9cm}
  {\bf\kaishu\zihao{5}{\fontspec{KaiTi} [}摘要{\fontspec{KaiTi} ]}}\hskip.2cm{\kaishu\zihao{5}\scu@cabstract}\vskip1.3cm
  {\bf\kaishu\zihao{5}{\fontspec{KaiTi} [}主题词{\fontspec{KaiTi} ]}}\hskip.2cm{\kaishu\zihao{5}\scu@cabstract@key}
  \clearpage}
  % English Abstract
  \pdfbookmark[0]{Abstract}{eabstract}
  \begin{center}
  \vspace*{.75cm}
  {\bf\zihao{-2} \scu@etitle@value}\par\vskip1.5cm
  {\sf\zihao{4} \scu@emajor@value}\par\vskip.8cm
  {\sf\zihao{4} \scu@ename@pre : \scu@ename@value \hskip1cm \scu@esupervisor@pre : \scu@esupervisor@value}\par
  \end{center}\par\vskip1.1cm
  {\bf\zihao{5}[Abstract]}\hskip.2cm{\zihao{5}\scu@eabstract}\vskip1cm
  {\bf\zihao{5}[Key Words]}\hskip.2cm{\zihao{5}\scu@eabstract@key}}

\newcommand\scu@makeannouncement{
  \clearpage
  \chapter*{\scu@announcement@title}
  \addcontentsline{toc}{chapter}{\scu@announcement@title}
  \scu@announcement@text\\[3cm]

  \begin{flushright}
    \begin{tabular}{cc}
      \scu@announcement@sig@author & \thu@underline[3.5cm] { } \\[1.18cm]
      \scu@announcement@sig@supervisor & \thu@underline[3.5cm] { } \\[1.18cm]
    \end{tabular}\\
    \the\year{}年\hspace{1.5em}月\hspace{1.5em}日
    % \scu@announcement@date
  \end{flushright}
}

\newcommand\announcement\scu@makeannouncement

% Footer and Header
\newcommand\scu@setfoot[1]{\if@openright\fancyfoot{}\fancyfoot[RO,LE]{#1}\else\fancyfoot[C]{#1}\fi}
\fancypagestyle{plain}{%
  \fancyhf{} % Clear current footer and header
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
  \scu@setfoot{\zihao{-5} \thepage}
}
\pagestyle{fancy}
\fancyhead{} %clear all fields
\fancyhead[L]{\zihao{5} \scu@report@name}
\fancyhead[R]{\zihao{5} \scu@ctitle@value}
\scu@setfoot{\zihao{-5} \thepage}

\AtEndOfClass{\input{scuthesis.cfg}}
%%
%% End of file `scuthesis.cls'.
