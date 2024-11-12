\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reportuach}[2024/10/29 Formato de Reporte Personalizado]

% Clase base
\LoadClass[12pt]{article}

% Paquetes requeridos
\RequirePackage[utf8x]{inputenc}
\RequirePackage[spanish]{babel}
\RequirePackage{amssymb,amsmath,amsthm,amsfonts}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage{subfig}
\RequirePackage{gensymb}
\RequirePackage{url}
\RequirePackage{parskip}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{vmargin}
\RequirePackage{subcaption}
\RequirePackage{float}
\RequirePackage{csquotes}
% Definir el comando para la ruta de subdirectorio
\newcommand{\subdirpath}{formato}
\newcommand{\setsubdirpath}[1]{\renewcommand{\subdirpath}{#1}}

% Configuración de rutas de gráficos
\graphicspath{{\subdirpath/}}

% Configuración de márgenes
\setmarginsrb{3 cm}{2.5 cm}{3 cm}{2.5 cm}{1 cm}{1.5 cm}{1 cm}{1.5 cm}

% Variables para almacenar título, tema y autor
\def\thetitle{}
\def\thetopic{}
\def\theauthor{}

% Definición de comandos personalizados
\renewcommand{\title}[1]{\def\thetitle{#1}\def\@title{#1}}
\newcommand{\ttitle}[1]{\title{#1}}
\newcommand{\topic}[1]{\def\thetopic{#1}}
\renewcommand{\author}[1]{\def\theauthor{#1}\def\@author{#1}}

% Configuración del estilo de página
\pagestyle{fancy}
\fancyhf{}
\rhead{\theauthor}
\lhead{\thetitle}
\cfoot{\thepage}

% Definición del comando para la portada
\renewcommand{\maketitle}{
    \begin{titlepage}
        \centering
        \vspace*{0.0 cm}
        \includegraphics[scale = 0.3]{\subdirpath/logos/logo_uach.png}\\[1.0 cm]
        \textsc{\LARGE Universidad Austral de Chile}\\[2.0 cm]
        \textsc{\Large \thetopic}\\[0.5 cm]
        \rule{\linewidth}{0.2 mm}\\[0.4 cm]
        {\huge \bfseries \thetitle}\\[0.4 cm]
        \rule{\linewidth}{0.2 mm}\\[1.5 cm]
        
        \begin{minipage}{0.4\textwidth}
            \begin{center}
                \large
                \emph{Autor:}\\
                \theauthor
            \end{center}
        \end{minipage}
        
        \vspace{2cm}
        
        {\large \@date}
        
        \vfill
    \end{titlepage}
    \tableofcontents
    \pagebreak
}

\endinput
