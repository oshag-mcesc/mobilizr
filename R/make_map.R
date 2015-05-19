#' Make a map of points
#'
#' A function that creates a plot of points on a background map pulled from
#' Google Maps' API.
#'
#' Creates a map using a Google Maps basemap, with points of data on top. Points
#' can be colored differently and sized according to another variable
#' @param x Function of the form latitude~longitude
#' @param data Data frame containing latitude and longitude variables
#' @param e the extent for the map. If not given, the function will determine an
#'   extent from the points that were provided.
#' @param scaleby the variable for bubbles to be scaled by in a bubble plot.
#' @param size Allows the user to shrink or expand the size of the plotted
#'   points as a percent of the default points size. For example, size = 80
#'   would display points that are 80\% of their original size. Size = 120 would
#'   display points that are 120\% of their original size.
#' @param add a logical value specifying whether you want to add the plot you
#'   are creating to the previous one you created (for example, if plotting a
#'   different subset in a separate color to be displayed on the same map).
#'   Defaults to FALSE.
#' @param col a specification for the plotting color. Defaults to "blue". You
#'   can provide any color name here, like "red", "purple", etc., in quotes. Or,
#'   you could use hex values like "FF00FF", again in quotes. See section 'Color
#'   Specification' in the \code{\link{par}} documentation for more.
#' @param pch either an integer specifying a symbol or a single character to be
#'   used as the default in plotting points. The default is 20, which
#'   corresponds to filled-in circles, but you could use any number between 1
#'   and 25. See \code{\link{points}} for possible values and their
#'   interpretation, or just try using some numbers and see what they do. You
#'   could also provide a symbol in quotes, like "m" and all the points would
#'   plot as "m"s.
#' @param dots graphical parameters to be passed to \code{\link{points}}. For
#'   example, you could change the size of the dots on the map by passing
#'   \code{cex=2}.
#' @return A map of points with a google map background
#' @examples
#' lat <- runif(10, 32, 42)
#' lon <- runif(10, -124, -114)
#' geodata <- data.frame(lat, lon)
#' scale <- sample(1:10, 10)
#' type <- as.factor(sample(c("a","b","c"), size = 10, replace = TRUE))
#' MakeMap(lat~lon, data=geodata)
#' MakeMap(lat~lon, data=geodata, scaleby = scale)
#' MakeMap(lat~lon, data=geodata, scaleby = scale, size = 50)   # shrink bubbles by 50\%
#' MakeMap(lat~lon, data=geodata, scaleby = scale, size = 150)  # expand bubbles by 50\%
#' MakeMap(lat~lon, data=geodata col = type)
#' MakeMap(lat~lon, data=geodata, scaleby = scale, col = type)

make_map <- function(x, data=parent.frame(), e, scaleby, size = 100, add=FALSE, col='blue', pch=20, color, ...){
  latitude <- data[, deparse(lhs(x))]
  longitude <- data[, deparse(rhs(x))]
  xy1 <- cbind(longitude, latitude)
    if(!missing(scaleby)) {
      scaleby <- substitute(scaleby)
      scaleby_text <- paste0(data, "$", scaleby)
      scaleby <- eval(parse(text=scaleby_text))
    }
    if(!missing(col)) {
      col <- substitute(col)
      if(class(col)!="character") {
        col <- substitute(col)
        col_text <- paste0(data, "$", col)
        col <- as.factor(as.character(eval(parse(text=col_text))))
      } else {
        col <- substitute(col)
      }
    }
  projected <- Mercator(xy1)
  if(!missing(color)) {
    stop("Remember to use the argument 'col' and not 'color'.")
  }
  if(missing(e)) {
    if(nrow(projected) == 1) {
      latrange <- extendrange(latitude, r = c(latitude - 0.1, latitude + 0.1),
                              f=0.3)
      lonrange <- extendrange(longitude, r = c(longitude - 0.1, longitude + 0.1),
                              f=0.5)
      x <- extent(lonrange[1], lonrange[2], latrange[1], latrange[2])
    } else {
      latrange <- extendrange(latitude, f=0.04)
      lonrange <- extendrange(longitude, f=0.04)
      x <- extent(lonrange[1], lonrange[2], latrange[1], latrange[2])
      f1 <- (latrange[2] - latrange[1])/(lonrange[2] - lonrange[1])
      if (f1 < 1/4) {
        latrange <- extendrange(latitude, f = 1.5 - f1)
        x <- extent(lonrange[1], lonrange[2], latrange[1], latrange[2])
      }
      if (f1 > 5/4) {
        lonrange <- extendrange(longitude, f = f1 - 1)
        x <- extent(lonrange[1], lonrange[2], latrange[1], latrange[2])
      }
    }
  }
  else {
    x <- e
    subset1 <- which(projected[,2]<ymax(x) & projected[,2]>ymin(x) & projected[,1]<xmax(x) & projected[,1]>xmin(x))
    projected <- projected[subset1,]
    if (!missing(scaleby)){
      scaleby <- scaleby[subset1]
    }
  }
  r = gmap(x, scale=2)
  par.old <- par(no.readonly = TRUE)$mar
  if (add==FALSE) {
    plot(r, interpolate=TRUE)
  }
  if (!missing(scaleby)){
    radius <- sqrt(scaleby /pi)
    bubble.size <- 0.35 * size / 100
    if (is.factor(col)) {
      symbols(projected[order(-radius), ], circles=radius[order(-radius)], inches=bubble.size, add=TRUE, bg=col[order(-radius)], fg='white',...)
    } else {
      symbols(projected[order(-radius), ], circles=radius[order(-radius)], inches=bubble.size, add=TRUE, bg=col, fg='white',...)
    }
  } else {
    point.size <- size / 100
    points(projected, col=col, pch = pch, cex = point.size)
    par(mar=par.old);
  }
}
