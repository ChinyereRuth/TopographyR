
install.packages("roxygen2")

# Calculate Slope and Aspect from a Digital Elevation Model (DEM)
#'
#' This function computes both slope and aspect from a Digital Elevation Model (DEM).
#'
#' @param dem A raster object representing the Digital Elevation Model.
#' @return A list containing two raster objects: "slope" representing the slope and "aspect" representing the aspect.
#' @export
#'
#' @examples
#' \dontrun{
#' # Example usage
#' elevation_raster <- raster("/Users/chinyereottah/Desktop/Env/TopographyR/data-raw/NWTDEM_2022.tif")
#' result <- calculate_slope_aspect(elevation_raster)
#' slope_raster <- result$slope
#' aspect_raster <- result$aspect
#' plot(slope_raster, main="Slope")
#' plot(aspect_raster, main="Aspect")
#' }
#'
library(roxygen2)
roxygenize()
