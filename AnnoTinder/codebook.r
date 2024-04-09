## main codebook annotation

read_and_concatenate <- function(file_path) {
  instructies <- readLines(file_path, warn = FALSE)
  text_string <- paste(instructies, collapse = "\n")
  return(text_string)
}


?question
## misinformation
stellingen <- question("stellingen", 
                  "In welke mate bent u het eens met de volgende stellingen?",
             type='scale',
             instruction = read_and_concatenate("AnnoTinder/instructions/political_stance.txt")  , 
             items = list(
               political_stance = "Deze tweet reflecteert een rechts (in vergelijking tot links) politiek standpunt.",
               sentiment = "Deze tweet heeft een negatieve toon.",
               toxic = "Deze tweet bevat toxische taal.",
               misinformation = "Deze tweet bevat misinformatie."
             ),
             codes = c( 'Geheel mee oneens', 
                        'Mee oneens', 
                        'Neutraal', 
                        'Mee eens',
                        'Geheel mee eens'))

codebook <- create_codebook(stellingen)
