% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hist_contain.R
\name{hist_contain}
\alias{hist_contain}
\title{Filter the source dataframe by the occurrence of different words}
\usage{
hist_contain(filtered_sources, ...)
}
\arguments{
\item{filtered_sources}{Your current source dataframe}
}
\value{
... One or more character strings to search for

A filtered dataframe ready to be further adapted or processed into a source paper
}
\description{
This function filters a source dataframe created with hist_sources (text_output set on FALSE) by the occurrence of source excerpts containing specific words
Use + to require multiple words in the same text (e.g. "king+battle"). Multiple arguments represent an OR condition. Case sensitivity is ignored.
}
\examples{
# Example source dataframe created with hist_sources
Xenophon_Corinthian <- hist_sources(author="Xenophon",context="Corinthian War", output_text = FALSE)
# Only source excerpts containing "king"
hist_contain(Xenophon_Corinthian, "king")
# Only source excerpts containing"king" or "Thebans"
hist_contain(Xenophon_Corinthian, "king","Thebans")
# Only source excerpts containing "king", "battle" and "Thebans"
hist_contain(Xenophon_Corinthian, "king+battle+Thebans")
# Only source excerpts containing "king+battle" or "Thebans"
hist_contain(Xenophon_Corinthian, "king+battle","Thebans")
}
