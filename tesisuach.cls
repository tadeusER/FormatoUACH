\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tesisuach}[2023/10/16 Clase para Tesis UACh]
\LoadClass[11pt]{report}

% Paquetes requeridos
\RequirePackage[spanish]{babel}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{algorithmic}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{url}
\RequirePackage[papersize={216mm,279mm},tmargin=30mm,bmargin=25mm,lmargin=30mm,rmargin=20mm, heightrounded=true]{geometry}
\RequirePackage{helvet}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{ragged2e}
\RequirePackage{minted}
\RequirePackage{csquotes}
\RequirePackage[backend=biber,sorting=none]{biblatex}

% Configuraciones generales
\setlength{\headheight}{52pt}
\spacing{1.15}
\setlength{\parskip}{1.5pt}
\emergencystretch=2em

% Redefinir nombres en español
\renewcommand{\listtablename}{Índice de tablas}
\renewcommand{\tablename}{Tabla}
\renewcommand{\contentsname}{Índice de contenidos}
\renewcommand{\listfigurename}{Índice de figuras}

% Comandos para información de la tesis
\newcommand{\cabecalho}{Universidad Austral de Chile\\
FACULTAD DE CIENCIAS DE LA INGENIERÍA\\
ESCUELA DE INGENIERIA CIVIL ELECTRÓNICA}

\newcommand{\@nombre}{}
\newcommand{\nombre}[1]{\renewcommand{\@nombre}{#1}}

\newcommand{\@titulo}{}
\newcommand{\titulo}[1]{\renewcommand{\@titulo}{#1}}

\newcommand{\@nota}{Trabajo de Titulación para optar al \\
Título de Ingeniero Civil Electrónico.}
\newcommand{\nota}[1]{\renewcommand{\@nota}{#1}}

\newcommand{\@prof}{}
\newcommand{\prof}[1]{\renewcommand{\@prof}{#1}}

\newcommand{\@direccion}{VALDIVIA - CHILE - \the\year}
\newcommand{\direccion}[1]{\renewcommand{\@direccion}{#1}}

% Comando para la portada
\newcommand{\portada}{
    \thispagestyle{empty}
    \begin{center}
    {\MakeUppercase\cabecalho\vspace{1.65cm}}
    
    \begin{figure}[H]
    \centering
    \includegraphics[scale=0.8]{formato/logos/logo2.jpg}
    \end{figure}
    
    {\large\MakeUppercase\@titulo \vspace{1.8cm}} \\
    \vfill
    \begin{flushright}
    \begin{minipage}{6.5cm}
    \@nota 
    \\ \vspace{0.2cm} \\ \@prof
    \end{minipage}
    \end{flushright}
    \vfill \hrulefill \\ {\@direccion}
    \end{center}
    \newpage
}

% Configuración de encabezados y pies de página
\pagestyle{fancy}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Comandos para secciones preliminares
\newcommand{\preliminares}{
    \pagenumbering{gobble}
    \tableofcontents
    \cleardoublepage
    \listoffigures
    \cleardoublepage
    \listoftables
    \cleardoublepage
    \newpage
    \pagenumbering{arabic}
}

% Comando para iniciar el contenido principal
\newcommand{\iniciarcuerpo}{
    \pagestyle{fancy}
    \pagenumbering{arabic}
    \setcounter{page}{1}
}

% Ajuste del interlineado
\renewcommand{\baselinestretch}{1.15}

\endinput
