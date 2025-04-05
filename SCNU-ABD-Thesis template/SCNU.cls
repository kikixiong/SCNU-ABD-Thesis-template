% Author：Jiaqi Xiong
% Email：yoshiki.xiong@outlook.com


\ProvidesClass{SCNU}[2025/04/05 v0.1 Thesis Class of South China Normal University Aberdeen Institute]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\SetupKeyvalOptions{family=SCNU, prefix=SCNU@, setkeys=\kvsetkeys}
\newcommand{\ckv}[1]{\kvsetkeys{SCNU}{#1}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article}

% 设置纸张格式
\RequirePackage[
  a4paper,
  left=3cm,right=2.3cm,top=2.3cm,bottom=2.6cm,
  headheight=10cm,
  headsep=0.3cm]{geometry}
\setlength{\headsep}{0.6cm}

\RequirePackage{amsthm,amsmath,amssymb,indentfirst,booktabs,multicol,multirow,xcolor,graphicx,fancyhdr,hologo}

% 设置目录与引用的超链接（需要编译多次）
\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=false,linkcolor={blue},urlcolor={blue},filecolor={blue},citecolor={blue},
  linktoc=all,
}

%%%%%%%%%%%%%%%%%%%%%% 字体与段落 %%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[UTF8,scheme=plain]{ctex}
\setmainfont{Times New Roman}

% 1.25倍行距
\linespread{1.25}

% 段落缩进4字符
\setlength\parindent{4\ccwd}

%%%%%%%%%%%%%%%%%%%%%% 引用格式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{gbt7714}
\bibliographystyle{gbt7714-numerical}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\zihao{5}}
\renewcommand\refname{REFERENCES}

% \renewcommand\figurename{图}
% \renewcommand\tablename{表}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{onespace}{~~}
\captionsetup[table]{skip=8pt,labelsep=onespace}
\captionsetup[figure]{skip=8pt,labelsep=onespace}

\renewcommand{\captionfont}{\songti\zihao{5}}

% 图表与公式编号
% 采用阿拉伯数字编号：第一层标题显示“1.1”，第二层显示“1.1.1”
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% 设置计数器依赖
\@addtoreset{subsection}{section}
\@addtoreset{subsubsection}{subsection}

\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{equation}{section}
% \counterwithin{subsection}{section}
% \counterwithin{subsubsection}{subsection}
\renewcommand{\thefigure}{\thesection-\arabic{figure}}
\renewcommand{\thetable}{\thesection-\arabic{table}}
\renewcommand{\theequation}{\thesection-\arabic{equation}}

\newcommand{\appendixformat}{
  \renewcommand\figurename{Figure}
  \renewcommand\tablename{Table}
  \setcounter{figure}{0}               % 重置图表计数器
  \setcounter{table}{0}                % 重置表格计数器
  \renewcommand{\thefigure}{\arabic{figure}}
  \renewcommand{\thetable}{\arabic{table}}
}

%%%%%%%%%%%%%%%%%%%%%% code style %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{listings}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

\lstdefinestyle{defaultstyle}{
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breaklines=true,
    keepspaces=true,
    tabsize=2,
    frame=single,
}
\lstset{style=defaultstyle}

%%%%%%%%%%%%%%%%%%%%%% 摘要与关键词 %%%%%%%%%%%%%%%%%%%%%%

% 中文摘要环境
\renewenvironment{abstract}{
  \clearpage\phantomsection
  \begin{center}
    \vspace*{-10pt}
    \zihao{-2}\heiti{摘\hspace{2em}要} % 小二号黑体，中间空两格
    \vspace{8pt}
  \end{center}
  \addcontentsline{toc}{section}{摘~~~~要}
  \zihao{-4}\songti % 小四号宋体
  \setlength{\parindent}{4\ccwd} % 段落缩进4字符
  \ignorespaces
  \indent\ignorespaces    % 手动添加首行缩进
}{\clearpage}

% 英文摘要环境
\newenvironment{abstractEN}{
  \clearpage\phantomsection
  \begin{center}
    \vspace*{-10pt}
    \zihao{-2}\rmfamily\bfseries{ABSTRACT} % 小二号Times New Roman
    \vspace{8pt}
  \end{center}
  \addcontentsline{toc}{section}{ABSTRACT}
  \zihao{-4}\rmfamily % 小四号Times New Roman
  \setlength{\parindent}{4\ccwd} % 段落缩进4字符
  \ignorespaces
  \indent\ignorespaces   % 手动添加首行缩进
}{\clearpage}

% 英文关键词命令
\newcommand{\keywordsEN}[1]{
  \vspace{1\baselineskip}
  \noindent{\rmfamily\bfseries Key Words: }#1 
}
%中文关键词
\newcommand{\keywords}[1]{
  \vspace{1\baselineskip}
  \noindent{\rmfamily\bfseries 关键词: }#1 
}

%%%%%%%%%%%%%%%%%%%%%% 章节标题样式 %%%%%%%%%%%%%%%%%%%%%%
\let\section\relax
\let\subsection\relax
\let\subsubsection\relax
\let\paragraph\relax
\let\subparagraph\relax


\RequirePackage{setspace,titlesec,titletoc}


\titleformat{\section}
{\centering\zihao{-2}}{}{0pt}{\bfseries\rmfamily}
\titlespacing*{\section}{0pt}{2\baselineskip}{1\baselineskip} 

\titleformat{\subsection}
{\zihao{4}\bfseries\rmfamily\raggedright} 
{\thesubsection\hspace{1em}}{0pt}{}

\titleformat{\subsubsection}
{\zihao{-4}\bfseries\rmfamily\raggedright} 
{\thesubsubsection\hspace{1em}}{0pt}{}

%%%%%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%
\renewcommand\contentsname{\centering \zihao{3} 目~~~~录}
% \renewcommand\contentsname{\centering \zihao{3} TABLE OF CONTENTS}

% --- 一级目录(如 ABSTRACT, PREFACE, MAIN BODY, CONCLUSION, REFERENCES, APPENDIX) ---
\titlecontents{section}[0pt]                       % 左侧缩进
  {\addvspace{6pt}\bfseries\rmfamily\zihao{-4}}    % 整体样式：段前空6pt，黑体，罗马字体，小四号
    {}                                             % 去掉编号标签
    {\hspace*{-0em}}                               % 补偿缩进
    {\titlerule*[0.5em]{.}\contentspage}           % 用点线引导到页码

% --- 二级目录(如 1.1 节标题, 2.1 节标题 等) ---
\titlecontents{subsection}[7em]                    % 左侧缩进2em
  {\rmfamily\zihao{-4}}                            % 整体样式：罗马字体，小四号
  {\contentslabel{3em}}                             % 标号宽度3em
  {}                                               % 标号后无额外内容
  {\titlerule*[0.5em]{.}\contentspage}             % 用点线引导到页码

% --- 三级目录(如 1.1.1 小节标题) ---
\titlecontents{subsubsection}[7em]                 % 左侧缩进4em
  {\rmfamily\zihao{-4}}                            % 整体样式：罗马字体，小四号
  {\contentslabel{3em}}                             % 标号宽度4em
  {}                                               % 标号后无额外内容
  {\titlerule*[0.5em]{.}\contentspage}             % 用点线引导到页码
%%%%%%%%%%%%%%%%%%%%%% 命令封装 %%%%%%%%%%%%%%%%%%%%%%

\newenvironment{references}{\clearpage\phantomsection\addcontentsline{toc}{section}{REFERENCES}}{\clearpage}


\newcommand{\contentpage}{
  \begin{spacing}{1.25}      % 1.25倍行距
    \tableofcontents
  \end{spacing}
  \clearpage
  \renewcommand{\headrulewidth}{1.0pt}
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

\newcommand{\nonumsection}[1]{
  \clearpage\phantomsection
  \section*{#1}
  \stepcounter{section}
  \addcontentsline{toc}{section}{#1}
}


%%%%%%%%%%%%%%%%%%%%%% 封面 %%%%%%%%%%%%%%%%%%%%%%

\newcommand{\dunderline}[3][-6pt]{{
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}
}}

\newcommand{\infobox}[2]{
    \hspace{2.4cm}\songti\zihao{-2}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[8cm][c]{#2}}}}
}



\newcommand{\coverpage}{
  \begin{titlepage}
    \vspace*{-10pt}
  
    \vspace*{2\ccwd}
  
    \centering
    \includegraphics{south_china_normal_university_icon.jpg}
    \centering
    \zihao{-0}\textbf{\songti{毕\hphantom{空}业\hphantom{空}论\hphantom{空}文}}
    \vspace{2.5cm}
  
    \zihao{-2}\textbf{\heiti\thesisTitle}
    \vspace{2.5cm}
  
    \flushleft
    \linespread{1.5}
    \zihao{3}\rmfamily % 三号Times New Roman
  
    \begin{spacing}{1.5}
        \infobox{学生姓名}{\yourName}
  
        \infobox{学\hphantom{空白}号}{\studentID}
  
        \infobox{专业班级}{\yourClass}
  
        \infobox{指导教师}{\yourMentor}
        
        \infobox{完成日期}{\songti{\zhtoday}}
  
        % \infobox{指导教师}{\yourMentor}
    \end{spacing}
  
    \vspace{3cm}

    \centering
    % \zihao{-2}\ziju{0.5}\textbf{\songti{华南师范大学}}
  
    % \zihao{-2}\ziju{0.5}\textbf{\songti{\zhtoday}}
  \end{titlepage}
  
  % \pagestyle{ThesisMain}
  \pagenumbering{Roman}
  \setcounter{page}{1}
}

%%%%%%%%%%%%%%%%%%%%%% JavaScript语法高亮支持 %%%%%%%%%%%%%%%%%%%%%%

\usepackage{color}
\definecolor{lightgray}{rgb}{.9,.9,.9}
\definecolor{darkgray}{rgb}{.4,.4,.4}
\definecolor{purple}{rgb}{0.65, 0.12, 0.82}

\lstdefinelanguage{JavaScript}{
  keywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, if, in, while, do, else, case, break, const},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={class, export, boolean, throw, implements, import, this, async},
  ndkeywordstyle=\color{darkgray}\bfseries,
  identifierstyle=\color{black},
  sensitive=false,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]',
  morestring=[b]"
}