

# Uso del formato UACH en LaTeX

Para utilizar el formato de clase personalizado (`.cls`) en un documento LaTeX (`.tex`), primero debes importar este repositorio en la carpeta deseada utilizando Git submódulos. A continuación, se describen los pasos para realizar este proceso:

## 1. Importar el repositorio como un submódulo de Git

Abre la terminal en la carpeta de tu proyecto y ejecuta el siguiente comando para agregar el repositorio como un submódulo de Git:
```
git submodule add <URL_del_repositorio> <nombre_de_la_carpeta>
```

Reemplaza `<URL_del_repositorio>` con la URL del repositorio que contiene el archivo `.cls` personalizado y `<nombre_de_la_carpeta>` con el nombre de la carpeta donde deseas importar el repositorio.

### 1.2 Actualizar el submódulo

Después de agregar el repositorio como un submódulo, actualízalo para asegurarte de que se descarguen todos los archivos, para obtener los últimos cambios. Sigue estos pasos para actualizar los submódulos:

1. Abre la terminal en la carpeta del repositorio principal.
2. Ejecuta el siguiente comando para obtener los últimos cambios de los submódulos:
```
git submodule update --remote --merge
```
Este comando actualiza todos los submódulos a sus últimas versiones disponibles en el repositorio remoto.

## 2. Importar el archivo para una presentacion
Para crear una presentacion utlizando el formato de la universidad guiese por el siguiente ejemplo:

```
\documentclass[aspectratio=169]{presentationuach}

% Puede agregar cualquier paquete adicional que necesite aquí
\usepackage{lipsum} % Solo para fines de demostración, agregando texto de muestra


\title{Mi presentación}
\author{Mi nombre}
\date{Mi fecha}

\begin{document}

\begin{frame}
  \titlepage
\end{frame}

\begin{frame}
  \frametitle{Introducción}
  \lipsum[1]
\end{frame}

\begin{frame}
  \frametitle{Contenido}
  \lipsum[2-4]
\end{frame}

\begin{frame}
  \frametitle{Conclusión}
  \lipsum[5]
\end{frame}

\end{document}
```
## 3. Importar el archivo para un articulo
Para crear un articulo utlizando el formato de la universidad guiese por el siguiente ejemplo:

``` 
\documentclass{articleuach}

% Puede agregar cualquier paquete adicional que necesite aquí
\usepackage{lipsum} % Solo para fines de demostración, agregando texto de muestra

\title{Título del artículo}
\author{Nombre del autor}
\date{\today}

\begin{document}

\maketitle

\begin{abstract}
  \lipsum[1]
\end{abstract}

\section{Introducción}
\lipsum[2-3]

\section{Contenido}
\lipsum[4-6]

\section{Conclusión}
\lipsum[7]

\end{document}

```
## 4. Importar el archivo para un informe
Para crear un informe utlizando el formato de la universidad guiese por el siguiente ejemplo:

```
\documentclass{reporteuach} 

% Puede agregar cualquier paquete adicional que necesite aquí
\usepackage{lipsum} % Solo para fines de demostración, agregando texto de muestra

\title{Título del libro}
\author{Nombre del autor}
\date{\today}

\begin{document}

\frontmatter
\maketitle

\tableofcontents

\mainmatter
\chapter{Introducción}
\lipsum[1-2]

\section{Motivación}
\lipsum[3]

\section{Objetivos}
\lipsum[4]

\chapter{Contenido}
\lipsum[5-7]

\section{Capítulo 1}
\lipsum[8-9]

\section{Capítulo 2}
\lipsum[10-11]

\backmatter
\chapter{Conclusiones}
\lipsum[12-13]

\end{document}
```
## 5. Importar el archivo para un articulo IEEE
Para crear un articulo IEEE guiese por el siguiente ejemplo:

```
\documentclass[conference]{IEEEtran}

% Puede agregar cualquier paquete adicional que necesite aquí
\usepackage{lipsum} % Solo para fines de demostración, agregando texto de muestra

\title{Título del artículo}
\author{Nombre del autor}
\date{\today}

\begin{document}

\maketitle

\begin{abstract}
  \lipsum[1]
\end{abstract}

\section{Introducción}
\lipsum[2-3]

\section{Contenido}
\lipsum[4-6]

\section{Conclusión}
\lipsum[7]

\end{document}

```

## 6. Compilar el documento
Puedes utilizar el siguiente comando en la terminal para compilar el documento:
``` 
pdflatex <nombre_del_documento.tex> --shell-escape
```
Reemplaza `<nombre_del_documento.tex>` con el nombre de tu archivo `.tex`.