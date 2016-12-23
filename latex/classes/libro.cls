%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Libro                                    %
% Version 1.0 by Miguel Angel Piña Avelino %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definición de la clase para el libro %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{latex/classes/libro}[2016/12/21 v1 libro class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips, a4paper]{book}
\else
   \LoadClass[pdftex, a4paper]{book}
\fi



%%%%%%%%%%%%%%%%%%%%%%%%
% Paquetes utilizados. %
%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[spanish,mexico,activeacute]{babel} % Soporte multilenguaje y locales.
\usepackage[utf8x]{inputenc} % Soporte para el ingreso de caracteres en UTF8
\usepackage[T1]{fontenc} % El tipo de codificación para la fuente
\usepackage[usenames, dvipsnames]{color} % Soporte de colores
\usepackage{color,soulutf8}
\usepackage{titlesec} % Headings alternativos
\usepackage{fancyhdr} % Headings
\usepackage{amssymb}
\usepackage{graphics}
\usepackage{ifthen}
\usepackage{xifthen}
\usepackage{ifpdf}

\ifpdf
  \usepackage[pdftex,
    plainpages = false,
    pdfpagelabels,
    pdfpagelayout = useoutlines,
    bookmarks,
    bookmarksopen = true,
    bookmarksnumbered = true,
    breaklinks = true,
    linktocpage,
    pagebackref,
    colorlinks = false,  % was true
    linkcolor = blue,
    urlcolor  = blue,
    citecolor = red,
    anchorcolor = green,
    hyperindex = true,
    hyperfigures]
  {hyperref}
  \DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf, .gif} %GIF doesn't work??
  \usepackage[pdftex]{graphicx}
  \pdfcompresslevel=9
  \graphicspath{{0_frontmatter/figures/PNG/}{0_frontmatter/figures/PDF/}{0_frontmatter/figures/}}
\else
  \usepackage[
    dvips,
    bookmarks,
    bookmarksopen = true,
    bookmarksnumbered = true,
    breaklinks = true,
    linktocpage,
    pagebackref,
    colorlinks = true,
    linkcolor = blue,
    urlcolor  = blue,
    citecolor = red,
    anchorcolor = green,
    hyperindex = true,
    hyperfigures]
  {hyperref}

  \DeclareGraphicsExtensions{.eps, .ps}
  \usepackage{epsfig}
  \usepackage{graphicx}
  \graphicspath{{0_frontmatter/figures/EPS/}{0_frontmatter/figures/}}
\fi


\usepackage[margin=10pt,font=small,labelfont=bf]{caption}
\usepackage{eucal}
\usepackage[perpage]{footmisc}
\usepackage[round, sort, numbers]{natbib}
\bibpunct{[}{]}{,}{n}{}{;}
\usepackage{multicol}
\setlength{\columnsep}{20pt}
\usepackage[nottoc]{tocbibind}
\usepackage{makeidx}
\usepackage{ucs}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{minitoc}
\usepackage[intoc,spanish]{nomencl}
\usepackage{mathptmx}
\usepackage{quotchap}
\usepackage{titlesec}
\usepackage{fancybox}
\usepackage{listings}
\usepackage{rotating}
\usepackage{minted}
\usepackage[xindy,nopostdot]{glossaries}
\usepackage{wrapfig}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuraciones varias %
%%%%%%%%%%%%%%%%%%%%%%%%%%

\nomrefpage{}
\renewcommand{\nomname}{Glosario}
\renewcommand{\nomlabel}[1]{\textbf{#1}}
\makenomenclature{}

\setlength\parindent{0pt}

\newcommand{\g}{\footnote{Para todas las abreviaciones, veáse el glosario en la página \pageref{nom}.}}


\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\bfseries}}


\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}
\setlength{\oddsidemargin}{1.5cm}
\setlength{\evensidemargin}{0.5cm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{1.36cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{20.84cm}
\setlength{\textwidth}{13.9cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{2.36cm}


\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}


%%%%%%%%%%%%%%%
% Frontmatter %
%%%%%%%%%%%%%%%

\newenvironment{alwayssingle}{%
  \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
  \else\newpage\fi}
{\if@restonecol\twocolumn\else\newpage\fi}

% Entorno para el prefacio de un libro

\newenvironment{prefacio} {
  \begin{alwayssingle} \pagestyle{empty}
    \cleardoublepage{}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries  Prefacio}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
{\end{quote}\end{alwayssingle}}

% Agradecimientos del libro

\newenvironment{agradecimientos} {
  \pagestyle{empty}
  \begin{alwayssingle}
    \cleardoublepage{}
    \begin{center}
      \vspace*{1.5cm}
      {\Large \bfseries Agradecimientos}
    \end{center}
    \vspace{0.5cm}
    \begin{quote}}
{\end{quote}\end{alwayssingle}}

% Estilo del frontmatter

\renewcommand{\frontmatter} {
  \cleardoublepage{}
  \pagestyle{fancy}
  \pagenumbering{roman}
  \titleformat{\chapter}[display]%
  {\filleft}%
  {\color{Gray}{\filleft\small{\bfseries CAPÍTULO}} {\linebreak\fontsize{90}{90}\selectfont\selectfont {\bfseries \thechapter}}}
  {2ex}
  {\vspace{2ex}\bfseries \fontsize{30}{30}\selectfont}%
  \titlespacing{\chapter}{3mm}{*10}{15mm}[3mm] %
  \titleformat{\section}[block]{\normalfont\Large}{\thesection}{.5em}{\bfseries}
  \titlespacing*{\section}{0pt}{*4}{*1}
  \titleformat{\subsection}[block]{\normalfont\large}{\thesubsection}{.5em}{\bfseries}
  \titlespacing*{\subsection}{0pt}{*4}{*1}
  \titleformat{\subsubsection}[block]{\normalfont\normalsize}{\thesubsubsection}{.5em}{\bfseries}
  \titlespacing*{\subsubsection}{0pt}{*4}{0.5ex}
}


\renewcommand{\mainmatter}{
  \cleardoublepage{}
  \pagestyle{fancy}
  \pagenumbering{arabic}

  %% Another version of
  %% \chapter format
  % \titleformat{\chapter}[block]
  % {\normalfont\sffamily\huge}{\bfseries\thechapter.}{.5em}{\filleft\bfseries}
  % [\titlerule\vspace{10ex}]
  %%% Space between title and text
  % \titlespacing*{\chapter}{0pt}{*4}{*1}

  \titleformat{\chapter}[display]
  {\filleft}
  {\color{Gray}{\filleft\small{\bfseries CAPÍTULO}} {\linebreak\fontsize{90}{90}\selectfont\selectfont {\bfseries \thechapter}}}
  {2ex}
  {\vspace{2ex}\bfseries \fontsize{30}{30}\selectfont}%

  \titlespacing{\chapter}{3mm}{*10}{15mm}[3mm] %
  \titleformat{\section}[block]{\normalfont\Large}{\thesection}{.5em}{\bfseries}
  \titlespacing*{\section}{0pt}{*4}{*1}
  \titleformat{\subsection}[block]{\normalfont\large}{\thesubsection}{.5em}{\bfseries}
  \titlespacing*{\subsection}{0pt}{*4}{*1}
  \titleformat{\subsubsection}[block]{\normalfont\normalsize}{\thesubsubsection}{.5em}{\bfseries}
  \titlespacing*{\subsubsection}{0pt}{*4}{0.5ex}
}

\renewcommand{\backmatter}{%
  \cleardoublepage{}
  \pagestyle{fancy}

  \titleformat{\chapter}[display]%
  {\filleft}%
  {\color{Gray}{\filleft\small{\bfseries APÉNDICE}} {\linebreak\fontsize{90}{90}\selectfont\selectfont {\bfseries \thechapter}}}
  {2ex}
  {\vspace{2ex}\bfseries \fontsize{30}{30}\selectfont}%
  \titlespacing{\chapter}{3mm}{*10}{15mm}[3mm] %

  \titleformat{\section}[block]{\normalfont\Large}{\thesection}{.5em}{\bfseries}
  \titlespacing*{\section}{0pt}{*4}{*1}

  \titleformat{\subsection}[block]{\normalfont\large}{\thesubsection}{.5em}{\bfseries}
  \titlespacing*{\subsection}{0pt}{*4}{*1}

  \titleformat{\subsubsection}[block]{\normalfont\normalsize}{\thesubsubsection}{.5em}{\bfseries}
  \titlespacing*{\subsubsection}{0pt}{*4}{0.5ex}
}

% Números de páginas: Romanos + arábigos

\newenvironment{romanpages}
{
	\setcounter{page}{1}
	\renewcommand{\thepage}{\roman{page}}
}

{
	\newpage
	\renewcommand{\thepage}{\arabic{page}}
	\setcounter{page}{1}
}


\theoremstyle{definition}
\newtheorem{definition}{Definición}[chapter]