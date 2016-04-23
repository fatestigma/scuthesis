%% scuthesis.bst v0.1
%% Copyright 2016 Xi Jin <fate.stigma@gmail.com>
%
% This work is a fork of gbt7714-2015.bst(v2.1.1) by Haixing Hu and made
% for meeting the requirements of SCU.
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

ENTRY
{
  author
  editor
  translator
  title
  edition
  address
  publisher
  pages
  year
  date
  modifydate
  citedate
  url
  doi
  language
  booktitle
  journal
  chapter
  series
  volume
  number
  version
  month
  school
  institution
  organization
  type
  howpublished
  eid
  key
  country
  patentid
  media
} {
  required
} {
  label
  mark


}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

INTEGERS {
  entry.count
  longest.label.width
  i
  j
  k
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

STRINGS {
  longest.label
  s
  t
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define global static constants
FUNCTION {true}                 {#1}
FUNCTION {false}                {#0}
FUNCTION {debug.enabled}        {true}
FUNCTION {cap.volume.en}        {"Vol~"}
FUNCTION {cap.volume.zh}        {"卷"}
FUNCTION {cap.edition.en}       {"~ed"}
FUNCTION {cap.edition.zh}       {"版"}
FUNCTION {cap.anonymous.en}     {"Anon"}
FUNCTION {cap.anonymous.zh}     {"佚名"}
FUNCTION {cap.no.address.en}    {"[S.l.]"}
FUNCTION {cap.no.address.zh}    {"[出版地不详]"}
FUNCTION {cap.no.publisher.en}  {"[s.n.]"}
FUNCTION {cap.no.publisher.zh}  {"[出版者不详]"}
FUNCTION {cap.et.al.en}         {", et~al"}
FUNCTION {cap.et.al.zh}         {", 等"}
FUNCTION {cap.translate.en}     {"~trans"}
FUNCTION {cap.translate.zh}     {"译"}
FUNCTION {cap.doi.url}          {"http://dx.doi.org/"}
FUNCTION {cap.st.en}            {"st"}
FUNCTION {cap.nd.en}            {"nd"}
FUNCTION {cap.rd.en}            {"rd"}
FUNCTION {cap.th.en}            {"th"}

FUNCTION {cap.space}            {" "}
FUNCTION {cap.period}           {"\@. "}
FUNCTION {cap.comma}            {"\@, "}
FUNCTION {cap.colon}            {"\thinspace{}\textnormal{: }"}
FUNCTION {cap.double.slash}     {" //\thinspace{}"}
FUNCTION {cap.slash}            {" /\thinspace{}"}
FUNCTION {cap.dash}             {"\thinspace{}\textnormal{--}\thinspace{}"}
FUNCTION {env.bibbegin}         { "\begin{thebibliography}" }
FUNCTION {env.bibend}           { "\end{thebibliography}" }
FUNCTION {cmd.bibauthor}        { "\providecommand{\bibauthor}[1]{#1}" }
FUNCTION {cmd.bibeditor}        { "\providecommand{\bibeditor}[1]{#1}" }
FUNCTION {cmd.bibtranslator}    { "\providecommand{\bibtranslator}[1]{#1}" }
FUNCTION {cmd.bibtitle}         { "\providecommand{\bibtitle}[1]{#1}" }
FUNCTION {cmd.bibbooktitle}     { "\providecommand{\bibbooktitle}[1]{#1}" }
FUNCTION {cmd.bibjournal}       { "\providecommand{\bibjournal}[1]{#1}" }
FUNCTION {cmd.bibmark}          { "\providecommand{\bibmark}[1]{#1}" }
FUNCTION {cmd.bibcountry}       { "\providecommand{\bibcountry}[1]{#1}" }
FUNCTION {cmd.bibpatentid}      { "\providecommand{\bibpatentid}[1]{#1}" }
FUNCTION {cmd.bibedition}       { "\providecommand{\bibedition}[1]{#1}" }
FUNCTION {cmd.biborganization}  { "\providecommand{\biborganization}[1]{#1}" }
FUNCTION {cmd.bibaddress}       { "\providecommand{\bibaddress}[1]{#1}" }
FUNCTION {cmd.bibpublisher}     { "\providecommand{\bibpublisher}[1]{#1}" }
FUNCTION {cmd.bibinstitution}   { "\providecommand{\bibinstitution}[1]{#1}" }
FUNCTION {cmd.bibschool}        { "\providecommand{\bibschool}[1]{#1}" }
FUNCTION {cmd.bibvolume}        { "\providecommand{\bibvolume}[1]{#1}" }
FUNCTION {cmd.bibnumber}        { "\providecommand{\bibnumber}[1]{#1}" }
FUNCTION {cmd.bibversion}       { "\providecommand{\bibversion}[1]{#1}" }
FUNCTION {cmd.bibpages}         { "\providecommand{\bibpages}[1]{#1}" }
FUNCTION {cmd.bibmodifydate}    { "\providecommand{\bibmodifydate}[1]{#1}" }
FUNCTION {cmd.bibcitedate}      { "\providecommand{\bibcitedate}[1]{#1}" }
FUNCTION {cmd.bibyear}          { "\providecommand{\bibyear}[1]{#1}" }
FUNCTION {cmd.bibdate}          { "\providecommand{\bibdate}[1]{#1}" }
FUNCTION {cmd.biburl}           { "\providecommand{\biburl}[1]{\newline\url{#1}}" }

FUNCTION {log.str} {
  debug.enabled {
    "DEBUG: " swap$ * " - '" *
    swap$ *
    "'" *
    top$
  } {
    pop$ pop$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {log.int} {
  debug.enabled {
    "DEBUG: " swap$ * " - " *
    swap$ int.to.str$ *
    top$
  } {
    pop$ pop$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {not} {
  {
    false
  } {
    true
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {and} {
  {
    skip$
  } {
    pop$ false
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {or} {
  {
    pop$ true
  } {
    skip$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



INTEGERS {length.i}
FUNCTION {length} {
  duplicate$ empty$ {
    pop$ #0
  } {
    #1 'length.i :=
    false
    {not} {
      duplicate$ length.i #1 substring$
      "" = {
        true
      } {
        length.i #1 + 'length.i :=
        false
      } if$
    } while$
    pop$ length.i #1 -
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {is.digit} {
  chr.to.int$
  duplicate$ "0" chr.to.int$ < {
    pop$ false
  } {
    "9" chr.to.int$ > {
      false
    } {
      true
    } if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {is.number} {
  duplicate$ empty$ not swap$
  { duplicate$ empty$ not} {
    duplicate$ #1 #1 substring$ is.digit {
      #2 global.max$ substring$
    } {
      pop$ pop$ false
      ""
    } if$
  } while$
  pop$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {extract.number} {
  duplicate$
  duplicate$ length swap$
  duplicate$ empty$
  { not } {
    duplicate$ #1 #1 substring$ is.digit {
      #2 global.max$ substring$
      duplicate$ empty$
    } {
      true
    } if$
  } while$
  length -
  #1 swap$ substring$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {get.last.chr} {
  duplicate$ length
  duplicate$ #0 = {
    pop$
  } {
    #1 substring$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {get.ordinal.suffix.en} {
  duplicate$ "1" = {
    pop$ cap.st.en
  } {
    duplicate$ "2" = {
      pop$ cap.nd.en
    } {
      duplicate$ "3" = {
        pop$ cap.rd.en
      } {
        pop$ cap.th.en
      } if$
    } if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {num.to.ordinal.en} {
  duplicate$ empty$ {
    skip$
  } {
    duplicate$ get.last.chr
    get.ordinal.suffix.en
    *
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

STRINGS {remove.dots.result}

FUNCTION {remove.dots} {
  "" 'remove.dots.result :=
  { duplicate$ empty$ not } {
    duplicate$ #1 #2 substring$
    "\." = {
      #3 global.max$ substring$
    } {
      duplicate$ #1 #1 substring$
      duplicate$ "." = {
        pop$ #2 global.max$ substring$
      } {
        remove.dots.result swap$ *
        'remove.dots.result :=
        #2 global.max$ substring$
      } if$
    } if$
  } while$
  pop$ remove.dots.result
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {is.in.chinese} {
  language empty$ {
    false
  } {
    language "zh" = {
      true
    } {
      false
    } if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {add.brace} {
  "{" swap$ * "}" *
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {add.bracket} {
  is.in.chinese {
    "（" swap$ * "）" *
  } {
    "(" swap$ * ")" *
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {add.squarebracket} {
  "[" swap$ * "]" *
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {add.textit} {
  "\textit{" swap$ * "}" *
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {add.textbf} {
  "\textbf{" swap$ * "}" *
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {contain.dash} {
  false swap$
  { duplicate$ empty$ not} {
    duplicate$ #1 #1 substring$ "-" = {
      pop$ pop$ true
      ""
    } {
      #2 global.max$ substring$
    } if$
  } while$
  pop$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


FUNCTION {extract.before.first.dash} {
  duplicate$
  duplicate$ length swap$
  duplicate$ empty$
  { not } {
    duplicate$ #1 #1 substring$ "-" = {
      true
    } {
      #2 global.max$ substring$
      duplicate$ empty$
    } if$
  } while$
  length -
  #1 swap$ substring$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


FUNCTION {extract.after.first.dash} {
  duplicate$
  duplicate$ empty$
  { not } {
    duplicate$ #1 #1 substring$ "-" = {
      true
    } {
      #2 global.max$ substring$
      duplicate$ empty$
    } if$
  } while$
  duplicate$ empty$ {
    pop$
  } {
    swap$ pop$ #2 global.max$ substring$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


FUNCTION {extract.after.last.dash} {
  duplicate$ contain.dash not {
    pop$ ""
  } {
    {duplicate$ contain.dash} {
      extract.after.first.dash
    } while$

  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {trim.start} {
  {duplicate$ #1 #1 substring$ " " =} {
    #2 global.max$ substring$
  } while$

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {trim.end} {
  {duplicate$ get.last.chr " " =} {
    duplicate$ length #1 -
    #1 swap$ substring$
  } while$

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {trim} {
  trim.start
  trim.end
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {start.bibitem} {
  newline$
  "\bibitem{" cite$ * "}" * write$
  newline$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {end.bibitem} {
  cap.period write$
  newline$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {is.online} {
  url empty$ not {
    true
  } {
    doi empty$ not {
      true
    } {
      false
    } if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {set.mark} {
  'mark :=
  is.online {
    mark "/OL" * 'mark :=
  } {
    media empty$ not {
      mark "/" * media * 'mark :=
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {cap.volume} {
  is.in.chinese {
    cap.volume.zh
  } {
    cap.volume.en
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {cap.edition} {
  is.in.chinese {
    cap.edition.zh
  } {
    cap.edition.en
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {cap.anonymous} {
  is.in.chinese {
    cap.anonymous.zh
  } {
    cap.anonymous.en
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {cap.no.address} {
  is.in.chinese {
    cap.no.address.zh
  } {
    cap.no.address.en
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {cap.no.publisher} {
  is.in.chinese {
    cap.no.publisher.zh
  } {
    cap.no.publisher.en
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {cap.et.al} {
  is.in.chinese {
    cap.et.al.zh
  } {
    cap.et.al.en
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {cap.translate} {
  is.in.chinese {
    cap.translate.zh
  } {
    cap.translate.en
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.bibinfo} {
  swap$ add.brace swap$
  "\bib" swap$ * swap$ *
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
INTEGERS { nameindex namecount }
STRINGS  { namelist nameformat }
STRINGS  { firstname lastname jrname vonname}

FUNCTION {format.names} {
  'namelist :=
  namelist num.names$ 'namecount :=
  ""
  #0 'nameindex :=
  {nameindex namecount < nameindex #3 < and} {
    nameindex #1 + 'nameindex :=
    nameindex #1 > {
      cap.comma *
    } 'skip$ if$
    namelist nameindex "{vv}" format.name$
   'vonname :=
    namelist nameindex "{jj}" format.name$
    remove.dots 'jrname :=
    namelist nameindex "{f}" format.name$
    remove.dots
    "u" change.case$ 'firstname :=
    namelist nameindex "{ll}" format.name$
    "u" change.case$ 'lastname :=
    jrname empty$ not {
      jrname * " " *
    } 'skip$ if$
    vonname empty$ not {
      vonname * " " *
    } 'skip$ if$
    lastname empty$ not {
      lastname * " " *
    } 'skip$ if$
    firstname empty$ not {
      firstname * " " *
    } 'skip$ if$
    trim.end
  } while$
  nameindex namecount < {
    cap.et.al *
  } 'skip$ if$
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.names.en} {
  format.names
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.names.zh} {
  format.names
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.author} {
  is.in.chinese {
    format.names.zh
  } {
    format.names.en
  } if$
  "author" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.editor} {
  is.in.chinese {
    format.names.zh
  } {
    format.names.en
  } if$
  "editor" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.translator} {
  is.in.chinese {
    duplicate$
    format.names.zh
    swap$ num.names$ #3 > {
      cap.translate.zh *
    } {
      cap.comma * cap.translate.zh *
    } if$
  } {
    duplicate$
    format.names.en
    swap$ num.names$ #3 > {
      cap.translate.en *
    } {
      cap.comma * cap.translate.en *
    } if$
  } if$
  "translator" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.title} {
  "title" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.booktitle} {
  "booktitle" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.mark} {
  "[" swap$ * "]" *
  "mark" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.country} {
  "country" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.patentid} {
  "patentid" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.edition} {
  duplicate$ is.number {
    is.in.chinese {
      cap.edition.zh *
    } {
      num.to.ordinal.en cap.edition.en *
    } if$
  } 'skip$ if$

  "\mbox{" swap$ * "}" *
  "edition" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.organization} {
  "organization" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.address} {
  "address" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.publisher} {
  "publisher" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.institution} {
  "institution" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.school} {
  "school" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.year} {
  "year" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.date} {
  "date" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.journal} {
  "journal" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.volume} {
  "volume" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.number} {
  add.bracket
  "number" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.report.number} {
  "number" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.version} {
  "version" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.pages} {
  "pages" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.modifydate} {
  "modifydate" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {format.citedate} {
  "citedate" format.bibinfo
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




FUNCTION {format.url} {
  "\newline\url{" swap$ * "}" *
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {get.full.title} {
  series empty$ {
    volume empty$ {
      title
    } {
      title cap.colon * cap.volume * volume *
    } if$
  } {
    volume empty$ {
      series cap.colon * title *
    } {
      series cap.comma * cap.volume * volume *
      cap.colon * title *
    } if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {get.full.booktitle} {
  series empty$ {
    volume empty$ {
      booktitle
    } {
      booktitle cap.colon * cap.volume * volume *
    } if$
  } {
    volume empty$ {
      series cap.colon * booktitle *
    } {
      series cap.comma * cap.volume * volume *
      cap.colon * booktitle *
    } if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {get.pages} {
  pages contain.dash {
    pages extract.before.first.dash
    pages extract.after.last.dash
    cap.dash swap$ * *
  } {
    pages
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.author.or.editor} {
  'required :=
  author empty$ not {
    author format.author write$
    cap.period write$
  } {
    editor empty$ not {
      editor format.editor write$
      cap.period write$
    } {
      required {
        "Require author/editor: " cite$ * warning$
        cap.anonymous format.author write$
        cap.period write$
      } 'skip$ if$
    } if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.author} {
  'required :=
  author empty$ not {
    author format.author write$
    cap.period write$
  } {
    required {
      "Require author: " cite$ * warning$
      cap.anonymous format.author write$
      cap.period write$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.editor} {
  'required :=
  editor empty$ not {
    editor format.editor write$
    cap.period write$
  } {
    required {
      "Require editor: " cite$ * warning$
      cap.anonymous format.editor write$
      cap.period write$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.title} {
  'required :=
  title empty$ not {
    title format.title write$
  } {
    required {
      "Require title: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.series.volume.title} {
  'required :=
  title empty$ not {
    get.full.title format.booktitle write$
  } {
    required {
      "Require title: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.series.volume.booktitle} {
  'required :=
  booktitle empty$ not {
    get.full.booktitle format.booktitle write$
  } {
    required {
      "Require booktitle: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.journal} {
  'required :=
  journal empty$ not {
    cap.period write$
    journal format.journal write$
  } {
    required {
      "Require journal: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.mark} {
  'required :=
  mark empty$ not {
    mark format.mark write$
  } {
    required {
      "Require mark: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.translator} {
  'required :=
  translator empty$ not {
    cap.period write$
    translator format.translator write$
  } {
    required {
      "Require translator: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.edition} {
  'required :=
  edition empty$ not {
    cap.period write$
    edition format.edition write$
  } {
    required {
      "Require edition: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.address} {
  'required :=
  address empty$ not {
    cap.period write$
    address format.address write$
  } {
    required {
      "Require address: " cite$ * warning$
      cap.period write$
      cap.no.address format.address write$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.publisher} {
  'required :=
  publisher empty$ not {
    cap.colon write$
    publisher format.publisher write$
  } {
    required {
      "Require publisher: " cite$ * warning$
      cap.colon write$
      cap.no.publisher format.publisher write$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.publisher.no.address} {
  'required :=
  publisher empty$ not {
    cap.period write$
    publisher format.publisher write$
  } {
    required {
      "Require publisher: " cite$ * warning$
      cap.period write$
      cap.no.publisher format.publisher write$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.school} {
  'required :=
  school empty$ not {
    cap.colon write$
    school format.school write$
  } {
    required {
      "Require school: " cite$ * warning$
      cap.colon write$
      cap.no.publisher format.school write$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.institution} {
  'required :=
  institution empty$ not {
    cap.colon write$
    institution format.institution write$
  } {
    required {
      "Require institution: " cite$ * warning$
      cap.colon write$
      cap.no.publisher format.institution write$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.year} {
  'required :=
  year empty$ not {
    year format.year write$
  } {
    required {
      "Require year: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.pages} {
  'required :=
  pages empty$ not {
    cap.colon write$
    get.pages format.pages write$
  } {
    required {
      "Require pages: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.modifydate} {
  'required :=
  modifydate empty$ not {
    cap.space write$
    modifydate format.modifydate write$
  } {
    required {
      "Require modifydate: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.citedate} {
  'required :=
  citedate empty$ not {
    cap.slash write$
    citedate format.citedate write$
  } {
    required is.online or {
      "Require citedate: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.date} {
  'required :=
  date empty$ not {
    date format.date write$
  } {
    required {
      "Require date: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.volume} {
  'required :=
  volume empty$ not {
    cap.comma write$
    volume format.volume write$
  } {
    required {
      "Require volume: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.number} {
  'required :=
  number empty$ not {
    number format.number write$
  } {
    required {
      "Require number: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.report.number} {
  'required :=
  number empty$ not {
    cap.colon write$
    number format.report.number write$
  } {
    required {
      "Require number: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.country} {
  'required :=
  country empty$ not {
    cap.colon write$
    country format.country write$
  } {
    required {
      "Require country: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.patentid} {
  'required :=
  patentid empty$ not {
    cap.comma write$
    patentid format.patentid write$
  } {
    required {
      "Require patentid: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.start.year} {
  'required :=
  year empty$ not {
    year extract.before.first.dash
    format.year write$
  } {
    required {
      "Require year: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.start.volume} {
  'required :=
  volume empty$ not {
    cap.comma write$
    volume extract.before.first.dash
    format.volume write$
  } {
    required {
      "Require volume: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.start.number} {
  'required :=
  number empty$ not {
    number extract.before.first.dash
    format.number write$
  } {
    required {
      "Require number: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.end.year} {
  'required :=
  year empty$ not {
    year extract.after.last.dash
    format.year write$
  } {
    required {
      "Require year: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.end.volume} {
  'required :=
  volume empty$ not {
    cap.comma write$
    volume extract.after.last.dash
    format.volume write$
  } {
    required {
      "Require volume: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.end.number} {
  'required :=
  number empty$ not {
    number extract.after.last.dash
    format.number write$
  } {
    required {
      "Require number: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.url.or.doi} {
  'required :=
  url empty$ not {
    cap.period write$
    url format.url write$
  } {
    doi empty$ not {
      cap.period write$
      cap.doi.url doi * format.url write$
    } {
      required {
        "Require URL or DOI: " cite$ * warning$
      } 'skip$ if$
    } if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.url} {
  'required :=
  url empty$ not {
    cap.period write$
    url format.url write$
  } {
    required {
      "Require URL: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {output.version} {
  'required :=
  version empty$ not {
    cap.period write$
    version format.version write$
  } {
    required {
      "Require version: " cite$ * warning$
    } 'skip$ if$
  } if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {book.impl} {
  start.bibitem
  true output.author.or.editor
  true output.series.volume.title
  true output.mark
  false output.translator
  false output.edition
  publisher empty$ not {
    true output.address
    true output.publisher
    cap.comma write$
  } {
    cap.period write$
  } if$
  true output.year
  false output.pages
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {book} {
  "M" set.mark
  book.impl
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {collection} {
  "G" set.mark
  book.impl
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {proceedings} {
  "C" set.mark
  start.bibitem
  true output.editor
  true output.series.volume.title
  true output.mark
  false output.translator
  false output.edition
  publisher empty$ not {
    true output.address
    true output.publisher
    cap.comma write$
  } {
    cap.period write$
  } if$
  true output.year
  false output.pages
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {conference} {
  proceedings
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {thesis.impl} {
  start.bibitem
  true output.author
  true output.title
  true output.mark
  false output.translator
  true output.address
  true output.school
  cap.comma write$
  true output.year
  false output.pages
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {phdthesis} {
  "D" set.mark
  thesis.impl
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {masterthesis} {
  "D" set.mark
  thesis.impl
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {bachelorthesis} {
  "D" set.mark
  thesis.impl
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {techreport} {
  "R" set.mark
  start.bibitem
  true output.author
  true output.title
  false output.report.number
  true output.mark
  false output.translator
  false output.edition
  false output.version
  institution empty$ not {
    true output.address
    true output.institution
    cap.comma write$
  } {
    cap.period write$
  } if$
  true output.year
  false output.pages
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {standard} {
  "S" set.mark
  start.bibitem
  false output.author
  true output.title
  true output.mark
  false output.translator
  false output.edition
  publisher empty$ not {
    true output.address
    true output.publisher
    cap.comma write$
  }'skip$ if$
  false output.year
  false output.pages
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {reference} {
  "K" set.mark
  start.bibitem
  false output.author.or.editor
  true output.series.volume.title
  true output.mark
  false output.translator
  false output.edition
  publisher empty$ not {
    true output.address
    true output.publisher
    cap.comma write$
  } {
    cap.period write$
  } if$
  true output.year
  false output.pages
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {manual} {
  reference
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {periodical.impl} {
  start.bibitem
  false output.editor
  true output.title
  true output.mark
  cap.period write$
  true output.start.year
  false output.start.volume
  false output.start.number
  cap.dash write$
  year contain.dash {
    true output.end.year
    false output.end.volume
    false output.end.number
  } 'skip$ if$
  publisher empty$ not {
    true output.address
    true output.publisher
    cap.comma write$
  } {
    cap.period write$
  } if$
  true output.start.year
  cap.dash write$
  year contain.dash {
    true output.end.year
  } 'skip$ if$
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {periodical} {
  "J" set.mark
  periodical.impl
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {newspaper} {
  "N" set.mark
  periodical.impl
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {patent} {
  "P" set.mark
  start.bibitem
  true output.author
  true output.title
  true output.country
  true output.patentid
  true output.mark
  cap.period write$
  true output.date
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {online} {
  "EB" set.mark
  start.bibitem
  false output.author
  true output.title
  true output.mark
  publisher empty$ not {
    address empty$ not {
      true output.address
      true output.publisher
      cap.comma write$
    } {
      true output.publisher.no.address
      cap.comma write$
    } if$
  } 'skip$ if$
  false output.year
  true output.url
  cap.comma write$
  false output.modifydate
  true output.citedate
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {webpage} {
  online
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {program.impl} {
  start.bibitem
  false output.author
  true output.title
  true output.mark
  publisher empty$ not {
    true output.address
    true output.publisher
    cap.comma write$
  } {
    cap.period write$
  } if$
  true output.year
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {program} {
  "CP" set.mark
  program.impl
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {database} {
  "DB" set.mark
  program.impl
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {unpublished} {
  "H" set.mark
  start.bibitem
  true output.author
  true output.title
  true output.mark
  cap.period write$
  true output.year
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {manuscript} {
  unpublished
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {inbook.impl.head} {
  start.bibitem
  true output.author
  true output.title
  false output.mark
  false output.translator
  cap.period write$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {inbook.impl.tail} {
  false output.editor
  true output.series.volume.booktitle
  false output.edition
  publisher empty$ not {
    true output.address
    true output.publisher
    cap.comma write$
  } {
    cap.period write$
  } if$
  true output.year
  false output.pages
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {inbook} {
  inbook.impl.head
  "见:" write$
  inbook.impl.tail
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {incollection} {
  "A" set.mark
  inbook.impl.head
  inbook.impl.tail
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {inproceedings} {
  "A" set.mark
  inbook.impl.head
  inbook.impl.tail
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {article} {
  "J" set.mark
  start.bibitem
  true output.author
  true output.title
  true output.mark
  true output.journal
  cap.comma write$
  true output.year
  false output.volume
  false output.number
  false output.pages
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {news} {
  "N" set.mark
  start.bibitem
  true output.author
  true output.title
  true output.mark
  true output.journal
  cap.comma write$
  true output.date
  false output.number
  false output.citedate
  false output.url.or.doi
  end.bibitem
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {default.type} {
  "Unsupported entry type for " cite$ * warning$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {longest.label.pass} {
  entry.count #1 + 'entry.count :=
  entry.count int.to.str$ 'label :=
  label width$ longest.label.width > {
    label 'longest.label :=
    label width$ 'longest.label.width :=
  } 'skip$ if$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {write.style.commands} {
  cmd.bibauthor write$
  newline$
  cmd.bibeditor write$
  newline$
  cmd.bibtranslator write$
  newline$
  cmd.bibtitle write$
  newline$
  cmd.bibbooktitle write$
  newline$
  cmd.bibjournal write$
  newline$
  cmd.bibmark write$
  newline$
  cmd.bibcountry write$
  newline$
  cmd.bibpatentid write$
  newline$
  cmd.bibedition write$
  newline$
  cmd.biborganization write$
  newline$
  cmd.bibaddress write$
  newline$
  cmd.bibpublisher write$
  newline$
  cmd.bibinstitution write$
  newline$
  cmd.bibschool write$
  newline$
  cmd.bibvolume write$
  newline$
  cmd.bibnumber write$
  newline$
  cmd.bibversion write$
  newline$
  cmd.bibpages write$
  newline$
  cmd.bibmodifydate write$
  newline$
  cmd.bibcitedate write$
  newline$
  cmd.bibyear write$
  newline$
  cmd.bibdate write$
  newline$
  cmd.biburl write$
  newline$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {begin.bib} {
  preamble$ empty$ not {
    preamble$ write$
    newline$
  } 'skip$ if$
  env.bibbegin write$
  "{" longest.label * "}" * write$
  newline$
  write.style.commands
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {end.bib} {
  newline$
  env.bibend write$
  newline$
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {initialize} {
  #0 'entry.count :=
  #0 'longest.label.width :=
  "" 'longest.label :=
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

READ
EXECUTE {initialize}
ITERATE {longest.label.pass}
EXECUTE {begin.bib}
ITERATE {call.type$}
EXECUTE {end.bib}
%% End of file `scuthesis.bst'
