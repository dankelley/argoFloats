library(argoFloats)
library(oce)
data(index)
id <- index[["id"]]
cycle <- index[["cycle"]]
t <- sort(table(id))
## isolate the float that has the most cycles
id0 <- names(tail(t, 1))
index0 <- subset(index, id=id0)
o <- order(as.numeric(index0[["cycle"]]))
lon <- index0[["longitude"]][o]
lat <- index0[["latitude"]][o]
cycle <- index0[["cycle"]][o]
t <- index0[["date"]][o]

dist <- 1000 * geodDist(lon, lat, alongPath=TRUE)
speed <- diff(dist) / diff(as.numeric(t))
speed <- c(speed[1], speed)

if (!interactive()) png("07_trajectory_speed.png", unit="in", width=7, height=7, pointsize=11, res=150)
par(mar=c(3,3,1,1))
cm <- colormap(speed, col=oceColorsViridis)
drawPalette(colormap=cm, zlab="Speed [m/s]")
plot(index0)
points(lon, lat, pch=20, cex=2, col=cm$zcol)
lines(lon, lat)
sub <- seq(0, length(lon), by=10)
text(lon[sub], lat[sub], cycle[sub], cex=2/3, pos=1)
mtext(paste("Float", id0), adj=0)
mtext(paste(format(range(t), "%b %Y"), collapse= " to "), adj=1)
if (!interactive()) dev.off()

