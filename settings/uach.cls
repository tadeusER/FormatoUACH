% ============================================================
%
% Plantilla para reportes
%
% Author: Enrique Ramirez
%
% ============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{settings/uach}

\RequirePackage{kvoptions}[2010/12/23]%Este paquete está destinado a los autores de paquetes que desean utilizar opciones en formato de valor clave para sus opciones de paquete.
% Conditional commands
\RequirePackage{ifthen}%paquetes con commandos condicionales
%\ifthenelse{test}{then}{else}
\SetupKeyvalOptions{
	family=uach,
	prefix=uach@
}
% Set English as default language
\DeclareStringOption[]{language}[english]
% Set Master Thesis as default document type
\DeclareStringOption[]{TypeDocs}[report]

% Set Master Thesis as default document type
\DeclareStringOption[]{thesis}[master]

% Set supervisor ≠ professor as default supervisor option
\DeclareStringOption[]{supervisor}[supervisor]

% Set statistic as the default chair
\DeclareStringOption[]{chair}[statistics]

% Option to control licensing
%% License information functionality ported from dbisgroup/dbis-template;
\DeclareStringOption{license}

% Option in case of multiple authors
\DeclareBoolOption{multiauthor}

% Process options
\ProcessKeyvalOptions*

\LoadClass[a4paper,12pt]{report}

% \RequirePackage[a4paper,left=2.9cm, top=2.9cm, bottom=2.3cm, right=2.9cm,includefoot,heightrounded]{geometry}
%margenes segun reglamentos
\usepackage[papersize={216mm,279mm},tmargin=30mm,bmargin=25mm,lmargin=30mm,rmargin=20mm, heightrounded=true]{geometry}
\setlength{\headheight}{52pt}


