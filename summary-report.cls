%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% summary-report.cls - VERSIÓN SIMPLE
% LaTeX document class for Professional Executive Project Reports
% SIN modificaciones de tamaño de fuente
%
% Version: 1.0 SIMPLE
% Date: 2024
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{formato/summary-report}[2024/01/01 v1.0 Professional Executive Project Report]

%---------------------------------------------------------------
% LOAD BASE CLASS AND OPTIONS
%---------------------------------------------------------------
\LoadClass[11pt,a4paper,twocolumn]{article}

%---------------------------------------------------------------
% REQUIRED PACKAGES - FONTS AND LANGUAGE
%---------------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled]{helvet}
\RequirePackage{textcomp}

%---------------------------------------------------------------
% REQUIRED PACKAGES - LAYOUT AND GEOMETRY
%---------------------------------------------------------------
\RequirePackage{geometry}
\geometry{margin=0.75in, top=0.85in}

\RequirePackage{afterpage}
\RequirePackage{changepage}

\setlength{\columnsep}{20pt}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.3em}

%---------------------------------------------------------------
% COLOR PACKAGES
%---------------------------------------------------------------
\RequirePackage{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{shapes}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{arrows}

%---------------------------------------------------------------
% COLOR DEFINITIONS
%---------------------------------------------------------------
\definecolor{primaryColor}{cmyk}{0.4,0.1,0,0.4}
\definecolor{secondaryColor}{cmyk}{0.2,0.1,0,0.1}
\definecolor{accentColor}{RGB}{59,90,198}
\definecolor{darkText}{RGB}{0,0,0}
\definecolor{lightGray}{gray}{0.95}
\definecolor{mediumGray}{gray}{0.7}

%---------------------------------------------------------------
% GRAPHICS AND SUPPORTING PACKAGES
%---------------------------------------------------------------
\RequirePackage{graphicx}
\graphicspath{{Images/}{./}}
\RequirePackage{eso-pic}
\RequirePackage{transparent}

%---------------------------------------------------------------
% MATH PACKAGES
%---------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{bm}

%---------------------------------------------------------------
% TABLE PACKAGES
%---------------------------------------------------------------
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{stfloats}

%---------------------------------------------------------------
% ADVANCED PACKAGES
%---------------------------------------------------------------
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=primaryColor,
  citecolor=primaryColor,
  urlcolor=primaryColor
}

\RequirePackage{cleveref}
\RequirePackage[square, numbers, sort&compress]{natbib}
\bibliographystyle{plainnat}

%---------------------------------------------------------------
% HEADER AND FOOTER
%---------------------------------------------------------------
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\pagestyle{fancy}
\fancyhf{}

\newcommand{\companyname}{Company Name}
\newcommand{\reporttype}{Executive Project Report}
\newcommand{\reportperiod}{Semester 1, 2024}

\chead{
  \centering
  \small\bfseries
  \companyname \hfill \reporttype \hfill \reportperiod
}

\cfoot{\small\thepage~of~\pageref{LastPage}}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.5pt}

%---------------------------------------------------------------
% TCOLORBOX
%---------------------------------------------------------------
\RequirePackage{tcolorbox}

%---------------------------------------------------------------
% SECTION FORMATTING - SIN CAMBIOS DE TAMAÑO
%---------------------------------------------------------------
\RequirePackage{titlesec}
\RequirePackage{titletoc}

\titleformat{\section}
  {\color{primaryColor}\bfseries\large}
  {\color{primaryColor}\thesection.}
  {1em}
  {}

\titlespacing*{\section}
  {0pt}
  {0.5em}
  {0.3em}

\titleformat{\subsection}
  {\color{primaryColor}\bfseries}
  {\color{primaryColor}\thesubsection.}
  {1em}
  {}

\titlespacing*{\subsection}
  {0pt}
  {0.3em}
  {0.2em}

\titleformat{\subsubsection}
  {\color{primaryColor}\bfseries}
  {\color{primaryColor}\thesubsubsection.}
  {0.8em}
  {}

\titlespacing*{\subsubsection}
  {0pt}
  {0.2em}
  {0.1em}

%---------------------------------------------------------------
% LIST STYLES
%---------------------------------------------------------------
\RequirePackage{enumitem}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\circ$}
\setlist[itemize,3]{label=$-$}
\setlist{nosep}

%---------------------------------------------------------------
% THEOREM STYLES
%---------------------------------------------------------------
\theoremstyle{definition}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{remark}[theorem]{Remark}

%---------------------------------------------------------------
% CUSTOM TABLE MACROS
%---------------------------------------------------------------
\newcommand\T{\rule{0pt}{2.6ex}}
\newcommand\B{\rule[-1.2ex]{0pt}{0pt}}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\setlength{\heavyrulewidth}{0.8pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\aboverulesep}{1.5pt}
\setlength{\belowrulesep}{1.5pt}

%---------------------------------------------------------------
% DOCUMENT METADATA COMMANDS
%---------------------------------------------------------------
\newcommand{\projecttitle}[1]{\def\@projecttitle{#1}}
\newcommand{\projectcode}[1]{\def\@projectcode{#1}}
\newcommand{\projectperiod}[1]{\def\@projectperiod{#1}}
\newcommand{\projectmanager}[1]{\def\@projectmanager{#1}}
\newcommand{\teamleader}[1]{\def\@teamleader{#1}}
\newcommand{\companylogo}[1]{\def\@companylogo{#1}}
\newcommand{\companybrand}[1]{\def\@companybrand{#1}}
\newcommand{\keyachievements}[1]{\def\@keyachievements{#1}}
\newcommand{\nextmilestones}[1]{\def\@nextmilestones{#1}}
\newcommand{\projectstatus}[1]{\def\@projectstatus{#1}}
\newcommand{\reporttypeperiod}[1]{\def\@reporttypeperiod{#1}}
\newcommand{\authorlist}[1]{\def\@authorlist{#1}}

\newcommand{\setreportperiod}[1]{\renewcommand{\reportperiod}{#1}}

% Set default values
\def\@projecttitle{Project Title}
\def\@projectcode{}
\def\@projectperiod{Semester 1, 2024}
\def\@projectmanager{}
\def\@teamleader{}
\def\@companylogo{}
\def\@companybrand{Company Name}
\def\@keyachievements{}
\def\@nextmilestones{}
\def\@projectstatus{On Track}
\def\@reporttypeperiod{Semester 1, 2024}
\def\@authorlist{}

%---------------------------------------------------------------
% CUSTOM TITLE PAGE
%---------------------------------------------------------------
\renewcommand{\@maketitle}{%
  \begin{center}
    % Display company logo if provided
    \if\relax\detokenize\expandafter{\@companylogo}\relax
    \else
      \vspace{0.3cm}
      \includegraphics[width=3cm]{\@companylogo}\\
      \vspace{0.3cm}
    \fi
    
    \large\bfseries\color{primaryColor}\reporttype\\
    \normalsize\bfseries\color{darkText}\@reporttypeperiod
    
    \vspace{0.5cm}
    \noindent\hrulefill\par
    
    \vspace{0.3cm}
    \Large\bfseries\color{primaryColor}\@projecttitle\\
    
    \vspace{0.3cm}
    \normalsize\color{darkText}
    % Only show project code if not empty
    \if\relax\detokenize\expandafter{\@projectcode}\relax
    \else
      \textbf{Project Code:} \@projectcode \quad
    \fi
    \textbf{Status:} \textcolor{primaryColor}{\textbf{\@projectstatus}}\\
    
    \vspace{0.2cm}
    % Show authors/managers only if provided
    \if\relax\detokenize\expandafter{\@authorlist}\relax
      % Check if we have at least projectmanager or teamleader
      \if\relax\detokenize\expandafter{\@projectmanager}\relax
      \else
        \small\color{darkText}
        \textbf{Project Manager:} \@projectmanager
      \fi
      \if\relax\detokenize\expandafter{\@teamleader}\relax
      \else
        \if\relax\detokenize\expandafter{\@projectmanager}\relax
        \else
          \quad
        \fi
        \textbf{Team Leader:} \@teamleader
      \fi
    \else
      \small\color{darkText}
      \textbf{Authors:} \@authorlist
    \fi
    
    \vspace{0.3cm}
    \noindent\hrulefill\par
    
    \if\relax\detokenize\expandafter{\@keyachievements}\relax
    \else
      \vspace{0.2cm}
      \small\bfseries\color{primaryColor}Key Achievements:\\
      \small\color{darkText}\@keyachievements
    \fi
  \end{center}
  \vspace{0.3cm}
}

%---------------------------------------------------------------
% ADDITIONAL PACKAGES
%---------------------------------------------------------------
\RequirePackage{comment}
\RequirePackage{lipsum}
\RequirePackage{marginnote}
\RequirePackage{float}

%---------------------------------------------------------------
% NEW CUSTOM COMMANDS FOR EQUATIONS
%---------------------------------------------------------------
\newcommand{\bea}{\begin{eqnarray}}
\newcommand{\eea}{\end{eqnarray}}
\newcommand{\e}[1]{\times 10^{#1}}
\newcommand{\pdev}[2]{\frac{\partial#1}{\partial#2}}

\endinput
