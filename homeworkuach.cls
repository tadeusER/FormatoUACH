% ============================================================
%
% LaTeX class for homework assignments at UACh
% Based on statopt-thesis template by Enrique Ramirez
%
% Author: Enrique Ramirez
% Version: 1.0
% Date: 2024/04/27
%
% ============================================================

\def\fileversion{1.0}
\def\filedate{2024/04/27}

% ============================================================

% _______________ Class Definition _______________

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homeworkuach}[2024/04/27 UACh Homework Class]

% Basic class options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=homework,
    prefix=homework@
}

% Options
\DeclareStringOption[spanish]{language}[spanish]
\DeclareStringOption{class}
\DeclareStringOption{professor}
\DeclareStringOption{duedate}
\DeclareBoolOption{solution}

% Process options
\ProcessKeyvalOptions*

% Load base class
\LoadClass[12pt,letterpaper]{article}

% _______________ Required Packages _______________

% Document geometry
\RequirePackage[letterpaper,margin=2.5cm]{geometry}

% Language support
\RequirePackage[spanish,es-tabla]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

% Math packages
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

% Graphics and colors
\RequirePackage{graphicx}
\RequirePackage{xcolor}

% Lists and tables
\RequirePackage{enumitem}
\RequirePackage{array}
\RequirePackage{booktabs}

% Headers and footers
\RequirePackage{fancyhdr}

% Hyperlinks
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=cyan,
    citecolor=blue
}

% _______________ Custom Commands _______________

% Course information
\newcommand{\class}[1]{\def\@class{#1}}
\newcommand{\professor}[1]{\def\@professor{#1}}
\newcommand{\duedate}[1]{\def\@duedate{#1}}
\newcommand{\homework}[1]{\def\@homework{#1}}
\newcommand{\student}[1]{\def\@student{#1}}

% Logo
\newcommand{\logo}{%
    \begin{center}
        \includegraphics[width=0.4\textwidth]{uach_logo}
    \end{center}
}

% Custom title
\renewcommand{\maketitle}{%
    \begin{center}
        \includegraphics[width=0.4\textwidth]{uach_logo}
        \vspace{0.5cm}
        
        {\Large\textbf{Universidad Austral de Chile}}\\
        \vspace{0.3cm}
        {\large Facultad de Ciencias de la Ingeniería}\\
        \vspace{0.5cm}
        
        {\Large\textbf{\@homework}}\\
        \vspace{0.3cm}
        
        {\large\@class}\\
        \vspace{0.2cm}
        {\large Profesor: \@professor}\\
        \vspace{0.2cm}
        {\large Fecha de entrega: \@duedate}\\
        \vspace{0.3cm}
        
        {\large\textbf{Nombre:} \@student}\\
    \end{center}
    \vspace{1cm}
}

% Custom sections for problems
\newcounter{problemnumber}
\newcommand{\problem}{%
    \stepcounter{problemnumber}%
    \section*{Problema \theproblemnumber}%
}

% Solution environment
\newenvironment{solution}{%
    \ifdefined\homework@solution
        \textbf{Solución:}\\
    \fi
}{%
    \ifdefined\homework@solution
        \vspace{0.5cm}
    \fi
}

% _______________ Page Style _______________

\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\@class}
\fancyhead[R]{\@homework}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

% _______________ Theorem-like Environments _______________

\theoremstyle{definition}
\newtheorem{definition}{Definición}[section]
\newtheorem{example}{Ejemplo}[section]
\newtheorem{exercise}{Ejercicio}[section]

\theoremstyle{plain}
\newtheorem{theorem}{Teorema}[section]
\newtheorem{lemma}[theorem]{Lema}
\newtheorem{proposition}[theorem]{Proposición}
\newtheorem{corollary}[theorem]{Corolario}

\theoremstyle{remark}
\newtheorem*{remark}{Observación}
\newtheorem*{note}{Nota}

% _______________ List Settings _______________

\setlist[enumerate]{labelindent=\parindent}
\setlist[itemize]{labelindent=\parindent}

% _______________ Math Operators _______________

\DeclareMathOperator{\sen}{sen}
\DeclareMathOperator{\arcsen}{arcsen}
\DeclareMathOperator{\arccos}{arccos}
\DeclareMathOperator{\arctan}{arctan}
\DeclareMathOperator{\senh}{senh}
\DeclareMathOperator{\cosh}{cosh}
\DeclareMathOperator{\tanh}{tanh}

\endinput
