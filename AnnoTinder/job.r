library(annotinder)
source('AnnoTinder/units.r')
source('AnnoTinder/train_units.r')
source('AnnoTinder/codebook.r')


n_tweets = 3330
n_anno = 30
overlap = 3

n_batches = n_tweets / n_anno
batch_indices = rep(1:n_batches, each=n_anno)
batches = split(unit_ids, batch_indices)

## The estimated 330 codes falls 3 coders short...
message(sprintf('Need %s coders per condition to code %s units with %s overlap and %s units per coder', 
        length(batches)*3, n_tweets, overlap, n_anno))


## create a jobset for every batch
jobsets = lapply(1:length(batches), function(i) {
  jobset(name = paste0('batch_', i), ids=batches[[i]])
})

## example jobsets
jobsets[[1]]
jobsets[[40]]


## Create debriefing for redirecting after job is finished
debrief_msg = "Klik on de onderstaande link om het onderzoek af te ronden."
debrief_condition1 = debrief(message=debrief_msg, link = "[completion link]", "Klik hier!")
## ... 6 keer link terug naar qualtrics, of 1 keer als er een enkele return link is naar het panel bureau


## Upload job
backend_connect('https://annotinder.up.railway.app', 'a.c.kroon@uva.nl')

upload_job("AnnoBias 1 (test)", units=units_condition_1_2_3, codebook=codebook, pre=intro_units, jobsets=jobsets, debrief=debrief_condition1)


create_job('voorbeeld', units=intro_units, codebook=codebook) |>
  create_job_db(overwrite=T) |>
  start_annotator()


units <- c(intro_unit_1, intro_unit_2, train_unit_1,  train_unit_2)


create_job('voorbeeld', units=units, codebook=codebook) |>
  create_job_db(overwrite=T) |>
  start_annotator()