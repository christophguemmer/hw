sorted.moby.freqs.t["him"]/sorted.moby.freqs.t["her"]
sorted.moby.freqs.t["he"] / sorted.moby.freqs.t["she"]
sorted.moby.rel.freqs.t <- 100 *(sorted.moby.freqs.t/sum(sorted.moby.freqs.t))
plot(sorted.moby.rel.freqs.t[1:10], type="b",xlab="Top Ten Words", ylab="Percentage of Full Text", xaxt ="n")
axis(1,1:10, labels=names(sorted.moby.rel.freqs.t [1:10]))
#3.1
austen.text.v <- scan("data/plainText/austen.txt", what="character", sep="\n")
austen.start.v <- which(austen.text.v == "CHAPTER 1")
austen.end.v <- which(austen.text.v == "THE END")
austen.novel.lines.v <-  austen.text.v[austen.start.v:austen.end.v]
austen.novel.v <- paste(austen.novel.lines.v, collapse=" ")
austen.novel.lower <- tolower(austen.novel.v)
austen.words.1 <- strsplit(austen.novel.lower, "\\W")
austen.word.v <- unlist(austen.words.1)
austen.not.blanks.v <- which(austen.word.v !="")
austen.word.v <- austen.word.v[austen.not.blanks.v]
sense.freqs.t <- table(austen.word.v)
sorted.sense.freqs.t <- sort(sense.freqs.t, decreasing =TRUE)
top.ten.austen.freqs.t <- sorted.sense.freqs.t[1:10]
sorted.sense.rel.freqs.t <- 100 *(sorted.sense.freqs.t/sum(sorted.sense.freqs.t))
plot(sorted.sense.rel.freqs.t[1:10], main="Sense and Sensibility", type="b", xlab="Top Ten Words", ylab="Percentage",xaxt="n")
axis(1,1:10, labels = names(sorted.sense.rel.freqs.t[1:10]))
#3.2
top.ten.sense.moby.freq.t <- c(names(sorted.sense.rel.freqs.t[1:10]), names(sorted.moby.rel.freqs.t[1:10]))
unique(top.ten.sense.moby.freq.t)
#3.3
names(sorted.sense.rel.freqs.t[which(names(sorted.sense.rel.freqs.t[1:10]) %in% names(sorted.moby.rel.freqs.t[1:10]))])
#3.4
only.sense <- which(names(sorted.sense.rel.freqs.t[1:10]) %in% names(sorted.moby.rel.freqs.t[1:10]))
names(sorted.sense.rel.freqs.t[1:10])[-only.sense]


