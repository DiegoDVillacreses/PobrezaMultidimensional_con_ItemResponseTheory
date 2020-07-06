library(readstata13)
library(data.table)
library(magrittr)

enem18dic = read.dta13("201812_enemdu.dta", convert.factors = F)
enem18dic.var.labels = attr(enem18dic,"var.labels")
enem18dic.var.labels = data.table(VarName = names(enem18dic),
                                  VarLabel = enem18dic.var.labels)
enem18dic.val.labels = attr(enem18dic,"label.table")
enem18dic = enem18dic %>% data.table()

fwrite(x = enem18dic, file = "enem18dic.csv")
fwrite(x = enem18dic.var.labels, file = "enem18dic.var.labels.csv")
saveRDS(object = enem18dic.val.labels, file = "enem18dic.val.labels.RDS")
