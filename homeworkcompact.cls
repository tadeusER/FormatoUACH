%% homeworkcompact.cls
%% Clase compacta para tareas/homework
%% Versión 1.1

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homeworkcompact}[2025/11/14 v1.1 Clase compacta para tareas]

% Clase base
\LoadClass[11pt]{article}

% Paquetes requeridos
\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{times}
\RequirePackage{amsmath, amssymb, amsthm}
\RequirePackage{cancel}
\RequirePackage{graphicx}
\RequirePackage{mathrsfs}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{mdframed}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{hyperref}

% Configuración de hyperref
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=blue,
}

% Comandos personalizados para vectores unitarios
\newcommand{\ihat}{\mathbf{\hat{\imath}}}
\newcommand{\jhat}{\mathbf{\hat{\jmath}}}
\newcommand{\khat}{\mathbf{\hat{k}}}

% Variables para información del estudiante y curso
\def\@studentname{Nombre del Estudiante}
\def\@coursename{Curso}
\def\@homeworktitle{Tarea}

\newcommand{\studentname}[1]{\def\@studentname{#1}}
\newcommand{\coursename}[1]{\def\@coursename{#1}}
\newcommand{\homeworktitle}[1]{\def\@homeworktitle{#1}}

% Configuración del encabezado
\pagestyle{fancy}
\fancyhf{} % Limpiar encabezados y pies
\lhead{\@studentname}
\chead{\Large\textbf{\@homeworktitle}\normalsize}
\rhead{\@coursename}
\cfoot{\thepage}

% Estilo para primera página
\fancypagestyle{plain}{
    \fancyhf{}
    \lhead{\@studentname}
    \chead{\Large\textbf{\@homeworktitle}\normalsize}
    \rhead{\@coursename}
    \cfoot{\thepage}
}

% Entorno para problemas
\newcounter{problemnumber}
\setcounter{problemnumber}{1}
\newcommand{\theproblem}{\arabic{problemnumber}}

\newenvironment{problem}[1][]{
    \begin{mdframed}[
        backgroundcolor=gray!15,
        linewidth=0pt,
        innertopmargin=8pt,
        innerbottommargin=8pt,
        skipabove=10pt,
        skipbelow=5pt
    ]
    \ifx&#1&
        \textbf{Problema \theproblem}\\[4pt]
        \stepcounter{problemnumber}
    \else
        \textbf{Problema #1}\\[4pt]
    \fi
}{
    \end{mdframed}
}

% Entorno para soluciones
\newenvironment{solution}{
    \vspace{5pt}
    \noindent\textbf{Solución:}\\[2pt]
}{
    \vspace{10pt}
}

% Entorno para respuestas cortas (más compacto)
\newenvironment{answer}{
    \vspace{3pt}
    \noindent\textit{Respuesta:}\ 
}{
    \vspace{8pt}
}

% Comando para subsecciones de problemas
\newcommand{\subproblem}[1]{
    \vspace{5pt}
    \noindent\textbf{(#1)}\ 
}

% Reducir espacio entre ítems en listas
\setlist[enumerate]{topsep=5pt, itemsep=3pt, parsep=0pt}
\setlist[itemize]{topsep=5pt, itemsep=3pt, parsep=0pt}

\endinput