%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% summary-report.cls
% 
% LaTeX document class for Professional Executive Project Reports
% Designed for semi-annual project presentations with two-column layout
%
% Features:
%   - Two-column layout
%   - Professional header/footer
%   - Company logo support
%   - BibTeX bibliography
%   - Figures, tables, and algorithms
%   - Colored sections and theorems
%   - Custom spacing and fonts
%
% Author: Project Report Template
% Version: 1.0
% Date: 2024
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{summary-report}[2024/01/01 v1.0 Professional Executive Project Report]

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
\RequirePackage{lmodern}
\RequirePackage[scaled]{helvet}

%---------------------------------------------------------------
% REQUIRED PACKAGES - LAYOUT AND GEOMETRY
%---------------------------------------------------------------
\RequirePackage{geometry}
\geometry{
  top=3cm,
  left=2.0cm,
  right=2.0cm,
  bottom=2cm,
  headheight=2cm,
  headsep=0cm,
}
\raggedbottom

\RequirePackage{afterpage}
\RequirePackage{changepage}
\setlength{\columnsep}{30pt}
\setlength{\parindent}{0pt}

%---------------------------------------------------------------
% REQUIRED PACKAGES - COLORS AND GRAPHICS
%---------------------------------------------------------------
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage{graphicx}
\graphicspath{{Images/}{./}}
\RequirePackage{eso-pic}
\RequirePackage{transparent}

% Define corporate color scheme
\definecolor{primaryColor}{cmyk}{0.4,0.1,0,0.4}  % Primary company color
\definecolor{secondaryColor}{cmyk}{0.2,0.1,0,0.1} % Secondary shade
\definecolor{accentColor}{RGB}{59,90,198}         % Accent for highlights
\definecolor{darkText}{RGB}{0,0,0}                % Dark text
\definecolor{lightGray}{gray}{0.95}               % Light background
\definecolor{mediumGray}{gray}{0.7}               % Medium gray

%---------------------------------------------------------------
% REQUIRED PACKAGES - MATHEMATICS AND ALGORITHMS
%---------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{bm}
\RequirePackage[overload]{empheq}

\RequirePackage{algorithm}
\RequirePackage{algorithmic}

%---------------------------------------------------------------
% REQUIRED PACKAGES - TABLES AND FIGURES
%---------------------------------------------------------------
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{stfloats}

% Figure and table captions
\captionsetup[figure]{
  labelfont={color=primaryColor,bf},
  textfont=small,
  justification=centering
}
\captionsetup[table]{
  labelfont={color=primaryColor,bf},
  textfont=small,
  position=above
}
\captionsetup[algorithm]{
  labelfont={color=primaryColor,bf},
  textfont=small
}

%---------------------------------------------------------------
% REQUIRED PACKAGES - REFERENCES AND HYPERLINKS
%---------------------------------------------------------------
\RequirePackage[colorlinks=true, 
  linkcolor=primaryColor,
  anchorcolor=primaryColor,
  citecolor=primaryColor,
  filecolor=primaryColor,
  menucolor=primaryColor,
  runcolor=primaryColor,
  urlcolor=primaryColor]{hyperref}
\RequirePackage{cleveref}
\RequirePackage[square, numbers, sort&compress]{natbib}
\bibliographystyle{plainnat}

%---------------------------------------------------------------
% REQUIRED PACKAGES - HEADERS, FOOTERS, AND PAGE STYLE
%---------------------------------------------------------------
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{tcolorbox}

\pagestyle{fancy}
\fancyhf{}

% Create the header with company info
\newcommand{\companyname}{Company Name}
\newcommand{\reporttype}{Executive Project Report}
\newcommand{\reportperiod}{Semester 1, 2024}

\chead{
  \centering
  \begin{tcolorbox}[
    arc=0pt,
    boxrule=0.5pt,
    colback=primaryColor!20,
    colupper=darkText,
    width=\textwidth,
    left=0.2cm,
    right=0.2cm,
    top=0.1cm,
    bottom=0.1cm
  ]
    \fontsize{8pt}{10pt}\selectfont\bfseries
    \companyname \hfill \reporttype \hfill \reportperiod
  \end{tcolorbox}
}

% Footer: page numbers and document info
\cfoot{\fontsize{8pt}{10pt}\selectfont\thepage~of~\pageref{LastPage}}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.5pt}
\renewcommand{\footrule}{\color{primaryColor}\hrule\@@height\footrulewidth\@width\textwidth}

%---------------------------------------------------------------
% REQUIRED PACKAGES - SECTIONS AND TITLES
%---------------------------------------------------------------
\RequirePackage{titlesec}
\RequirePackage{titletoc}

% Section formatting
\titleformat{\section}
  {\color{primaryColor}\normalfont\Large\bfseries}
  {\color{primaryColor}\thesection.}
  {1em}
  {}
\titlespacing*{\section}
  {0pt}
  {2.5ex plus 1ex minus 0.2ex}
  {1.5ex plus 0.2ex}

% Subsection formatting
\titleformat{\subsection}
  {\color{primaryColor}\normalfont\large\bfseries}
  {\color{primaryColor}\thesubsection.}
  {1em}
  {}
\titlespacing*{\subsection}
  {0pt}
  {2ex plus 0.5ex minus 0.2ex}
  {1ex plus 0.2ex}

% Subsubsection formatting
\titleformat{\subsubsection}
  {\color{primaryColor}\normalfont\normalsize\bfseries}
  {\color{primaryColor}\thesubsubsection.}
  {0.8em}
  {}
\titlespacing*{\subsubsection}
  {0pt}
  {1.5ex plus 0.3ex minus 0.2ex}
  {0.8ex plus 0.2ex}

%---------------------------------------------------------------
% REQUIRED PACKAGES - LISTS AND ENUMERATIONS
%---------------------------------------------------------------
\RequirePackage{enumitem}

\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\circ$}
\setlist[itemize,3]{label=$-$}
\setlist{nosep}

%---------------------------------------------------------------
% CUSTOM THEOREM ENVIRONMENTS
%---------------------------------------------------------------
\declaretheoremstyle[
  headfont=\color{primaryColor}\normalfont\bfseries,
  bodyfont=\color{darkText}\normalfont\itshape,
  mdframed={
    linewidth=1pt,
    linecolor=primaryColor,
    backgroundcolor=lightGray
  }
]{coloredtheorem}

\theoremstyle{coloredtheorem}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{remark}[theorem]{Remark}

%---------------------------------------------------------------
% CUSTOM TABLE MACROS
%---------------------------------------------------------------
% Vertical spacing in tables
\newcommand\T{\rule{0pt}{2.6ex}}
\newcommand\B{\rule[-1.2ex]{0pt}{0pt}}

% Column types for tables
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

%---------------------------------------------------------------
% CUSTOM COMMANDS FOR TABLES
%---------------------------------------------------------------
\setlength{\heavyrulewidth}{0.8pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\aboverulesep}{1.5pt}
\setlength{\belowrulesep}{1.5pt}

\newcommand{\addtabletext}[1]{
  {\setlength{\leftskip}{9pt}\fontsize{7}{9}\selectfont#1}
}

%---------------------------------------------------------------
% CUSTOM COMMANDS FOR FIGURES
%---------------------------------------------------------------
\newcommand{\insertnote}[1]{
  \begin{tcolorbox}[
    colback=primaryColor!10,
    colframe=primaryColor,
    arc=3pt,
    left=0.5cm,
    right=0.5cm,
    top=0.3cm,
    bottom=0.3cm
  ]
    \fontsize{8pt}{10pt}\selectfont #1
  \end{tcolorbox}
}

%---------------------------------------------------------------
% DOCUMENT METADATA COMMANDS
%---------------------------------------------------------------
\newcommand{\projecttitle}[1]{\def\@projecttitle{#1}}
\newcommand{\projectcode}[1]{\def\@projectcode{#1}}
\newcommand{\reportperiod}[1]{\def\@reportperiod{#1}}
\newcommand{\projectmanager}[1]{\def\@projectmanager{#1}}
\newcommand{\teamleader}[1]{\def\@teamleader{#1}}
\newcommand{\companylogo}[1]{\def\@companylogo{#1}}
\newcommand{\companybrand}[1]{\def\@companybrand{#1}}
\newcommand{\keyachievements}[1]{\def\@keyachievements{#1}}
\newcommand{\nextmilestones}[1]{\def\@nextmilestones{#1}}
\newcommand{\projectstatus}[1]{\def\@projectstatus{#1}}

% Set default values
\def\@projecttitle{Project Title}
\def\@projectcode{PRJ-2024-001}
\def\@reportperiod{Semester 1, 2024}
\def\@projectmanager{Project Manager}
\def\@teamleader{Team Leader}
\def\@companylogo{}
\def\@companybrand{Company Name}
\def\@keyachievements{}
\def\@nextmilestones{}
\def\@projectstatus{On Track}

%---------------------------------------------------------------
% CUSTOM TITLE PAGE
%---------------------------------------------------------------
\renewcommand{\@maketitle}{%
  \twocolumn[{%
    \begin{@twocolumnfalse}
      
      % Company logo section
      \noindent\begin{minipage}[t]{0.3\textwidth}
        \if\relax\detokenize\expandafter{\@companylogo}\relax
          % No logo provided
        \else
          \includegraphics[width=\textwidth,height=1.5cm,keepaspectratio]{\@companylogo}
        \fi
      \end{minipage}
      \hfill
      \begin{minipage}[t]{0.65\textwidth}
        \raggedleft
        \fontsize{14pt}{16pt}\selectfont\bfseries\color{primaryColor}
        \reporttype\\
        \vspace{0.1cm}
        \fontsize{10pt}{12pt}\selectfont\color{darkText}
        \@reportperiod
      \end{minipage}
      
      \vspace{0.3cm}
      \noindent\hrule
      \vspace{0.5cm}
      
      % Project title and details
      \fontsize{18pt}{22pt}\selectfont\bfseries\color{primaryColor}
      \@projecttitle\par
      
      \vspace{0.2cm}
      \fontsize{10pt}{12pt}\selectfont\color{mediumGray}
      \textbf{Project Code:} \@projectcode \hfill
      \textbf{Status:} {\color{primaryColor}\@projectstatus}\par
      
      \vspace{0.3cm}
      \fontsize{9pt}{11pt}\selectfont\color{darkText}
      \textbf{Project Manager:} \@projectmanager\\
      \textbf{Team Leader:} \@teamleader\par
      
      \vspace{0.5cm}
      \noindent\hrule
      \vspace{0.3cm}
      
      % Key achievements summary
      \if\relax\detokenize\expandafter{\@keyachievements}\relax
        % No achievements provided
      \else
        \fontsize{9pt}{11pt}\selectfont\bfseries\color{primaryColor}
        Key Achievements:\par
        \fontsize{8pt}{10pt}\selectfont\color{darkText}
        \@keyachievements\par
        \vspace{0.2cm}
      \fi
      
      \vspace{0.3cm}
      
    \end{@twocolumnfalse}%
  }]%
}

%---------------------------------------------------------------
% BACKGROUND IMAGE COMMAND
%---------------------------------------------------------------
\newcommand\BackgroundImage{%
  \put(230,358){
    \parbox[b][\paperheight]{\paperwidth}{%
      \vfill
      \centering
      \transparent{0.15}
      \includegraphics[width=0.6\paperwidth]{background.eps}%
      \vfill
    }
  }
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

%---------------------------------------------------------------
% MICROTYPE FOR BETTER TEXT
%---------------------------------------------------------------
\RequirePackage{microtype}

\endinput
