\NeedsTeXFormat{LaTeX2e} \ProvidesClass{template}
\RequirePackage{setspace}
\LoadClass[12pt, a4paper]{report}
\brokenpenalty=10000
\onehalfspacing

\def\degreetitle#1{\gdef\@degreetitle{#1}}
\def\rpttype#1{\gdef\@rpttype{#1}}
%\def\studentID#1{\gdef\@studentID{#1}}
\def\principaladviser#1{\gdef\@principaladviser{#1}}
\def\advis@r{Advisor} % default spelling---we are English!
\def\principaladvisor#1{\gdef\@principaladviser{#1}\gdef\advis@r{Advisor}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}} 
\def\@title{}\def\@author{}

\def\@submitdate{\ifcase\the\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\the\year}

\newif\ifcopyright \newif\iffigurespage \newif\iftablespage \newif\ifalgorithmspage \newif\ifsigpage \copyrightfalse \figurespagetrue \tablespagetrue \algorithmspagefalse  \sigpagefalse

\def\titlep{%
        \thispagestyle{empty}%
        \null
        \begin{center}
            \includegraphics[height=20mm]{ljmulogo.jpg}
        \end{center}
        \begin{center}
        \vskip 0.15in
        \LARGE
        School of Computer Science and Mathematics\\ 
        \textbf{6100COMP Project}

        \vskip 0.3in
        \normalsize
        Final Report Submitted by                    
      
        \LARGE \textbf{\@author}

        \large
        \textbf{\studentID}

        \textbf{\degreeAward}
        \vskip 0.3in
        {\normalsize Title}

        {\LARGE \textbf{\reportTitle} }

        \vskip 0.3in
        
        {\normalsize
        Supervisor by\\} {\large\textbf{\@principaladviser}}

        \vskip 0.4in       

        {\normalsize Submitted on}\\
        \textbf{\number\day~\pgfcalendarmonthname{\month} \number\year}
                
        \end{center}\vskip.5in\newpage}

\def\declpage{%
\prefacesection{Declaration}
        \begin{center}
        \begin{minipage}{4.5in}
                \parindent=0pt
                I confirm that the work contained in this \@rpttype \space project report has been composed solely by myself and has not been accepted in any previous application for a degree. All sources of information have been specifically acknowledged and all verbatim extracts are distinguished by quotation marks.
                \par
                \vskip 2in
                 Signed ............................................ \hspace{0.5 in} Date ......................\\
                 \hspace*{0.4 in} \@author 
                 \par
        \end{minipage}%
        \end{center}%
        \vfill}

\def\beforeabstract{
        \pagenumbering{roman}
        \pagestyle{plain}
        \titlep
        \ifsigpage\signaturepage\fi


\def\afterabstract{
%%        \newpage
        \declpage

\tableofcontents
        \newpage
        \iftablespage
                \addvspace{10pt}
                \listoftables
                \newpage
        \fi
        \iffigurespage
                \addvspace{10pt}
                \listoffigures
                \newpage
        \fi
    \ifalgorithmspage
                \addvspace{10pt}
                \listofalgorithms
                \newpage
        \fi}

        }

\def\prefacesection#1{%
        \chapter*{#1}
        \addcontentsline{toc}{chapter}{#1}}

\def\afterpreface{\newpage
        \pagestyle{plain}}

\pagestyle{plain}

\def\thebibliography#1{\chapter*{\bibname\@mkboth
  {\uppercase{\bibname}}{\uppercase{\bibname}}}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m}

\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}
