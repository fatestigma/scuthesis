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
\ProvidesClass{scuthesis}[2016/12/09 v1.0 scuthesis document class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=scu,prefix=scu@opt@,setkeys=\kvsetkeys}
\DeclareBoolOption[false]{chapc}
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

\setmainfont{Times New Roman}
\setsansfont{Arial}
\def\scuthesis{\textsc{ScuThesis}}
\def\version{1.0}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
% 表格
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
% 参考文献
\RequirePackage[square,numbers,super,sort&compress]{natbib}
\RequirePackage[shortlabels]{enumitem}
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
\geometry{%
  a4paper,
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
  \@mainmatterfalse
  \pagenumbering{Roman}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \ctexset{chapter/pagestyle={fancy}}
  \pagenumbering{arabic}}
\renewcommand\backmatter{\@mainmattertrue}

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}

% Caption Style
\DeclareCaptionLabelFormat{scu}{{\zihao{5}\sffamily #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{scu}{\hspace{1em}}
\DeclareCaptionFont{scu}{\zihao{5}\sffamily}
\captionsetup{labelformat=scu,labelsep=scu,font=scu}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=3bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=3bp}
\captionsetup[sub]{font=scu,skip=6bp}
\renewcommand\thesubfigure{(\alph{subfigure})}
\renewcommand\thesubtable{(\alph{subtable})}

\ctexset{%
  chapter={%
    pagestyle={fancy},
    beforeskip={-15pt},
    aftername=\hskip\ccwd,
    afterskip={10pt},
    name={,},
    number=\arabic{chapter},
    nameformat={\zihao{3}\bf\songti},
    titleformat={\zihao{3}\bf\songti},
  },
  section={%
    beforeskip={3.5ex \@plus 1ex \@minus .2ex},
    afterskip={2.3ex \@plus.2ex},
    format={\zihao{4}\bf\heiti},
  },
  subsection={%
    beforeskip={3.25ex \@plus 1ex \@minus .2ex},
    afterskip={1ex \@plus .2ex},
    format={\zihao{-4}\kaishu},
  },
  subsubsection={%
    beforeskip={3.25ex \@plus 1ex \@minus .2ex},
    afterskip={1ex \@plus.2ex},
    format={\zihao{-4}\bf\songti},
  },
  appendix={%
    number=\Alph{chapter},
  },
  contentsname={\hspace*{\fill}\scu@contentsname\hspace*{\fill}},
  listfigurename={\hspace*{\fill}\scu@listfigurename\hspace*{\fill}},
  listtablename={\hspace*{\fill}\scu@listtablename\hspace*{\fill}},
  bibname={\hspace*{\fill}\scu@bibname\hspace*{\fill}},
}
\ifscu@opt@chapc\ctexset{chapter/format=\centering}
\else\ctexset{chapter/format=\raggedright}\fi


% Setup appendix format
\let\scu@appendix\appendix
\renewenvironment{appendix}{%
  \let\title\scu@appendix@title
  \scu@appendix
  \ctexset{chapter/format=\raggedright}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \renewcommand\theequation{\Alph{section}.\arabic{equation}}
  \ctexset{chapter/nameformat+=\raggedright}
  \newlist{originbbl}{enumerate}{1}
  \setlist[originbbl]{label=[\arabic*],align=left,nosep,leftmargin=10mm,labelsep=!,itemsep=3bp,before={\vspace{0.5\baselineskip}\renewcommand{\baselinestretch}{1.3}\zihao{5}}}
}{\let\title\@gobble}
\let\title\@gobble
\newcommand{\scu@appendix@title}[1]{%
  \begin{center}
    \bfseries\zihao{-4} #1
  \end{center}}
% setup acknoledge format
\newenvironment{ack}{\chapter*{\hspace*{\fill}\scu@acknowledgement@pre\hspace*{\fill}}}{\addcontentsline{toc}{chapter}{\scu@acknowledgement@pre}\clearpage}

% toc
\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\filright\zihao{-3}\bf\songti}
              {\contentspush{\thecontentslabel\ }}
              {}{\titlerule*[6pt]{$\cdot$}\contentspage}
\titlecontents{section}[1em]{\addvspace{-3pt}\filright\zihao{4}\songti}
              {\contentspush{\thecontentslabel\ }}
              {}{\titlerule*[6pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[2em]{\addvspace{-3pt}\filright\zihao{-4}\kaishu}
              {\contentspush{\thecontentslabel\ }}
              {}{\titlerule*[6pt]{$\cdot$}\contentspage}

\let\scu@tableofcontents\tableofcontents
\def\scu@maketableofcontents{\ctexset{chapter/pagestyle={toc}}\clearpage\setcounter{page}{1}\pagenumbering{arabic}\pdfbookmark[0]{\scu@contentsname}{tableofcontents}\scu@tableofcontents\cleardoublepage}
\let\tableofcontents\scu@maketableofcontents

\let\scu@listoffigures\listoffigures
\def\scu@makelistoffigures{\clearpage\scu@listoffigures\addcontentsline{toc}{chapter}{\scu@listfigurename}}
\let\listoffigures\scu@makelistoffigures

\let\scu@listoftables\listoftables
\def\scu@makelistoftables{\clearpage\scu@listoftables\addcontentsline{toc}{chapter}{\scu@listtablename}}
\let\listoftables\scu@makelistoftables

\let\scu@bibliography\bibliography
\def\scu@makebibliography#1{\clearpage\scu@bibliography{#1}\addcontentsline{toc}{chapter}{\scu@bibname}}
\let\bibliography\scu@makebibliography

% Cover
\def\scu@define@term#1{%
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

\newlength\scu@titlelength
\def\scu@splittitlelines#1{%
    \begingroup
    \edef\@tempa{#1\space}
    \expandafter\endgroup
    \expandafter\scu@readtitlelines\@tempa\relax
}
\def\scu@readtitlelines#1 #2\relax{%
      & \hskip1pt\underline{\hb@xt@ 8cm{\hss#1\hss}}\hskip3pt
      \begingroup
      \ifx\relax#2\relax\def\next{\endgroup\\[.8cm]}
      \else\def\next{\endgroup\\[.3cm]\scu@readtitlelines#2\relax}%
      \fi\next}
\newcommand\scu@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\newcommand\scu@cover{%
  \pdfbookmark[-1]{\scu@ctitle@value}{ctitle}
  \begin{center}
  \vspace*{.1cm}
  \includegraphics[height=1.6cm]{./images/scu}\par\vskip1.35cm % Logo
  {\zhsong\zihao{1}\scu@bachelor@report@title}\par\vskip1.2cm      % Title
  \includegraphics[height=3.5cm]{./images/logo}\par\vskip0.4cm % Badge
  \setlength\scu@titlelength{\widthof{\bf\kaishu\scu@ctitle@value}}
  \newcolumntype{A}{>{\songti}r<{}}
  \newcolumntype{B}{>{\bf\kaishu}l<{}}
  \zihao{4}
  \begin{tabular}{AB}
    \ifthenelse{\lengthtest{\scu@titlelength < 200pt}}{%
      \scu@ctitle@pre & \scu@underline[8cm]\scu@ctitle@value\\[1.16cm]}{%
      \scu@ctitle@pre \scu@splittitlelines{\scu@ctitle@value}}
    \scu@cdepartment@pre & \scu@underline[8cm]\scu@cdepartment@value\\[1.16cm]
    \scu@cmajor@pre & \scu@underline[8cm]\scu@cmajor@value\\[1.16cm]
    \scu@cname@p  & \scu@underline[8cm]\scu@cname@value\\[1.16cm]
  \end{tabular}\\
  \begin{tabular}{ABAB}
    \scu@sid@pre & \scu@underline[3cm]\scu@sid@value 
    & \scu@session@pre & \scu@underline[3cm]\scu@session@value\\[1.0cm]
  \end{tabular}\\
  \begin{tabular}{AB}
    \scu@csupervisor@pre & \scu@underline[8cm]\scu@csupervisor@value\\[0.6cm]
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

\newcommand\makecover{%
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

\newcommand\scu@makeabstract{%
  \clearpage
  \thispagestyle{abstract}
  \pdfbookmark[0]{摘要}{cabstract}
  \begin{center}
  \vspace*{1.0cm}
  {\bf\songti\zihao{-2} \scu@ctitle@value}\par\vskip1.2cm
  {\kaishu\zihao{4} \scu@cmajor@value}\par\vskip.75cm
  {\kaishu\zihao{4} \scu@cname@pre\hskip.6cm  \scu@cname@value \hskip1cm \scu@csupervisor@pre\hskip.6cm  \scu@csupervisor@value}\par
  \end{center}\par\vskip1.1cm
  {\addtolength\leftskip{1.7cm}
  \addtolength\rightskip{.9cm}
  {\bf\kaishu\zihao{5} ［摘要］}\hskip.2cm{\kaishu\zihao{5}\scu@cabstract}\vskip1.3cm
  {\bf\kaishu\zihao{5} ［关键词］}\hskip.2cm{\kaishu\zihao{5}\scu@cabstract@key}
  \clearpage}
  % English Abstract
  \thispagestyle{abstract}
  \pdfbookmark[0]{Abstract}{eabstract}
  \begin{center}
  \vspace*{.75cm}
  {\bf\zihao{-2} \scu@etitle@value}\par\vskip1.5cm
  {\sf\zihao{4} \scu@emajor@value}\par\vskip.8cm
  {\sf\zihao{4} \scu@ename@pre : \scu@ename@value \hskip1cm \scu@esupervisor@pre : \scu@esupervisor@value}\par
  \end{center}\par\vskip1.1cm
  {\bf\zihao{5}[Abstract]}\hskip.2cm{\zihao{5}\scu@eabstract}\vskip1cm
  {\bf\zihao{5}[Key Words]}\hskip.2cm{\zihao{5}\scu@eabstract@key}\clearpage}

\newcommand\scu@makeannouncement{%
  \clearpage
  \chapter*{\hspace*{\fill}\scu@announcement@title\hspace*{\fill}}
  \addcontentsline{toc}{chapter}{\scu@announcement@title}
  \scu@announcement@text\\[3cm]

  \begin{flushright}
    \begin{tabular}{cc}
      \scu@announcement@sig@author & \scu@underline[3.5cm] { } \\[1.18cm]
      \scu@announcement@sig@supervisor & \scu@underline[3.5cm] { } \\[1.18cm]
    \end{tabular}\\
    \the\year{}年\hspace{1.5em}月\hspace{1.5em}日
  \end{flushright}
}

\newcommand\announcement\scu@makeannouncement

% Footer and Header
\fancypagestyle{plain}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot{}\fancyfoot[RO,LE]{\zihao{-5} \thepage}
}
\fancypagestyle{abstract}{%
  \fancyfoot{}
  \fancyfoot[R]{\zihao{-5} \thepage}
}
\fancypagestyle{toc}{%
  \fancyhf{}
  \fancyhead[L]{\zihao{5} \scu@report@name}
  \fancyhead[R]{\zihao{5} \scu@ctitle@value}
}
\pagestyle{fancy}
\fancyhead{} %clear all fields
\fancyhead[L]{\zihao{5} \scu@report@name}
\fancyhead[R]{\zihao{5} \scu@ctitle@value}
\fancyfoot{}\fancyfoot[RO,LE]{\zihao{-5} \thepage}
% Bib Style
\setlength{\bibsep}{0ex}

\AtEndOfClass{\input{scuthesis.cfg}}
%%
%% End of file `scuthesis.cls'.
