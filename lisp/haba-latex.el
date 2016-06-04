(provide 'haba-latex)


(setq org-latex-default-table-environment "tabulary")
;; Pandoc
(use-package ox-pandoc)

;; Latex
(require 'ox-latex)



(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-default-packages-alist
      '(("" "indentfirst" t) ; первая строка параграфа сдвинута
        ("" "misccorr" t) ; точка в номерах заголовков
        ("onehalfspacing" "setspace" t) ; межстрочный интервал
        ("" "tabulary" t) ; Таблицы с возможностью "спана"
        ("" "fixltx2e" nil)
        ("" "graphicx" t)
        ("" "grffile" t)
        ("" "longtable" nil)
        ("" "wrapfig" nil)
        ("" "rotating" nil)
        ("normalem" "ulem" t)
        ("" "amsmath" t)
        ("" "textcomp" t)
        ("" "amssymb" t)
        ("" "capt-of" nil)
        ("" "hyperref" nil)))

(defun haba/org-latex-class-common (lang-main lang-other)
  (concat "\\usepackage{fontspec}
         \\defaultfontfeatures{Ligatures=TeX}
         \\setmainfont{PT Serif}
         \\setsansfont{PT Sans}
         \\newfontfamily{\\cyrillicfonttt}{Input}
         \\setmonofont{Input}
         \\newcommand\\quotefont{\\fontspec[Colour=55555500]{PT Sans}}
         \\usepackage{polyglossia}
         \\setdefaultlanguage{" lang-main "}
         \\setotherlanguages{" lang-other "}"))
(defun haba/org-latex-class-hf-logo-2(logo-left logo-right)
  (interactive "P")
  (format "\\usepackage{fancyhdr}
             \\pagestyle{fancy}
             \\fancypagestyle{plain}{\\pagestyle{fancy}}
             \\lhead{\\includegraphics[scale=1]{%s/logo/%s}}
             \\chead{}
             \\rhead{\\includegraphics[scale=1,trim=0 -3mm 0 0]{%s/logo/%s}}
             \\lfoot{} \\cfoot{} \\rfoot{\\thepage}
             \\renewcommand{\\headrulewidth}{0.0pt}
             \\renewcommand{\\footrulewidth}{0.0pt}"
          org-directory logo-left org-directory logo-right))
(setq haba/org-latex-class-titling
      "\\usepackage{titling}
         \\pretitle{\\begin{center}\\LARGE\\bfseries\\sffamily}
         \\posttitle{\\par\\end{center}\\vspace{24bp}}
         \\preauthor{\\begin{center}\\normalsize\\sffamily}
         \\postauthor{\\par\\end{center}}
         \\predate{\\begin{center}\\normalsize\\sffamily}
         \\date{}
         \\postdate{\\par\\end{center}}")
(setq haba/org-latex-class-hf-std
      "\\usepackage{fancyhdr}
         \\pagestyle{fancy}
         \\fancypagestyle{plain}{\\pagestyle{fancy}}
         \\lhead{} \\chead{} \\rhead{\\today}
         \\lfoot{} \\cfoot{} \\rfoot{\\thepage}")
(setq haba/org-latex-class-dot-in-chapters
      "\\usepackage{misccorr} % Точка в номерах заголовков
         \\usepackage{titlesec}
         \\titleformat*{\\section}{\\Large\\bfseries\\sffamily}
         \\titleformat*{\\subsection}{\\large\\bfseries\\sffamily}
         \\titleformat*{\\subsubsection}{\\normalsize\\bfseries\\sffamily}")
(setq haba/org-latex-class-fancy-quoteblock
      "\\newcommand*\\openquote{\\makebox(25,7){\\scalebox{2}{<<}}}
         \\newcommand*\\closequote{\\makebox(25,7){\\scalebox{2}{>>}}}
         \\renewenvironment{quote}
         {\\list{}{\\rightmargin\\leftmargin}%
         \\item\\quotefont\\openquote\\relax\\ignorespaces}
         {\\unskip\\unskip\\closequote\\endlist}")
(setq haba/org-latex-class-no-chapters
      "% Главы без глав
         \\usepackage{titlesec}
         \\titleformat{\\chapter}{\\normalfont\\LARGE\\bfseries\\sffamily}{\\thechapter.}{1em}{}
         \\titlespacing*{\\chapter}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex} ")
(defun haba/org-latex-class-titling-logo-2 (logo-left logo-right)
  (format "\\usepackage{titling}
             \\pretitle{
             \\vspace{-35mm}\\hspace{-5mm}
             \\includegraphics[scale=1]{%s/logo/%s}
             \\\hspace{\\stretch{1}}
             \\includegraphics[scale=1,trim=0 -3mm 0 0]{%s/logo/%s}
             \\vspace{35mm}\\vspace{\\stretch{1}}
             \\begin{center}\\LARGE\\bfseries\\sffamily}
             \\posttitle{\\par\\end{center}\\vspace{\\stretch{1.5}}}
             \\preauthor{\\begin{center}\\normalsize\\sffamily}
             \\postauthor{\\par\\end{center}}
             \\predate{\\begin{center}\\normalsize\\sffamily}
             \\date{}
             \\postdate{\\par\\end{center}}" 
          org-directory logo-left org-directory logo-right))

(add-to-list 'org-latex-classes
             `("article"
               ,(concat "\\documentclass[a4paper,12pt]{article}"
                        (haba/org-latex-class-common "russian" "english")
                        "\\usepackage[top=30mm, left=30mm, right=25mm, bottom=35mm]{geometry}"
                        haba/org-latex-class-hf-std
                        haba/org-latex-class-titling
                        haba/org-latex-class-dot-in-chapters
                        haba/org-latex-class-fancy-quoteblock)
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             `("article-en"
               ,(concat "\\documentclass[a4paper,12pt]{article}"
                        (haba/org-latex-class-common "english" "russian")
                        "\\usepackage[top=30mm, left=30mm, right=25mm, bottom=35mm]{geometry}"
                        haba/org-latex-class-hf-std
                        haba/org-latex-class-titling
                        haba/org-latex-class-dot-in-chapters
                        haba/org-latex-class-fancy-quoteblock)
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(add-to-list 'org-latex-classes
             `("article-sberbank"
               ,(concat "\\documentclass[a4paper,12pt]{article}"
                        (haba/org-latex-class-common "russian" "english")
                        "\\usepackage[top=30mm, left=30mm, right=20mm, bottom=35mm]{geometry}"
                        (haba/org-latex-class-hf-logo-2 "logo_sberbank_simple_50_opacity.png" "logo_adastra_50_opacity.png")
                        haba/org-latex-class-titling
                        haba/org-latex-class-dot-in-chapters
                        haba/org-latex-class-fancy-quoteblock)
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             `("report"
               ,(concat "\\documentclass[a4paper,12pt]{report}"
                        (haba/org-latex-class-common "russian" "english")
                        "\\usepackage[top=30mm, left=30mm, right=25mm, bottom=35mm]{geometry}"

                        haba/org-latex-class-hf-std
                        haba/org-latex-class-titling
                        haba/org-latex-class-dot-in-chapters
                        haba/org-latex-class-fancy-quoteblock
                        haba/org-latex-class-no-chapters)

               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(add-to-list 'org-latex-classes
             `("report-sberbank"
               ,(concat "\\documentclass[a4paper,12pt]{report}"
                        (haba/org-latex-class-common "russian" "english")
                        "\\usepackage[top=30mm, left=30mm, right=25mm, bottom=35mm]{geometry}"
                        (haba/org-latex-class-hf-logo-2 "logo_sberbank_simple_50_opacity.png" "logo_adastra_50_opacity.png")
                        (haba/org-latex-class-titling-logo-2 "logo_sberbank_simple_50_opacity.png" "logo_adastra_50_opacity.png")
                        haba/org-latex-class-dot-in-chapters
                        haba/org-latex-class-fancy-quoteblock
                        haba/org-latex-class-no-chapters)

               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
