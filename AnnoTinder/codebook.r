## main codebook annotation

read_and_concatenate <- function(file_path) {
  instructies <- readLines(file_path, warn = FALSE)
  text_string <- paste(instructies, collapse = "\n")
  return(text_string)
}

## NOTE: It would be possible to display all questions on one page, but only if the codes are the same. So for instance
## by reformulating them to disagree/agree likert scales. But especially for the left-right question this doesn't work well

## misinformation
political_stance <- question("political_stance", 
                             "In welke mate reflecteert dit bericht een links- of rechts politiek standpunt?",
                             instruction = read_and_concatenate("AnnoTinder/instructions/political_stance.txt")  , 
                             vertical = T,
                             codes = c( darkgrey = 'Volledig links/ progressief', 
                                        grey = 'Links/ progressief', 
                                        lightgrey= 'Enigszins links/progressief',
                                        grey = 'Neutraal/ onduidelijk', 
                                        lightred = 'Engiszins rechts/ conservatief',
                                        grey = 'Rechts/conservatief',
                                        darkgrey = 'Helemaal rechts/ conservatief'))

## sentiment
sentiment <- question("sentiment", 
                      "Is deze tweet negatief of positief van toon?",
                      instruction = read_and_concatenate("AnnoTinder/instructions/sentiment.txt") , 
                      vertical=T,
                      codes = c( darkred = 'Zeer negatief',
                                 red = 'Negatief',
                                 lightred = 'Enigszins negatief',
                                 grey = 'Neutral/onduidelijk', 
                                 lightgreen = 'Enigszins positief',
                                 green = 'Positief', 
                                 darkgreen = 'Zeer positief'))

## toxic
toxic <- question("toxic", 
                  "Bevat deze tweet toxische taal?",
                  instruction = read_and_concatenate("AnnoTinder/instructions/toxic.txt")  , 
                  vertical=T,
                  codes = c( darkgreen = 'Zeer beleefd/ vriendelijk', 
                             green = 'Beleefd/ vriendelijk', 
                             lightgreen = 'Enigzins beleefd/vriendelijk',
                             grey = 'Neutraal/ onduidelijk', 
                             lightred = 'Enigzins toxisch',
                             red = 'Toxisch',
                             darkred = 'Zeer toxisch'))

## misinformation
misinformation <- question("misinformation", 
                           "Bevat deze tweet misinformatie?",
                           instruction = read_and_concatenate("AnnoTinder/instructions/misinformation.txt")  , 
                           vertical=T,
                           codes = c( darkgreen = 'Tweet bevat zeker geen misinformatie', 
                                      green = 'Tweet bevat waarschijnlijk geen misinformatie', 
                                      lightgreen = 'Tweet bevat mogelijk geen misinformatie',
                                      grey = 'Neutraal/ onduidelijk', 
                                      lightred = 'Bericht bevat mogelijk misinformatie',
                                      red = 'Bericht bevat waarschijnlijk misinformatie',
                                      darkred = 'Bericht bevat zeker misinformatie'))

codebook <- create_codebook(sentiment, toxic, misinformation, political_stance)
