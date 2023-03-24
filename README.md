

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
Reemplaza `<nombre_del_documento.tex>` con el nombre de tu archivo `.tex`, para copilar el documento en windows utilice miktex.

Tenga en cuenta que si su documento utiliza paquetes adicionales que no están incluidos en la instalación básica de MiKTeX, es posible que deba instalarlos manualmente antes de compilar su archivo de LaTeX. Puede hacer esto utilizando el Administrador de Paquetes de MiKTeX, que se puede encontrar en el menú Inicio de Windows después de instalar MiKTeX.


## 7. Para realizar aportes al formato
para realizar aportes al formato de la universidad debera seguir las siguientes instrucciones:

1. Clonar el repositorio: Para colaborar en el proyecto, es necesario clonar el repositorio en su propia computadora utilizando un cliente de Git como Git Bash o GitHub Desktop.

2. Crear una branch o fork: Una vez que el repositorio esté en su propia computadora, debe crear una nueva branch o un fork de la rama develop en la que trabajará para realizar sus aportes. Esto le permitirá trabajar en su propia versión del proyecto sin afectar la rama principal.

3. Realizar el aporte: Una vez que haya creado su propia branch o fork, puede comenzar a trabajar en el proyecto. Realice los cambios que desee hacer en el código, agregue nuevos archivos, modifique la documentación, etc.

4. Hacer un commit: Una vez que haya terminado de hacer los cambios, debe hacer un commit en su propia branch o fork para guardar los cambios que realizó.

5. Crear un pull request: Después de realizar el commit, debe crear un pull request en la rama develop del repositorio original. Un pull request es una solicitud para fusionar los cambios que hizo en su propia branch o fork con la rama develop del repositorio original. Para hacer esto, debe abrir el repositorio en la plataforma que esté utilizando (GitHub, GitLab, etc.) y hacer clic en el botón "New pull request" o "Create pull request" y seleccionar su branch o fork como la rama que desea fusionar con la rama develop del repositorio original.

6. Esperar la revisión: Una vez que haya enviado su pull request, el propietario del repositorio o los colaboradores revisarán sus cambios y pueden hacer comentarios o solicitar cambios adicionales antes de fusionar la branch o fork con la rama develop. Debe estar pendiente de los comentarios y realizar los cambios necesarios hasta que los revisores estén satisfechos con los cambios que ha realizado.

7. Fusión de la branch o fork: Si sus cambios son aceptados, su branch o fork se fusionará con la rama develop del repositorio original. De lo contrario, puede continuar haciendo cambios y enviando pull requests hasta que sus aportes sean aceptados.

Los releases se realizaran cada 3 meses, para que los usuarios puedan tener acceso a las ultimas versiones del formato.