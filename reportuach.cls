% ============================================================
%
% Plantilla para reportes
%
% Author: Enrique Ramirez
% Modified to include institute support
%
% ============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reportuach}
\RequirePackage{kvoptions}[2010/12/23]
\RequirePackage{ifthen}

\SetupKeyvalOptions{
	family=reportuach,
	prefix=reportuach@
}

% Existing options
\DeclareStringOption[]{language}[english]
\DeclareStringOption[]{thesis}[master]
\DeclareStringOption[]{supervisor}[supervisor]
\DeclareStringOption[]{chair}[statistics]
\DeclareStringOption{license}
\DeclareBoolOption{multiauthor}

% New option for institute
\DeclareStringOption[]{institute}[]

\ProcessKeyvalOptions*
\LoadClass[a4paper,12pt]{report}

% Existing packages and settings...
\usepackage[papersize={216mm,279mm},tmargin=30mm,bmargin=25mm,lmargin=30mm,rmargin=20mm, heightrounded=true]{geometry}
\setlength{\headheight}{52pt}
\usepackage[titles]{tocloft}
\RequirePackage[T1]{fontenc}
\usepackage{acronym}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{eurosym}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{algorithmicx}
\RequirePackage{minted}
\usemintedstyle{borland}
\newcounter{lstlisting}
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}
\RequirePackage{longtable}

% New commands for institute
\newcommand{\@institute}{}
\newcommand{\institute}[1]{\def\@institute{#1}}

% Redefine \maketitle to include institute
\renewcommand{\maketitle}{%
  \begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \null\vfil
    \vskip 60\p@
    \begin{center}%
      {\LARGE \@title \par}%
      \vskip 3em%
      {\large
       \lineskip .75em%
        \begin{tabular}[t]{c}%
          \@author
        \end{tabular}\par}%
      \vskip 1.5em%
      {\large \@institute \par}%
      \vskip 1.5em%
      {\large \@date \par}%
    \end{center}\par
    \@thanks
    \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@institute\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\institute\relax
}

% Rest of the class file...

