library(argoFloats)
ai <- getIndex()
s <- subset(ai, circle=list(longitude=-83, latitude=9, radius=500))
plot(s, which='map', bathymetry=FALSE) # To get a visual
pa <- locator(type='l')
# Now select your points on the map in the Atlantic
a <- subset(s, polygon=list(longitude=pa$x, latitude=pa$y))
points(a[['longitude']], a[['latitude']], col=2, pch=20)
pp <- locator(type='l')
# Now select your points on the map in the Pacific
p <- subset(s, polygon=list(longitude=pp$x, latitude=pp$y))
points(p[['longitude']], p[['latitude']], col=3, pch=20)
