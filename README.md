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
### hist_sources
- filters the dataset the_sources according to the specified parameters.
- If output_text = TRUE, the result text is provided formatted as output, ready to be incorporated into a source paper document.
- Example
```r
# All source excerpts from Xenophon on the Corinthian War as dataframe
Xenophon_Corinthian <- hist_sources(author = "Xenophon", context = "Corinthian War", output_text = FALSE)
# As source compilation
hist_sources(author = "Xenophon", context = "Corinthian War", output_text = TRUE)
```
### hist_include
- adds your own source excerpts with the corresponding metadata as a dataframe to the dataset the_sources.
- However, the columns of your dataset must match those of the_sources and must be in the same order and with the same variable types.
```r
# Some example data
new_data <- data.frame(context = "Corinthian War", event = "NewBattle1", author = "Plutarch", work = "Work3", citation = "NewCitation6", text_ID = 15, text = "The fleets clashed near Cnidus.", event_type = "battle", stringsAsFactors = FALSE)
# Don't forget to define the_sources as your own datafrane before working with hist_include
the_sources <- the_sources
# Adjust the column data types to match those of the_sources
new_data$context <- as.factor(new_data$context)
new_data$event_type <- as.factor(new_data$event_type)
```
### hist_contain
- filters a source dataframe created with hist_sources (text_output set on FALSE) by the occurrence of source excerpts containing specific words.
- Use + to require multiple words in the same text (e.g. "king+battle"). Multiple arguments represent an OR condition. Case sensitivity is ignored.
```r
# Example source dataframe created with hist_sources
Xenophon_Corinthian <- hist_sources(author="Xenophon",context="Corinthian War", output_text = FALSE)
# Only source excerpts containing "king+battle" or "Thebans"
hist_contain(Xenophon_Corinthian, "king+battle","Thebans")
```
### hist_delete
- deletes specific rows from a source dataframe created with hist_sources (text_output set on FALSE), identified by their text_ID values.
```r
# Example source dataframe created with hist_sources
Xenophon_Corinthian <- hist_sources(author="Xenophon",context="Corinthian War", output_text = FALSE)
# Delete the source excerpts with IDs 5 and 14
hist_delete(Xenophon_Corinthian, ID = c(5, 14))
```
### hist_text
- converts a source dataframe that you created with hist_sources into a structured source compilation ready to be incorporated into a source paper document.
```r
# Example source dataframe created with hist_sources
Xenophon_Corinthian <- hist_sources(author="Xenophon", context="Corinthian War", output_text = FALSE)
# Output the source-paper
hist_text(Xenophon_Corinthian)
```

## Installation

You can install the package via 
```r
remotes::install_github("ATSzimmat/Rhistorical")
```



