<div style="overflow: hidden;">
  <img src="images/Logo_historical_end.jpg" width="200" style="float: right; margin-left: 20px;">
  <h1>R historical v1.1.1</h1> 
  <p><em>by ATSzimmat</em></p>
</div>

Welcome to the package R historical - a new tool that wants to facilitate work with primary sources of history in R!

Um Informationen über die Vergangenheit zu erhalten, ist es unumgänglich sich die Hinweise anzusehen, die die Zeiten überdauert haben und uns heute noch zur Verfügung stehen. Diese Hinweise können in vielen Formen auftreten - als Inschriften an Steinen, als alte Ruinen oder als Texte, die über die damalige Zeit, manchmal sogar als zeitzeugen, berichten. Diese Hinweise (oder Primärquellen) werden in den Historical sciences einfach nur als Quellen bezeichnet und jegliche "Geschichtsbücher", die über diese Quellen geschrieben wurden, nennt man (Forschungs-) Literatur.
Wenn ein Historiker eine Fragestellung beantworten möchte hat er zuerst die Aufgabe die Quellen zu sammeln, die für seine Fragestellung relevant sind und dann unter Berücksichtigung der bsiherigen Literatur wissenschaftlich auszuwerten. Im Anschluss möchte man meist die Quellen als geordneten Text mit der korrekten Zitation der Quellen (ein sogenanntes Quellenpapier) erstellen um seine Quellen präsentieren zu können. Doch der Prozess die Quellen zu finden, sie zu verwalten und schlussendlich das Quellenpapier zu erstellen kann leicht sehr träge und zeitaufwendig werden. Der Autor dieses Packages studiert zurzeit Geschichte im Hauptfach und Statistik und Data Science als Nebenfach an der LMU München und stand selbst schon mehrere Male vor dieser Herausforderung.

## Wie R historical den Arbeitsalltag eines Historikers vereinfach kann
Wenn ein Historiker seine Quellen sammelt steht er meist gewissermaßen vor einem unüberblickbaren Berg an Quellen, liest diese zeitaufwendig durch und erstellt dann eine Quellenauswahl, die er dann interpretiert, kritisiert und auswertet. Daber stößt er freilich auf mehrere Probleme. So kann die richtigen Quellen zu finden und überhaupt an einen zuverlässigen Text der Quellen und dessen Übersetzung heranzukommen Ewigkeiten dauern und die Massen an Quellen effizient zu verwalten und einzuschränken ist ein müsahmer Prozess.
R historical ist eine Art Quellenmanager, der bei diesen Problemen so weit wie möglich Abhilfe schaffen und es dem Historiker ermöglichen möchte schnell und effizient ein Dataframe aus seinen Quelln zu bauen, das mit all den Möglichkeiten zur Analyse von Texten, die R zu bieten hat weiter untersucht werden kann. Entsprechende Analysetools können in der Zukunft zu R historical hinzugefügt werden, um den Workflow weiter zu beschleunigen.

## Wie R historical funktioniert
Wenn man R historical installiert, wird neben den Funktionen auch ein Datset namens the_sources hinzugefügt. Dieses stellt den Text der Quellenstellen, über die the_sources verfügt mit entsprechenden Metadaten bereit.
--Tabelle--
In der Zukunft sollen dort alle existenten Quellen gespeichert werden, in dieser ersten Version jedoch enthält der Datensatz nur einige ausgedacht Quellenauszüge mit Platzhalter-Metadaten. Als Historiker kann man mit der Funktion hist_sources() the_sources auf eine Quellenauswahl beschränken, die bestimmte Bedingungen erfüllen - z. B: von einem bestimmten Verfasser stammen oder über ein bestimmtes Ereignis berichten. Wenn the_souces bereits alle Quellen enthält, spart dies dem Historiker bereits ein großes Stück Arbeit. Außerdem gibt the_sources eine standardisierte Form für die Speicherung der Quellenstellen vor, die die unkontrollierte Erstellung von vielen Quellensammlungen (mit jeweils ihrem eigenen Konzept) verhindert. 
Diese Quellenauswahl kann man mit hist_include um eigene Quellen erweitern, die noch nicht als Teil von the_sources geliefert werden. Auf der anderen Seite kann man diese Auswahl auch mit 2 anderen Funktionen von R historical einschränken. Mit hist_contain kann man die Quellenauswahl auf Quellen beschränken, die bestimmte Wörter enthalten und mit hist_delete kanm man ungewollte Quellenstellen direkt aus seiner Quellenauswahl entfernen.
Wenn auf diese Weise schnell und effizient eine Quellenauswahl in Form eines Dataframes erstellt hat, kann man dieses mit hist_text dieses Dataframe zu einer Auswahl der Quellen als strukturierter Volltext umwandeln. Alternativ kann man jedoch bereits mit hist_sources sich den Text der Quellen ausgeben lassen.

## Die Funktionen


## Installation

You can install the package via 
```
{r}
remotes::install.github("ATSzimmat/Rhistorical")
```



