\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentationuach}[2023/03/22 Custom Presentation class]

% Opción para el logo personalizado
\newcommand{\@customlogo}{formato/logos/logo_uach.png}
\DeclareOption{logo}{\renewcommand{\@customlogo}{#1}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

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
    \textbf{\textcolor{red}{Logo no encontrado}}%
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

% Añadir ruta de búsqueda para gráficos
\graphicspath{{./}{./logos/}{./formato/logos/}{formato/logos/}}

\endinput

