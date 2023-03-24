
% Nombre del archivo: mireporte.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FormatBase}[2023/03/22 Mi Reporte Custom Class]

\newcommand{\titulo}[1]{\def\@titulo{#1}}
\newcommand{\autor}[1]{\def\@autor{#1}}
\newcommand{\institucion}[1]{\def\@institucion{#1}}
\newcommand{\fecha}[1]{\def\@fecha{#1}}

\DeclareOption{estilo1}{
    \LoadClassWithOptions{article}
	\AtBeginDocument{
		\immediate\write18{python generar_inputs.py}
		\input{inputs_autogen.tex}
	}
    \RequirePackage{geometry}
    \geometry{a4paper, margin=1in}

    % Paquetes y configuraciones adicionales para el estilo1
}

\DeclareOption{estilo2}{
    \LoadClassWithOptions{report}
    \RequirePackage{geometry}
    \geometry{a4paper, margin=1.5in}

    % Paquetes y configuraciones adicionales para el estilo2
}
\DeclareOption{estilo3}{
    \LoadClassWithOptions{beamer}

    % Paquetes y configuraciones adicionales para el estilo3
    % Elige un tema para la presentación:
    \usetheme{Madrid}
}

% Opciones por defecto
\ExecuteOptions{estilo1}

% Procesar las opciones del usuario
\ProcessOptions\relax

\endinput
