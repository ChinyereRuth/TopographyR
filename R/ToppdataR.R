usethis::use_description()
usethis::use_package_doc()
usethis::use_mit_license()
usethis::use_github()
devtools::check()
usethis::use_data_raw()
usethis::use_data

#Writing the first function

install.packages("raster")
library(raster)

calculate_slope_aspect <- function(dem) {
  # Calculate slope
  dzdx <- focal(dem, matrix(c(-1,0,1,-2,0,2,-1,0,1), nrow=3, ncol=3),
                fun=function(x) {sum(x)})

  dzdy <- focal(dem, matrix(c(1,2,1,0,0,0,-1,-2,-1), nrow=3, ncol=3),
                fun=function(x) {sum(x)})

  slope <- atan(sqrt(dzdx^2 + dzdy^2))

  # Convert slope to degrees
  slope <- slope * (180 / pi)

  # Calculate aspect
  aspect <- atan2(dzdy, -dzdx)

  # Convert aspect to degrees
  aspect <- (aspect * (180 / pi) + 360) %% 360

  return(list(slope = slope, aspect = aspect))
}
## example of how you can use this function

# Load DEM
elevation_raster <- raster("/Users/chinyereottah/Desktop/Env/TopographyR/data-raw/NWTDEM_2022.tif")

# Calculate slope and aspect
result <-calculate_slope_aspect(elevation_raster)


# Access the slope and aspect rasters
slope_raster <- result$slope
aspect_raster <- result$aspect

# Plot the results
plot(slope_raster, main="Slope")
plot(aspect_raster, main="Aspect")

devtools::check()

devtools::build()

usethis::use_readme_rmd()

# web page for your package, use the following function.
usethis::use_pkgdown_github_pages()

devtools::document()
