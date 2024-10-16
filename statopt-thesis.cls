% ============================================================
%
% Plantilla para reportes
%
% Author: Enrique Ramirez
%
% ============================================================

\def\fileversion{0.0}%version del archivo
\def\filedate{2022/06/30}%fecha dela rchivo

% ============================================================

% _______________ Class Definition _______________

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{settings/statopt-thesis}

% Conditional commands
\RequirePackage{kvoptions}[2010/12/23]%Este paquete está destinado a los autores de paquetes que desean utilizar opciones en formato de valor clave para sus opciones de paquete.
\RequirePackage{ifthen}%paquetes con commandos condicionales
%\ifthenelse{test}{then}{else}

%???????
% Namespacing
\SetupKeyvalOptions{
	family=statopt,
	prefix=statopt@
}

% Set English as default language
\DeclareStringOption[]{language}[english]

% Set Master Thesis as default document type
\DeclareStringOption[]{thesis}[master]

% Set supervisor ≠ professor as default supervisor option
\DeclareStringOption[]{supervisor}[supervisor]

% Set statistic as the default chair
\DeclareStringOption[]{chair}[statistics]

% Option to control licensing
%% License information functionality ported from dbisgroup/dbis-template;
\DeclareStringOption{license}

% Option in case of multiple authors
\DeclareBoolOption{multiauthor}

% Process options
\ProcessKeyvalOptions*

\LoadClass[a4paper,12pt]{report}

% _______________ Packages _______________

% Set margings and spaces
\RequirePackage[a4paper,left=2.9cm, top=2.9cm, bottom=2.3cm, right=2.9cm,includefoot,heightrounded]{geometry}

% Customize the table of contents
\usepackage[titles]{tocloft}

% General language and symbol settings
\RequirePackage[T1]{fontenc}

% References and Citations
\RequirePackage{booktabs}

% Add dummy text
\RequirePackage{lipsum}
\usepackage{import}
\usepackage{acronym}
% Images & Drawing
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tikz}

% Math and Symbols
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{eurosym}

% Listings
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{algorithmicx}
\RequirePackage{minted}
\usemintedstyle{borland}
\newcounter{lstlisting}
%\usepackage{listings}

% Figures and Floats
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{subcaption}

% Change shape of enumerate and itemize environments
\RequirePackage{enumitem}

% Fonts
\RequirePackage{lmodern}

% Break URLs at hyphen
\RequirePackage[hyphens]{url}

% Commands and environments for verbatim text (with hyphenation and for
% robust use in arguments)
\RequirePackage{examplep}

% TeX names
\RequirePackage{texnames}
\usepackage[toc,page]{appendix} 
% Hyperreferences
\RequirePackage{hyperref}

% Customize headers
\RequirePackage{fancyhdr}
\RequirePackage{MnSymbol,wasysym}
\setlength{\headheight}{14.49999pt}
\RequirePackage{titlesec}

\RequirePackage{setspace}
\RequirePackage{afterpage}
\RequirePackage[strict]{changepage}

\RequirePackage{longtable}

% _______________ Options _______________

% Macro for creating options
\newcommand{\statopt@new@option}{\@ifstar{\statopt@new@option@star}{\statopt@new@option@nostar}}

% Options for different languages
\ifthenelse{\equal{\statopt@language}{english}}{
    \RequirePackage[utf8]{inputenc}
	\RequirePackage[ngerman,english]{babel}
	\RequirePackage[en-GB,showdow]{datetime2}
        \RequirePackage{csquotes} % Language-dependent quotation marks.
    % License
	\newcommand{\cLizenzTemplate}[1]{Unless explicitly specified otherwise, this work is licensed under the license #1.}
	\renewcommand{\maketitle}{%
        \englishTitle
        \englishBacktitle
  }
  \newcommand{\declaration}{%
    \englishDeclaration
  }
  \newcommand{\consent}{%
    \englishConsent
  }
}{\ifthenelse{\equal{\statopt@language}{german}}{
    \RequirePackage[utf8]{inputenc}
	\RequirePackage[english,ngerman]{babel}
        \frenchspacing
        \RequirePackage[german,showdow]{datetime2}
	\RequirePackage{icomma}

        \RequirePackage[autostyle,german=quotes]{csquotes} % Language-dependent quotation marks.
        % Necessary for correct quotation marks in German bibliography.
    % License
	\newcommand{\cLizenzTemplate}[1]{Soweit nicht anders angegeben unterliegt diese Arbeit der Lizenz #1.}
	\renewcommand{\maketitle}{%
        \germanTitle
        \germanBacktitle
  }
    \newcommand{\declaration}{%
        \germanDeclaration
  }
    \newcommand{\consent}{%
        \germanConsent
  }
}{\ifthenelse{\equal{\statopt@language}{spanish}}{
    %\RequirePackage[utf8]{inputenc}
	\RequirePackage[english,ngerman,spanish,es-tabla]{babel}
        \frenchspacing
        \RequirePackage[spanish,showdow]{datetime2}
	\RequirePackage{icomma}

        \RequirePackage[autostyle]{csquotes} % Language-dependent quotation marks.
        % Necessary for correct quotation marks in German bibliography.
    % License
	\newcommand{\cLizenzTemplate}[1]{A menos que se especifique explícitamente lo contrario, este trabajo está autorizado bajo la licencia #1.}
	\renewcommand{\maketitle}{%
        \spanishTitle
        \spanishBacktitle
  }
    \newcommand{\declaration}{%
        \spanishDeclaration
  }
    \newcommand{\consent}{%
        \spanishConsent
  }
  }
{
 \ClassError{statopt}{Unknown language ``\statopt@language'' specified}{}
}
}
}

\newcommand{\niceHeader}{
    \pagestyle{fancyplain}
    \fancyhf{}
    \fancyfoot[C]{\small \thepage}
    \fancyhead[R]{\footnotesize \leftmark}
    %\fancyhead[L]{\footnotesize \rightmark} % Removed to avoid overlap
    \renewcommand{\headrulewidth}{0.1pt}
    \assignpagestyle{\chapter}{fancyplain}
}

\newcommand{\thesistype}[1]{\def\@thesistype{#1}}

% Options for types of thesis: bachelor, master, seminar, tesis
\ifthenelse{\equal{\statopt@thesis}{tesis}}{
    \niceHeader
    \ifthenelse{\equal{\statopt@language}{english}}{
        \thesistype{
            {\scshape{\Large Master Thesis}}\par
        }
    }{
        \thesistype{
            {\scshape{\Large Trabajo de titulacion}}\par
        }
    }

}
{
\ifthenelse{\equal{\statopt@thesis}{seminar}}{
    \ifthenelse{\equal{\statopt@language}{english}}{
        \thesistype{
            {\scshape{\Large Seminar Thesis}}\par
            \vspace*{0.3cm}
            {in the context of the seminar}\par
            \vspace*{0.3cm}
            {\scshape{\large\@course}}\par
        }
    }{
        \thesistype{
            {\scshape{\Large Seminararbeit}}\par
            \vspace*{0.3cm}
            {im Rahmen des Seminars}\par
            \vspace*{0.3cm}
            {\scshape{\Large\@course}}\par
        }
    }
}{\ifthenelse{\equal{\statopt@thesis}{master}}{
    \niceHeader
    \ifthenelse{\equal{\statopt@language}{english}}{
        \thesistype{
            {\scshape{\Large Master Thesis}}\par
        }
    }{
        \thesistype{
            {\scshape{\Large Masterarbeit}}\par
        }
    }
}{\ifthenelse{\equal{\statopt@thesis}{bachelor}}{
    \niceHeader
    \ifthenelse{\equal{\statopt@language}{english}}{
        \thesistype{
            {\scshape{\Large Bachelor Thesis}}\par
        }
    }{
        \thesistype{
            {\scshape{\Large Bachelorarbeit}}\par
        }
    }
}{\ClassError{statopt}{Unknown type of thesis ``\statopt@thesis'' specified}{}
}}}
}
% Citation style
\ifthenelse{\equal{\statopt@chair}{machineLearning}}
{%
    \RequirePackage[
        natbib=true,
        style=alphabetic,
        sorting=none,
        maxcitenames=3,
        giveninits=false,
        backend=biber,
        hyperref=true,
        url=true]{biblatex}
}%
{%
    \RequirePackage[
%        natbib=true,
%        style=apa,
%        maxcitenames=3, % apa overwrites maxcitenames. One could use authoryear.
                         % https://tex.stackexchange.com/questions/114442/biblatex-is-ignoring-maxcitenames
        backend=biber, % apa requires biber.
        hyperref=true,
        sorting=none,
        url=true]{biblatex}
}%

% _______________ Table of Contents, List of Figures & Tables _______________

\let\default@tableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
    \newgeometry{left=3cm, top=3cm, bottom=2.5cm, right=3cm}
    \clearpage%
    \phantomsection%
    \setlength{\parskip}{0pt}%
    \setcounter{tocdepth}{2}%
    \default@tableofcontents%
    \thispagestyle{fancy}
    \pagenumbering{roman} 
    \restoregeometry{}
    \pagebreak
}

% Include dots, spaces, and make sure that the ToC is not printed in bold
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsubsecfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftdotsep}{2}
\renewcommand{\cftchapleader}{\cftdotfill{\cftsecdotsep}}
\setlength{\cftparskip}{0pt}
\setlength{\cftbeforechapskip}{0pt}

% Create minimal LOF
\let\default@listoffigures\listoffigures
\renewcommand{\listoffigures}{
    \newgeometry{left=3cm, top=3cm, bottom=2.5cm, right=3cm}
    \clearpage%
    \phantomsection%
    \setlength{\parskip}{0pt}%
    \setlength{\cftfigindent}{0pt}  % remove indentation from figures in lof
    \default@listoffigures%
    \thispagestyle{fancy}
    \restoregeometry{}
    \pagebreak
}

% Create minimal LOT
\let\default@listoftables\listoftables
\renewcommand{\listoftables}{
    \newgeometry{left=3cm, top=3cm, bottom=2.5cm, right=3cm}
    \clearpage%
    \phantomsection%
    \setlength{\parskip}{0pt}%
    \setlength{\cfttabindent}{0pt}
    \default@listoftables%
    \thispagestyle{fancy}
    \restoregeometry{}
    \pagebreak
}

\newcommand{\listofabbreviations}{
    \newgeometry{left=3cm, top=3cm, bottom=2.5cm, right=3cm}
    \clearpage%
    \phantomsection%
    \setlength{\parskip}{0pt}%
    \setlength{\cfttabindent}{0pt}
    \glsfindwidesttoplevelname
    \setglossarystyle{alttree}
    \printglossary[type=\acronymtype, title=List of Abbreviations, nonumberlist, nopostdot, nogroupskip]
    \thispagestyle{fancy}
    \restoregeometry{}
    \pagebreak
}
% _______________ Design _______________

% Set indents and line spacing
\onehalfspacing
\setlength{\parindent}{0pt}
\setlength{\parskip}{\baselineskip}%

% Change footnotes
\RequirePackage[flushmargin,hang,bottom]{footmisc}
\setlength{\footnotemargin}{0.75cm}
\renewcommand\footnoterule{\kern-3pt \hrule width 2in \kern 2.6pt} % Length of separator between text and footnotes
\interfootnotelinepenalty=10000 % Prevent footnotes to be split over multiple pages
\counterwithout{footnote}{chapter}

% Adjust captions
\captionsetup{figurewithin=none,tablewithin=none} % Continuous numbering
\captionsetup{labelsep=quad} % No separator between label and caption
\AtBeginDocument{\counterwithout{lstlisting}{chapter} % Continous numbering for listings
}

% % Sectioning formatting

\titleformat{\chapter}[block]{\normalfont\Large\bfseries}{\makebox[1cm][l]{\thechapter}}{0pt}{}{}
\titlespacing*{\chapter}{0pt}{-16pt plus 2pt minus 2pt}{8pt plus 2pt minus 2pt}

\titleformat{\section}[block]{\normalfont\bfseries}{\makebox[1cm][l]{\thesection}}{0pt}{}
\titlespacing*{\section}{0pt}{12pt plus 2pt minus 2pt}{6pt plus 2pt minus 2pt}

\titleformat{\subsection}[block]{\normalfont\bfseries}{\makebox[1cm][l]{\thesubsection}}{8pt}{}
\titlespacing{\subsection}{0pt}{12pt plus 2pt minus 2pt}{6pt plus 2pt minus 2pt}

\titleformat{\subsubsection}[block]{\bfseries\sffamily}{\makebox[1cm][l]{\thesubsubsection}}{0pt}{}
\titlespacing*{\subsubsection}{0pt}{12pt plus 2pt minus 2pt}{6pt plus 2pt minus 2pt}

\titleformat{\paragraph}[block]{\bfseries\sffamily}{\makebox[1cm][l]{\theparagraph}}{0pt}{}
\titlespacing*{\paragraph}{0pt}{12pt plus 2pt minus 2pt}{6pt plus 2pt minus 2pt}

\titleformat{\subparagraph}[block]{\bfseries\sffamily}{\makebox[1cm][l]{\thesubparagraph}}{0pt}{}
\titlespacing*{\subparagraph}{0pt}{12pt plus 2pt minus 2pt}{6pt plus 2pt minus 2pt}

% Numberless sectioning formatting (sub headings)
\titleformat{name=\section,numberless}{\itshape}{}{0pt}{}
\titlespacing{name=\section,numberless}{0pt}{4pt plus 2pt minus 2pt}{4pt plus 2pt minus 2pt}

\titleformat{name=\subsection,numberless}{\itshape}{}{0pt}{}
\titlespacing{name=\subsection,numberless}{0pt}{4pt plus 2pt minus 2pt}{4pt plus 2pt minus 2pt}

\titleformat{name=\subsubsection,numberless}{\itshape}{}{0pt}{}
\titlespacing{name=\subsubsection,numberless}{0pt}{4pt plus 2pt minus 2pt}{4pt plus 2pt minus 2pt}

% Hurenkinder und Schusterjungen verhindern
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

% _______________ Environments _______________

% Define Headers and Footers for main part
\newenvironment{content}{
    \setlength{\parskip}{10pt}%
    \pagenumbering{arabic}
    \newgeometry{left=2.9cm, top=2.9cm, bottom=2cm, right=2.9cm} % To avoid the header rule to end before content text width
    \setcounter{page}{1}
}{}

% Define Headers and Footers for last part
\newenvironment{backmatter}{
    \setlength{\parskip}{10pt}%
    \newgeometry{left=2.9cm, top=2.9cm, bottom=2cm, right=2.9cm}
    \pagestyle{fancyplain}
    \fancyhf{}
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \clearpage{\thispagestyle{empty}\cleardoublepage}
}{}

% Itemization formatting
\setlist[itemize]{label={$-$}, labelindent=24pt,labelsep=18pt,leftmargin=*,topsep=0pt}
\setlist[enumerate,1]{label={\arabic*.},align=left,labelindent=24pt,labelsep=18pt,leftmargin=*,topsep=0pt}

% Format of equation numbering
\renewcommand{\theequation}{\thechapter.\arabic{equation}}

% _______________ Commands _______________

% Commands for customizing the title page
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\course}[1]{\def\@course{#1}}
\newcommand{\id}[1]{\def\@id{#1}}
\newcommand{\city}[1]{\def\@city{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\field}[1]{\def\@field{#1}}
\newcommand{\professor}[1]{\def\@professor{#1}}
\newcommand{\country}[1]{\def\@country{#1}}
% If blankpage is required
\newcommand\blankpage{\null\thispagestyle{empty}\addtocounter{page}{-1}\newpage}

% Commands for writing the manual
\newcommand{\com}[1]{\texttt{\textbackslash {#1}}}
\newcommand{\combrac}[2]{\texttt{\textbackslash{#1}\{#2\}}}


% _______________ Colours _______________

\definecolor{ercis-red}{RGB}{133,35,57}
\definecolor{wwu-black}{RGB}{62,62,59}
\definecolor{wwu-green}{RGB}{0,142,150}
\definecolor{wwu-lightgreen}{RGB}{122,181,22}
\definecolor{wwu-blue}{RGB}{0,110,137}
\definecolor{wwu-lightblue}{RGB}{0,157,209}
\definecolor{statopt-green1}{HTML}{5bbb56}
\definecolor{statopt-green2}{HTML}{8dbb56}
\definecolor{statopt-iceblue}{HTML}{56bbb7}
\definecolor{statopt-darkblue}{HTML}{567cbb}
\definecolor{statopt-pink}{HTML}{f36196}
\definecolor{statopt-coral}{HTML}{f88379}
\definecolor{statopt-rose}{HTML}{FFC0CB}
\definecolor{statopt-purple}{HTML}{880085}
\definecolor{statopt-mud}{HTML}{b5bb56}
\definecolor{statopt-ocher}{HTML}{bbb056}
\definecolor{statopt-grey}{HTML}{929292}

\definecolor{code-background}{rgb}{0.95, 0.95, 0.96}

% _______________ Configurations _______________

\hypersetup{
  colorlinks=true,
  linkcolor=black,
  anchorcolor=black,
  citecolor=black,
  menucolor=black,
  urlcolor=black,
}

% _______________ Licenses _______________

\newcommand{\cLizenz}{\ifthenelse{\equal{\statopt@license}{cc-by-sa}}{
		\typeout{}
		\typeout{statopt: License is CC BY-SA}
		\typeout{}
		\newline
		\includegraphics[width=2cm]{settings/cc-icons/cc-by-sa.png}\newline
		\cLizenzTemplate{\href{https://creativecommons.org/licenses/by-sa/4.0/legalcode}{Attribution-ShareAlike 4.0 International}}
	}{
		\ifthenelse{\equal{\statopt@license}{cc-by}}{
			\typeout{}
			\typeout{statopt: License is CC BY}
			\typeout{}
			\newline
			\includegraphics[width=2cm]{settings/cc-icons/cc-by.png}
			\cLizenzTemplate{\href{https://creativecommons.org/licenses/by/4.0/legalcode}{Attribution 4.0 International}}
		}{
			\ifthenelse{\equal{\statopt@license}{cc0}}{
				\typeout{}
				\typeout{statopt: License is Public Domain}
				\typeout{}
				\newline
				\includegraphics[width=2cm]{settings/cc-icons/cc-zero.png}
				\cLizenzTemplate{\href{https://creativecommons.org/publicdomain/zero/1.0/legalcode}{CC0 1.0 Universal}}
			}{
				\typeout{}
				\typeout{statopt: All rights reserved}
				\typeout{}
}}}}



% _______________ Titlepage _______________

% Title page for different chairs:

\newcommand{\englishChairIntro}[1]{\def\@englishChairIntro{#1}}
\newcommand{\germanChairIntro}[1]{\def\@germanChairIntro{#1}}
\newcommand{\spanishChairIntro}[1]{\def\@spanishChairIntro{#1}}
\newcommand{\englishChair}[1]{\def\@englishChair{#1}}
\newcommand{\germanChair}[1]{\def\@germanChair{#1}}
\newcommand{\spanishChair}[1]{\def\@spanishChair{#1}}


\ifthenelse{\equal{\statopt@chair}{uach}}{
  \englishChairIntro{Chairs for Data Science:}
  \germanChairIntro{Lehrstühle für Data Science:}
  \spanishChairIntro{Trabajo de titulacion:}
  \spanishChair{algo \\ algo}
}{
\ifthenelse{\equal{\statopt@chair}{datascience}}{
  \englishChairIntro{Chairs for Data Science:}
  \germanChairIntro{Lehrstühle für Data Science:}
  \spanishChairIntro{Catedra de ciencia de datos:}
  \spanishChair{Estadistica y optimizacion \\ & ML y Ingenieria de datos}
}{
  \englishChairIntro{Chair for Data Science:}
  \germanChairIntro{Lehrstuhl für Data Science:}
  \spanishChairIntro{Catedra de ciencia de datos:}


\ifthenelse{\equal{\statopt@chair}{statistics}}{
    \englishChair{Statistics and Optimization}
    \germanChair{Statistik und Optimierung}
    \spanishChair{Estadistica y optimizacion}
}{

\ifthenelse{\equal{\statopt@chair}{machineLearning}}{
    \englishChair{Machine Learning and \\ & Data Engineering}
    \germanChair{Maschinelles Lernen und \\ & Data Engineering}
    \spanishChair{Inteligencia artificial y \\ & ingenieria datos}
}{

\ifthenelse{\equal{\statopt@chair}{datascience}}{
    \englishChair{Statistics and Optimization \\ & ML and Data Engineering}
    \germanChair{Statistik und Optimierung \\ & ML und Data Engineering}
    \spanishChair{Estadistica y optimizacion \\ & ML y Ingenieria de datos}
}{
\ifthenelse{\equal{\statopt@chair}{dips}}{
    \englishChair{and the Public Sector}
    \germanChair{and the Public Sector}
    \spanishChair{and the Public Sector}
    \englishChairIntro{Chair for Digital Innovation}
    \germanChairIntro{Lehrstuhl für Digital Innovation}
    \spanishChairIntro{Catedra Digital Innovation}
}{
{\ClassError{statopt}{Unknown chair ``\statopt@chair'' specified}{}}
} 
}
}
}
}
}
% English Page
\newcommand{\englishTitle}{
  \newgeometry{left=2cm, top=3cm, bottom=3cm, right=2cm}
  \begin{titlepage}
    \centering
    \vspace{0.3cm}
    {\scshape\Large University of M\"unster}\par
    \vspace{-3mm}
    {\scshape\large Department of Information Systems}\par
    \vspace{1cm}
    {\textcolor{gray}{\rule{0.9\textwidth}{0.5mm}}}
    \vspace*{0.5cm}
    \begin{center}
        \begin{minipage}{0.9\textwidth}
            \begin{center}
                {\LARGE\parindent0pt
                \begin{spacing}{1.13}
                    \@title
                \end{spacing}}\par
            \end{center}
        \end{minipage}
    \end{center}
    \vspace*{-0.3cm}
    {\textcolor{gray}{\rule{0.9\textwidth}{0.5mm}}}\par
    \vspace{1.5cm}
    \begin{center}
        \begin{minipage}{0.9\textwidth}
            \begin{center}
                \@thesistype
            \end{center}
        \end{minipage}
    \end{center}
    \vspace{0.4cm}
    {submitted by}\par
    \vspace{0.4cm}
    {\LARGE{\@author}}\par
    \vspace{-0.5cm}
    \ifthenelse{\equal{\statopt@chair}{statistics}}{
        \vfill
        \begin{figure}[b!]
            \centering
            \includegraphics[width=4.5cm]{settings/Logos/LS_logo.png}
        \end{figure}
    }
    {\ifthenelse{\equal{\statopt@chair}{machineLearning}}{
        \vfill
        \begin{minipage}{0.7\textwidth}
            \centering
            \large{\textsc{Chair of Data Science: \\
            Machine Learning and Data Engineering}}
        \end{minipage}
    }
    {\ifthenelse{\equal{\statopt@chair}{datascience}}{
        \vfill
        \begin{minipage}{\textwidth}
            \centering
            \large{\textsc{Chairs of Data Science: \\
            Statistics and Optimization \& \\
            Machine Learning and Data Engineering}}
        \end{minipage}
    }
    {\ifthenelse{\equal{\statopt@chair}{dips}}{
        \vfill
        \begin{figure}[b!]
            \centering
            \includegraphics[width=6.5cm]{settings/Logos/DIPS_ext.png}
        \end{figure}
    }
    { \ClassError{statopt}{Unknown chair ``\statopt@chair'' specified}{}}
    }
    }
    }
  \end{titlepage}
  \restoregeometry{}
}


\newcommand{\englishBacktitle}{
        \newgeometry{left=2cm, top=3cm, bottom=3cm, right=2cm}
        \newpage
        \thispagestyle{empty}
        \vspace*{\fill}
        {\raggedright
        \begin{center}
            \begin{tabular}{p{5.5cm}|p{7cm}}
                \hfill \textbf{Principal Supervisor} & \textsc{\@professor}\\
                \ifthenelse{\equal{\statopt@supervisor}{supervisor}
                }{\hfill \textbf{Supervisor} & \textsc{\@supervisor} \\}{}
                & \@englishChairIntro \\
                & \@englishChair \\
                \\
                \hfill \textbf{Matriculation Number} & \@id \\
                \hfill \textbf{Field of Study} & \@field \\
                \hfill \textbf{Contact Details} & \href{mailto:\@email}{\@email} \\
                \hfill \textbf{Submission Date}  & \@date \\
            \end{tabular}\par
      \end{center}
        }
        \newpage
        \restoregeometry{}
        }

% German Page
\newcommand{\germanTitle}{
  \newgeometry{left=2cm, top=3cm, bottom=3cm, right=2cm}
  \begin{titlepage}
    \centering
    \vspace{0.5cm}
    {\scshape\Large Westf\"alische Wilhelms-Universit\"at M\"unster}\par
    {\scshape\large Institut für Wirtschaftsinformatik}\par
    \vspace{1cm}
    {\textcolor{gray}{\rule{0.9\textwidth}{0.5mm}}}
    \vspace*{0.5cm}
    \begin{center}
      \begin{minipage}{0.9\textwidth}
        \begin{center}
          {\LARGE\parindent0pt
          \begin{spacing}{1.13}
            \@title
          \end{spacing}}\par
        \end{center}
      \end{minipage}
    \end{center}
    \vspace*{-0.3cm}
    {\textcolor{gray}{\rule{0.9\textwidth}{0.5mm}}}\par
    \vspace{1.5cm}
    \begin{center}
        \begin{minipage}{0.75\textwidth}
            \begin{center}
                \@thesistype
            \end{center}
        \end{minipage}
    \end{center}
    \vspace{0.5cm}
    {eingereicht von}\par
    \vspace{0.5cm}
    {\LARGE{\@author}}\par
    \vspace{-0.3cm}
    \ifthenelse{\equal{\statopt@chair}{statistics}}{
        \vfill
        \begin{figure}[b!]
            \centering
            \includegraphics[width=4.5cm]{settings/Logos/LS_logo.png}
        \end{figure}
    }{\ifthenelse{\equal{\statopt@chair}{machineLearning}}{
        \vfill
        \begin{minipage}{0.7\textwidth}
            \centering
            \large{\textsc{Lehrstuhl für Data Science: \\
            Machine Learning und Data Engineering}}
        \end{minipage}
    }{\ifthenelse{\equal{\statopt@chair}{datascience}}{
        \vfill
        \begin{minipage}{\textwidth}
            \centering
            \large{\textsc{Lehrstühle für Data Science: \\
            Statistik und Optimierung \& \\
            Machine Learning und Data Engineering}}
        \end{minipage}
    }
    \ifthenelse{\equal{\statopt@chair}{dips}}{
        \vfill
        \begin{figure}[b!]
            \centering
            \includegraphics[width=6.5cm]{settings/Logos/DIPS_ext.png}
        \end{figure}
    }
    { \ClassError{statopt}{Unknown chair ``\statopt@chair'' specified}{}
    }}}
  \end{titlepage}
  \restoregeometry{}
}


\newcommand{\germanBacktitle}{
        \newgeometry{left=2cm, top=3cm, bottom=3cm, right=2cm}
        \newpage
        \thispagestyle{empty}
        \vspace*{\fill}
        {\raggedright
        \begin{center}
            \begin{tabular}{p{5.5cm}|p{7cm}}
                \hfill \textbf{Themensteller} & \textsc{\@professor}\\
                \ifthenelse{\equal{\statopt@supervisor}{supervisor}
                }{\hfill \textbf{Betreuer} & \textsc{\@supervisor} \\}{}
                & \@germanChairIntro \\
                & \@germanChair \\
                \\
                \hfill \textbf{Matrikelnummer} & \@id \\
                \hfill \textbf{Studienfach} & \@field \\
                \hfill \textbf{Kontaktdetails} & \href{mailto:\@email}{\@email}\\
                \hfill \textbf{Abgabedatum}  & \@date \\
            \end{tabular}\par
      \end{center}
        }
        \newpage
        \restoregeometry{}
        }

% Español
\newcommand{\spanishTitle}{
  \newgeometry{left=2cm, top=3cm, bottom=3cm, right=2cm}
  \begin{titlepage}
    \centering
    \vspace{0.3cm}
    {\scshape\Large Universidad Austral de Chile}\par
    \vspace{-3mm}
    {\scshape\large Departamento de Electricidad y Electronica}\par
    \vspace{1cm}
    {\textcolor{gray}{\rule{0.9\textwidth}{0.5mm}}}
    \vspace*{0.5cm}
    \begin{center}
        \begin{minipage}{0.9\textwidth}
            \begin{center}
                {\LARGE\parindent0pt
                \begin{spacing}{1.13}
                    \@title
                \end{spacing}}\par
            \end{center}
        \end{minipage}
    \end{center}
    \vspace*{-0.3cm}
    {\textcolor{gray}{\rule{0.9\textwidth}{0.5mm}}}\par
    \vspace{1.5cm}
    \begin{center}
        \begin{minipage}{0.9\textwidth}
            \begin{center}
                \@thesistype
            \end{center}
        \end{minipage}
    \end{center}
    \vspace{0.4cm}
    {Escrito por:}\par
    \vspace{0.4cm}
    {\LARGE{\@author}}\par
    \vspace{-0.5cm}
    \ifthenelse{\equal{\statopt@chair}{uach}}{
        \vfill
        \begin{figure}[b!]
            \centering
            \includegraphics[width=10.5cm]{settings/Logos/logo_uach.jpg}
        \end{figure}
        \begin{minipage}{0.7\textwidth}
            \centering
            %\large{\textsc{Chair of Data Science: \\
            %Machine Learning and Data Engineering}}
        \end{minipage}
    }
    {
    \ifthenelse{\equal{\statopt@chair}{statistics}}{
        \vfill
        \begin{figure}[b!]
            \centering
            \includegraphics[width=4.5cm]{settings/Logos/LS_logo.png}
        \end{figure}
    }
    {\ifthenelse{\equal{\statopt@chair}{machineLearning}}{
        \vfill
        \begin{minipage}{0.7\textwidth}
            \centering
            \large{\textsc{Chair of Data Science: \\
            Machine Learning and Data Engineering}}
        \end{minipage}
    }
    {\ifthenelse{\equal{\statopt@chair}{datascience}}{
        \vfill
        \begin{minipage}{\textwidth}
            \centering
            \large{\textsc{Chairs of Data Science: \\
            Statistics and Optimization \& \\
            Machine Learning and Data Engineering}}
        \end{minipage}
    }
    {\ifthenelse{\equal{\statopt@chair}{dips}}{
        \vfill
        \begin{figure}[b!]
            \centering
            \includegraphics[width=6.5cm]{settings/Logos/DIPS_ext.png}
        \end{figure}
    }
    
    { \ClassError{statopt}{Unknown chair ``\statopt@chair'' specified}{}}
    }
    }
    }
    }
  \end{titlepage}
  \restoregeometry{}
}


\newcommand{\spanishBacktitle}{
        \newgeometry{left=2cm, top=3cm, bottom=3cm, right=2cm}
        \newpage
        \thispagestyle{empty}
        \vspace*{\fill}
        {\raggedright
        \begin{center}
            \begin{tabular}{p{5.5cm}|p{7cm}}
                \hfill \textbf{Principal supervisor} & \textsc{\@professor}\\
                \ifthenelse{\equal{\statopt@supervisor}{supervisor}
                }{\hfill \textbf{Supervisor} & \textsc{\@supervisor} \\}{}
                & \@spanishChairIntro \\
                & \@spanishChair \\
                \\
                \hfill \textbf{Matriculation Number} & \@id \\
                \hfill \textbf{Field of Study} & \@field \\
                \hfill \textbf{Contact Details} & \href{mailto:\@email}{\@email} \\
                \hfill \textbf{Submission Date}  & \@date \\
            \end{tabular}\par
      \end{center}
        }
        \newpage
        \restoregeometry{}
        }


% _______________ Declaration of Authorship _______________

\newcommand{\signatures}[1]{
    \@city, \ \@date
    \vskip 3em
  \begin{tabular}{@{}p{2in}@{}}
    \hrulefill \\
    \ifstatopt@multiauthor #1
    \else \@author
    \fi
    \\
  \end{tabular}
}

% English Form
\newcommand{\englishDeclaration}{
  \newpage
  \thispagestyle{empty}
  \Large{\textbf{Declaration of Authorship}}
  \vskip 1em
  \normalsize{
     \ifstatopt@multiauthor We hereby declare that, to the best of our knowledge and belief, this thesis titled \textit{\@title} is our own, independent work. We confirm that each significant contribution to and quotation in this thesis that originates from the work or works of others is indicated by proper use of citation and references; this also holds for tables and graphical works.
     \else I hereby declare that, to the best of my knowledge and belief, this thesis titled \textit{\@title} is my own, independent work. I confirm that each significant contribution to and quotation in this thesis that originates from the work or works of others is indicated by proper use of citation and references; this also holds for tables and graphical works.
     \fi
     \vskip 1em
     \signatures{Signatures}
  }
    \vspace*{\fill}
    \cLizenz
}

% German Form
\newcommand{\germanDeclaration}{
  \thispagestyle{empty}
  \Large{\textbf{Abschließende Erklärung}}
  \vskip 1em
  \normalsize{
    \ifstatopt@multiauthor Wir versichern hiermit, dass wir die Arbeit \textit{\@title} selbständig und ohne fremde Hilfe angefertigt haben und dass wir alle von anderen Autoren wörtlich übernommenen Stellen wie auch die sich an die Gedankengänge anderer Autoren eng anlehnenden Ausführungen unserer Arbeit besonders gekennzeichnet und die Quellen zitiert haben; dies gilt auch für Tabellen, Skizzen, Zeichnungen, bildliche Darstellungen usw.
    \else Ich versichere hiermit, dass ich meine Arbeit \textit{\@title} selbständig und ohne fremde Hilfe angefertigt habe und dass ich alle von anderen Autoren wörtlich übernommenen Stellen wie auch die sich an die Gedankengänge anderer Autoren eng anlehnenden Ausführungen meiner Arbeit besonders gekennzeichnet und die Quellen zitiert habe; dies gilt auch für Tabellen, Skizzen, Zeichnungen, bildliche Darstellungen usw.
    \fi
    \vskip 1em
    \signatures{Unterschriften}
  }
    \vspace*{\fill}
    \cLizenz
}

% spanish Form
\newcommand{\spanishDeclaration}{
  \newpage
  \thispagestyle{empty}
  \Large{\textbf{Declaration of Authorship}}
  \vskip 1em
  \normalsize{
     \ifstatopt@multiauthor We hereby declare that, to the best of our knowledge and belief, this thesis titled \textit{\@title} is our own, independent work. We confirm that each significant contribution to and quotation in this thesis that originates from the work or works of others is indicated by proper use of citation and references; this also holds for tables and graphical works.
     \else I hereby declare that, to the best of my knowledge and belief, this thesis titled \textit{\@title} is my own, independent work. I confirm that each significant contribution to and quotation in this thesis that originates from the work or works of others is indicated by proper use of citation and references; this also holds for tables and graphical works.
     \fi
     \vskip 1em
     \signatures{Signatures}
  }
    \vspace*{\fill}
    \cLizenz
}


% _______________ Consent Form _______________

% English Consent
\newcommand{\englishConsent}{
  \newpage
  \thispagestyle{empty}
  \setlength{\parindent}{0cm}
  \Large{\textbf{Consent Form}}\par
  \vspace{3mm}
  \normalsize{
  \textbf{Name:} \@author \\
  \textbf{Title of Thesis:} \@title

  \textbf{What is plagiarism?} Plagiarism is defined as submitting someone else’s work or ideas as your own without a complete indication of the source. It is hereby irrelevant whether the work of others is copied word by word without acknowledgment of the source, text structures (e.g. line of argumentation or outline) are borrowed or texts are translated from a foreign language.\par
  \textbf{Use of plagiarism detection software.} The examination office uses plagiarism software to check each submitted bachelor and master thesis for plagiarism. For that purpose the thesis is electronically forwarded to a software service provider where the software checks for potential matches between the submitted work and work from other sources. For future comparisons with other theses, your thesis will be permanently stored in a database. Only the School of Business and Economics of the University of Münster is allowed to access your stored thesis. The student agrees that his or her thesis may be stored and reproduced only for the purpose of plagiarism assessment. The first examiner of the thesis will be advised on the outcome of the plagiarism assessment.\par
  \textbf{Sanctions} Each case of plagiarism constitutes an attempt to deceive in terms of the examination regulations and will lead to the thesis being graded as “failed”. This will be communicated to the examination office where your case will be documented. In the event of a serious case of deception the examinee can be generally excluded from any further examination. This can lead to the exmatriculation of the student. Even after completion of the examination procedure and graduation from university, plagiarism can result in a withdrawal of the awarded academic degree.\par
  \ifstatopt@multiauthor We confirm that we have read and understood the information in this document. We agree to the outlined procedure for plagiarism assessment and potential sanctioning.
  \else I confirm that I have read and understood the information in this document. I agree to the outlined procedure for plagiarism assessment and potential sanctioning.
  \fi\par
  \signatures{Signatures}
  }
}

% German Consent
\newcommand{\germanConsent}{
  \newpage
  \thispagestyle{empty}
  \setlength{\parindent}{0cm}
  \Large{\textbf{Einverständniserklärung}}\par
  \vspace{3mm}
  \normalsize{
  \textbf{Name:} \@author\\
  \textbf{Titel der Arbeit:} \@title

  \textbf{Was ist ein Plagiat?} Als ein Plagiat wird eine Übernahme fremden Gedankengutes in die eigene Arbeit angesehen, bei der die Quelle, aus der die Übernahme erfolgt, nicht kenntlich gemacht wird.Es ist dabei unerheblich, ob z.B. fremde Texte wörtlich übernommen werden, nur Strukturen (z.B. argumentative Figuren oder Gliederungen) aus fremden Quellen entlehnt oder Texte aus einer Fremdsprache übersetzt werden.\par
  \textbf{Softwarebasierte Überprüfung.} Alle Bachelor- und Masterarbeiten werden vom Prüfungsamt mit Hilfe einer entsprechenden Software auf Plagiate geprüft. Die Arbeit wird zum Zweck der Plagiatsprüfung an einen Software-Dienstleister übermittelt und dort auf Übereinstimmung mit anderen Quellen geprüft. Zum Zweck eines zukünftigen Abgleichs mit anderen Arbeiten wird die Arbeit dauerhaft in einer Datenbank gespeichert. Ein Abruf der Arbeit ist ausschließlich durch die Wirtschaftswissenschaftliche Fakultät der Westfälischen Wilhelms-Universität Münster. Der Studierende erklärt sich damit einverstanden, dass allein zum beschriebenen Zweck der Plagiatsprüfung die Arbeit dauerhaft gespeichert und vervielfältigt werden darf. Das Ergebnis der elektronischen Plagiatsprüfung wird dem Erstgutachter mitgeteilt.\par
  \textbf{Sanktionen} Liegt ein Plagiat vor, ist dies ein Täuschungsversuch i.S. der Prüfungsordnung, durch den die Prüfungsleistung als „nicht bestanden“ gewertet wird. Es erfolgt eine Mitteilung an das Prüfungsamt und die dortige Dokumentation. In schwerwiegenden Täuschungsfällen kann der Prüfling von der Prüfung insgesamt ausgeschlossen werden. Dies kann unter Umständen die Exmatrikulation bedeuten. Plagiate können auch nach Abschluss des Prüfungsverfahrens und Verleihung des Hochschulgrades zum Entzug des erworbenen Grades führen. \par
  \ifstatopt@multiauthor Hiermit erklären wir, dass wir die obigen Ausführungen gelesen haben und mit dem Verfahren zur Aufdeckung und Sanktionierung von Plagiaten einverstanden sind.
  \else Hiermit erkläre ich, dass ich die obigen Ausführungen gelesen habe und mit dem Verfahren zur Aufdeckung und Sanktionierung von Plagiaten einverstanden bin.
  \fi\par
  \signatures{Unterschriften}
  }
}

% Spanish Consent
\newcommand{\spanishConsent}{
  \newpage
  \thispagestyle{empty}
  \setlength{\parindent}{0cm}
  \Large{\textbf{Formulario de consentimiento}}\par
  \vspace{3mm}
  \normalsize{
  \textbf{Nombre:} \@author \\
  \textbf{Titulo de la tesis:} \@title

  \textbf{¿Que es plagio?} El término plagio se define en el Diccionario de la Real Academia Española como la "acción de copiar en lo sustancial obras ajenas, dándolas como propias". Desde el punto de vista legal es una infracción al derecho de autor acerca de una obra artística o intelectual de cualquier tipo, en la que se incurre cuando se presenta una obra ajena como propia u original.\par
  \textbf{Uso de software de detección de plagio.} La oficina de examen utiliza un software de plagio para verificar cada tesis de licenciatura y maestría presentada en busca de plagio. Para ese propósito, la tesis se envía electrónicamente a un proveedor de servicios de software donde el software verifica posibles coincidencias entre el trabajo presentado y el trabajo de otras fuentes. Para futuras comparaciones con otras tesis, su tesis se almacenará permanentemente en una base de datos. Solo la Universidad Austral de Chile puede acceder a su tesis almacenada. El estudiante acepta que su tesis puede almacenarse y reproducirse solo con el propósito de evaluar el plagio. Se informará al primer examinador de la tesis sobre el resultado de la evaluación de plagio.\par
  \textbf{Sanciones} Cada caso de plagio constituye un intento de engaño en cuanto a las normas de examen y dará lugar a la calificación de la tesis como “suspenso”. Esto se comunicará a la oficina de examen donde se documentará su caso. En el caso de un caso grave de engaño, generalmente se puede excluir al examinado de cualquier examen posterior. Esto puede conducir a la exmatriculación del estudiante. Incluso después de completar el procedimiento de examen y graduarse de la universidad, el plagio puede resultar en el retiro del título académico otorgado.\par
  \ifstatopt@multiauthor Confirmamos que hemos leído y comprendido la información contenida en este documento. Estamos de acuerdo con el procedimiento descrito para la evaluación del plagio y la posible sanción.
  \else Confirmo que he leído y comprendido la información contenida en este documento. Acepto el procedimiento descrito para la evaluación del plagio y la posible sanción.
  \fi\par
  \signatures{Signatures}
  }
}


