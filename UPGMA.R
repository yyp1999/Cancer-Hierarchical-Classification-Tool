library("permute")
library("lattice")
library("ape")
library("phangorn")
library("ggtree")
library("ggplot2")
library("cluster")

filename="data\\SUM.Primary"
matrixA <- as.matrix(read.table(filename,header = TRUE, row.names = 1))
matiixAp=1-cor(matrixA)
matiixBp=as.dist(matiixAp)
up=upgma(matiixAp)
upclust <- hclust(matiixBp, method="average")
asw=numeric(ncol(matrixA))
for (i in 2:(length(asw)-1)) {
  sil=silhouette(cutree(upclust, k=i), matiixBp)
  asw[i]=summary(sil)$avg.width
}
k.best=which.max(asw)
k.best
write.csv(cutree(upclust,k=12),"cluster for subtype\\SUMk=12.test.group.csv")
group_file <- read.csv("cluster for subtype\\30cancer.csv",header = T,row.names = 1)
groupInfo <- split(row.names(group_file), group_file$x)
tree <- groupOTU(up, groupInfo)
png('upgmasubtype715.png', height = height_inch * dpi, width = width_inch * dpi, res = dpi, family = "GB1")
opar <- par(no.readonly = TRUE)
par(mfrow = c(3, 2), col.main = "red", family = "serif")
par(mai = c(0.2, 0.2, 0.2, 0.2))
g <- ggtree(tree, layout = "fan", ladderize = FALSE, branch.length = "none", aes(color = group)) + 
  geom_tiplab2(size = 5) + 
  theme(legend.position = "right") + 
  theme(text = element_text(size = 10))  # 调整字体大小
print(g)
par(opar)
dev.off()
coph=cophenetic(up)
rcor=cor(matiixAp, coph)
plot(matiixAp, coph, xlab="Pearson distance", ylab="Cophenetic distance", asp=1, 
     xlim=c(0, 1), ylim=c(0, 1), main=c("UPGMA Clustering", paste("Cophenetic correlation", round(rcor,3))))
abline(0, 1)
ggtree(upclust, layout="fan", ladderize = FALSE, branch.length = "none")+
  geom_tiplab2(size=50)+ 
  theme(legend.position = "right")
plot(1:length(asw), asw, type="h", main="Silhouette of UPGMA Tree", lwd=2,
     xlab="k(number of clusters", ylab="average silhouette")
