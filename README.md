%Darba nosaukums
%Autors

#Makefile
Šī *repo* mērķis ir radīt universālu makefile, lai:

+ Atvieglotu markdown veidošanas rutīnas konspektiem un laboriem
+ Ļautu nokompilēt latex dokumentu tā lai direktorijā nemētātos lieki log faili
+ Html faila izveidošana ar noteiktu *.css* failu un ieslēgtu $LaTex$ formulu attēlošanu
+ Ipython notebook pdf faila izveidošana (pagaidām nav iekļauts)
+ Iespējams arī *.C* un *.fpc* failu kompilēšana un automātiska konsoles izsaukšana un kompilēto failu izdzēšans


#Tabulu un grafiku pievienošana

##Vecais veids tabulām (Csvsimple)

~~~~
\csvreader[autotabular,table head=
	\hline
		name &
		givenname &
		matriculation &
		gender &
		$\alpha s^2$\\
	\hline
	]{macrodata.csv}{}{\csvlinetotablerow}
~~~~

##Jaunais tabulu veids (Pgfplotstable)

~~~~
\tab{data.csv}{columns={Mpk,b, a,a,d},
precision=5}
~~~~

##Grafiki

Lai pievienotu grafiku var izmantot, markdown iebūvēto funkciju - `![Grafika virsraksts](fails.png)`

