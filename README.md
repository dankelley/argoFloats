# argoFloats

[![TravisCI Build Status](https://travis-ci.org/argoCanada/argoFloats.svg?branch=develop)](https://travis-ci.org/argoCanada/argoFloats)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/argoCanada/argoFloats?branch=develop&svg=true)](https://ci.appveyor.com/project/argoCanada/argoFloats)
[![codecov](https://codecov.io/gh/argoCanada/argoFloats/branch/develop/graph/badge.svg)](https://codecov.io/gh/argoCanada/argoFloats)

The argoFloats package for the R language provides tools for downloading and
analyzing collections of oceanographic Argo float datasets.  Its developers are
* Dan Kelley, Dalhousie University
* Jaimie Harbin, Bedford Institute of Oceanography and Dalhousie University
* Clark Richards, Bedford Institute of Oceanography

Since argoFloats is still in a phase of active development, it is not yet
available on CRAN.  Still, it is easily installed in R with
```R
library(devtools)
install_github('argoCanada/argoFloats', ref='develop')
```
where, of course, the `devtools` package must be installed first, if it is not
already present on the user's system.  It is also necessary to have up-to-date
versions of the `oce` and `ocedata` packages installed, which is accomplished with
```R
install_github('argoCanada/oce', ref='develop')
install_github('argoCanada/ocedata', ref='develop')
```

Once things are set up as above, it will be possible to use all the features of
`argoFloats`, many of which are illustrated in the documentation for its
functions, and in the vignette that is built into the package.

For example, the following shows how to create a map and a temperature-salinity
diagram for several Argo float profiles made near Abaco Island in the Bahamas.
The `getIndex()` call specifies a directory to hold the index of float
profiles, and this directory carries through to the `getProfiles()` call, which
downloads the netcdf files that contain the profile data, and later to the
`readProfiles()` call, which reads those files.  Use `?getIndex` to learn
more about the first function used, `?"subset,argoFloats-method"` to learn
about the second, etc.  (Note that `subset` and `plot` are generic functions,
so the help is accessed with the comma notation.)
```R
library(argoFloats)
library(oce)
indexAll <- getIndex(destdir="~/data/argo")
index <- subset(indexAll,
                circle=list(longitude=-77.06, latitude=26.54, radius=30))
profiles  <- getProfiles(index)
argos <- readProfiles(profiles, handleFlags=TRUE)
par(mfrow=c(1, 2))
plot(index, which="map")
plot(argos, which="TS")
```
![Sample TS plot.](exampleTS.png)

