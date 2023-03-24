% Set English as default language
\DeclareStringOption[]{language}[english]

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