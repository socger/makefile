Files= README_lab.pdf README_konsp.pdf#index_konsp.pdf

Pandoc=pandoc


all: $(Files)

#Labors
%_lab.pdf: %.md
	$(Pandoc) $< -o $@ \
	--latex-engine=xelatex \
	--variable=geometry:margin=0.5in \
	-H .build_markdown/title.sty 
	
%_lab.tex: %.md
	$(Pandoc) $< -o $@ \
	--latex-engine=xelatex \
	--variable=geometry:margin=0.5in \
	-H .build_markdown/title.sty

#Tradicionāls html fails	
%.html: %.md
	$(Pandoc) $< -o $@ -m \
	-c http://johnmacfarlane.net/pandoc/demo/pandoc.css \
	--indented-code-classes=python \
	-s -S --toc #Uztaisa satura rādītāju

#Statistiskā apstrāde konspekts + labojums savietojamībai ar laboru	
%_konsp.pdf: %.md
	$(Pandoc) $< -o $@ \
	--latex-engine=xelatex \
	-V geometry:margin=0.5in  \
	--indented-code-classes=python \
	-H .build_markdown/content.sty
	#-V fontsize:12pt 
	
%_konsp.tex: %md
	$(Pandoc) $< -o $@ \
	--latex-engine=xelatex \
	-H .build_markdown/content.sty \
	-V geometry:margin=0.5in \
	--indented-code-classes=python

#letter
%_letter.pdf: %.md
	$(Pandoc) $< -o $@ \
	--latex-engine=xelatex \
	-V geometry:margin=1in \
	-V fontsize:12pt \
	-V title:"" \
	-V mainfont:"Gentium" \
	-f markdown+escaped_line_breaks \
	-V header-includes:"\usepackage{fancyhdr}  \pagestyle{fancy} \fancyhf{} \renewcommand{\headrulewidth}{0pt}" \
	-V header-includes:"\setlength{\parindent}{1cm}"
	  # +line_blocks

# Nepieciešams atrast par xelatex
%_fromtex.pdf: %md
	xelatex $<
	# Nepieciešams izdzēst logfailus

# Nokompilē par pdf C code file	
%_code_C.pdf: %md
	
# Izveido pdf failu no ipython notebook
%_notebook.pdf: %md
