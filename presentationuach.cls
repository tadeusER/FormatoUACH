\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentationuach}[2023/03/22 Custom Presentation class]

% Definir el comando para la ruta de subdirectorio
\newcommand{\subdirpath}{formato}
\newcommand{\setsubdirpath}[1]{\renewcommand{\subdirpath}{#1}}

% Opciones de idioma
\newif\if@spanish
\DeclareOption{spanish}{\@spanishtrue}
\DeclareOption{english}{\@spanishfalse}

% Opción para el logo personalizado
\newcommand{\@customlogo}{\subdirpath/logos/media_tesis.png}
\DeclareOption{logo}{\renewcommand{\@customlogo}{#1}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

% Cargar paquetes necesarios
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{float}

% Configuración de idioma
\if@spanish
    \RequirePackage[spanish,es-tabla]{babel}
    \addto\captionsspanish{
        \renewcommand{\tablename}{Tabla}
        \renewcommand{\figurename}{Figura}
    }
\else
    \RequirePackage[english]{babel}
\fi

% Tema y colores personalizados
\usetheme{Madrid}
\usecolortheme{dolphin}
\setbeamercolor{alerted text}{fg=red}

% Configuraciones de fuentes
\usefonttheme{professionalfonts}
\setbeamerfont{frametitle}{series=\bfseries}
\setbeamerfont{block title}{series=\bfseries}

% Logotipo personalizado en la esquina superior derecha
\setbeamertemplate{logo}{%
    \IfFileExists{\@customlogo}{%
        \includegraphics[height=1cm]{\@customlogo}%
    }{%
        \textbf{\textcolor{red}{Logo not found}}%
    }%
}

% Número de página en el pie de página
\setbeamertemplate{footline}[page number]

% Deshabilitar el sombreado de elementos inactivos en listas
\setbeamercovered{transparent=0}

% Configuración de los bloques personalizados
\setbeamertemplate{blocks}[rounded][shadow=true]
\setbeamercolor{block title}{fg=white, bg=blue!50!black}
\setbeamercolor{block body}{fg=black, bg=blue!20!white}

% Configuración para gráficos
\graphicspath{
    {./}
    {\subdirpath/logos/}
    {./logos/}
    {./formato/logos/}
    {\subdirpath/images/}
    {./images/}
}

% Configuraciones adicionales para tablas
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}

% Configuración para flotantes
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\textfraction}{0.07}

% Configuración para captions
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{caption label separator}{: }

\endinput
