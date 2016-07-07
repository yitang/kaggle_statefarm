library(data.table)

n_sample <- 1000
files <- sample(list.files("train", rec=T, full=T), n_sample)
sample_files <- gsub('train', paste0('train_', n_sample), files)
for (i in 0:9) {
    dir.create(file.path(paste0('train_', n_sample), paste0('c', i)), rec=T)               
}
file.copy(files, sample_files)

n_sample <- 1000
files <- sample(list.files("test", rec=T, full=T), n_sample)
sample_files <- gsub('test', paste0('test_', n_sample), files)
for (i in 0:9) {
    dir.create(file.path(paste0('test_', n_sample), paste0('c', i)), rec=T)               
}
file.copy(files, sample_files)
