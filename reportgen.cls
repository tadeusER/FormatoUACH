\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reportgen}[2023/10/16 General Report Class]
\LoadClass[a4paper,12pt]{report}

% Required packages
\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{subfig}
\RequirePackage{pdfpages}

% Setup options
\SetupKeyvalOptions{
    family=reportgen,
    prefix=reportgen@
}

% Declare options
\DeclareStringOption[english]{language}
\DeclareStringOption[report]{doctype}
\DeclareStringOption[]{logo}
\DeclareStringOption[]{subject}
\DeclareStringOption[]{topic}
\ProcessKeyvalOptions*

% Page geometry
\RequirePackage[top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}

% Colors
\definecolor{kaust-blue}{RGB}{0,102,153}

% Custom commands for document info
\newcommand{\@logo}{}
\newcommand{\logo}[1]{\renewcommand{\@logo}{#1}}

\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}

\newcommand{\@topic}{}
\newcommand{\topic}[1]{\renewcommand{\@topic}{#1}}

\newcommand{\@participants}{}
\newcommand{\participants}[1]{\renewcommand{\@participants}{#1}}

% Custom commands for participant info
\newcommand{\studentinfo}[3]{%
    \textbf{#1} \\
    ID: #2 \\
    \href{mailto:#3}{#3}%
}

\newcommand{\tutorinfo}[3]{%
    \textbf{#1} \\
    Dept: #2 \\
    \href{mailto:#3}{#3}%
}

% Redefine \maketitle for custom cover page
\renewcommand{\maketitle}{%
    \begin{titlepage}
        \newgeometry{top=2cm, bottom=2cm, left=2cm, right=2cm}
        \begin{center}
            \includegraphics[width=0.4\textwidth]{\@logo}
            
            \vspace{1cm}
            
            {\huge\bfseries\@title\par}
            
            \vspace{0.5cm}
            
            {\Large\@subject\par}
            
            \vspace{0.25cm}
            
            {\large\@topic\par}
            
            \vspace{1cm}
            
            {\large\@participants\par}
            
            \vfill
            
            {\large\@date\par}
        \end{center}
    \end{titlepage}
    \restoregeometry
}

% Custom headers and footers
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[L]{\@subject}
\fancyhead[R]{\@topic}
\fancyfoot[C]{\thepage}

% Table of contents styling
\renewcommand{\contentsname}{\color{kaust-blue}\normalfont\bfseries\Large Table of Contents}

% Section styling
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus.2ex}%
    {\color{kaust-blue}\normalfont\Large\bfseries}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\color{kaust-blue}\normalfont\large\bfseries}}

% Caption styling
\RequirePackage[labelfont=bf,textfont=it]{caption}

% Hyperref setup
\hypersetup{
    colorlinks=true,
    linkcolor=kaust-blue,
    filecolor=kaust-blue,
    urlcolor=kaust-blue,
    citecolor=kaust-blue
}

% Bibliography setup (if needed)
\RequirePackage[
    backend=biber,
    style=numeric
]{biblatex}

\endinput
