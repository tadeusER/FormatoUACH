\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{posteruach}[2024/01/12 v1.0 Clase para posters academicos UACH]

% Opciones de la clase
\RequirePackage{xkeyval}
\newif\if@fondoactivo\@fondoactivofalse
\DeclareOptionX{fondo}[false]{\@fondoactivotrue}
\DeclareOptionX{escala}[1.5]{\def\poster@escala{#1}}
\DeclareOptionX{ancho}[90]{\def\poster@ancho{#1}}
\DeclareOptionX{alto}[120]{\def\poster@alto{#1}}

% Procesar opciones
\ExecuteOptionsX{escala=1.5,ancho=90,alto=120}
\ProcessOptionsX\relax

% Cargar clase base beamer con opciones necesarias
\LoadClass[t,compress]{beamer}
\RequirePackage[size=custom,scale=\poster@escala,width=\poster@ancho,height=\poster@alto]{beamerposter}

% Paquetes requeridos
\RequirePackage[spanish]{babel}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{xcolor}
\RequirePackage{tcolorbox}
\RequirePackage{fontawesome5}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}
\RequirePackage{ragged2e}
\RequirePackage{caption}

% Definición de colores institucionales (personalizables)
\definecolor{ColorPrimario}{RGB}{0, 59, 92}  % Azul institucional
\definecolor{ColorSecundario}{RGB}{255, 203, 5}  % Amarillo institucional
\definecolor{ColorFondo}{RGB}{255, 255, 255}  % Blanco

% Configurar el estilo visual
\usetheme{Pittsburgh}
\setbeamercolor{structure}{fg=ColorPrimario}
\setbeamercolor{title}{fg=ColorPrimario,bg=ColorSecundario}
\setbeamercolor{block title}{fg=white,bg=ColorPrimario}
\setbeamercolor{block body}{fg=black,bg=white}
\setbeamercolor{normal text}{fg=black}

% Configuración de bloques con tcolorbox
\tcbset{
  poster/.style={
    enhanced,
    colframe=ColorPrimario,
    colback=white,
    coltitle=white,
    fonttitle=\bfseries,
    bottomrule=2mm,
    toprule=2mm,
    leftrule=2mm,
    rightrule=2mm,
    sharp corners,
  }
}

% Comando para logo institucional
\newcommand{\logoinstitucion}[2][0.15\textwidth]{%
  \includegraphics[width=#1]{#2}%
}

% Comando para fondo del póster
\newcommand{\fondoposter}[1]{%
  \if@fondoactivo
    \usebackgroundtemplate{\includegraphics[width=\paperwidth,height=\paperheight]{#1}}%
  \fi
}

% Redefinir entorno block
\renewenvironment{block}[1]{%
  \begin{tcolorbox}[poster,title=#1]%
}{%
  \end{tcolorbox}%
}

% Redefinir entorno alertblock
\renewenvironment{alertblock}[1]{%
  \begin{tcolorbox}[poster,colframe=red!70!black,title=#1]%
}{%
  \end{tcolorbox}%
}

% Redefinir entorno exampleblock
\renewenvironment{exampleblock}[1]{%
  \begin{tcolorbox}[poster,colframe=green!70!black,title=#1]%
}{%
  \end{tcolorbox}%
}

% Comando para información de contacto
\newcommand{\contactinfo}[1]{%
  \begin{textblock*}{0.3\textwidth}(\textwidth,0)
    \begin{tcolorbox}[poster,title=Contacto]
      #1
    \end{tcolorbox}
  \end{textblock*}
}

% Comando para referencias
\newcommand{\referencias}[1]{%
  \begin{block}{Referencias}
    \small
    #1
  \end{block}
}

% Comando para agradecimientos
\newcommand{\agradecimientos}[1]{%
  \begin{block}{Agradecimientos}
    \small
    #1
  \end{block}
}

% Comando para código QR
\newcommand{\codigoqr}[2][0.1\textwidth]{%
  \includegraphics[width=#1]{#2}%
}

% Configuración de captions
\captionsetup{font=small,labelformat=simple,labelsep=colon}

% Configuración por defecto de geometría
\geometry{
  margin=1cm,
  top=1cm,
  bottom=1cm,
  left=1cm,
  right=1cm
}

% Comando para sección de autores con afiliaciones
\newcommand{\autoresafiliaciones}[2]{%
  \def\@authors{#1}%
  \def\@affiliations{#2}%
  {\large\@authors\par}
  \vspace{0.5em}
  {\normalsize\@affiliations\par}
}
