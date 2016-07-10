#' Compute the average relatedness density within the regional portfolio from regions - industries matrices and industries - industries matrices
#'
#' This function computes the average relatedness density within the regional portfolio from regions - industries (incidence) matrices and industries - industries (adjacency) matrices. This is a measure of the technological coherence of the regional industrial structure. 
#' @param mat An incidence matrix with regions in rows and industries in columns
#' @param relatedness An adjacency industry - industry matrix indicating the degree of relatedness between industries
#' @keywords relatedness density co-occurences relatedness normalized co-occurences
#' @export
#' @examples
#' ## generate a region - industry matrix in which cells represent the presence/absence of a RCA
#' set.seed(31)
#' mat <- matrix(sample(0:1,20,replace=T), ncol = 4) 
#' rownames(mat) <- c ("R1", "R2", "R3", "R4", "R5")
#' colnames(mat) <- c ("I1", "I2", "I3", "I4")
#' 
#' ## generate an industry - industry matrix in which cells indicate if two industries are related (1) or not (0)
#' relatedness <- matrix(sample(0:1,16,replace=T), ncol = 4) 
#' relatedness[lower.tri(relatedness, diag = TRUE)] <- t(relatedness)[lower.tri(t(relatedness), diag = TRUE)]
#' rownames(relatedness) <- c ("I1", "I2", "I3", "I4")
#' colnames(relatedness) <- c ("I1", "I2", "I3", "I4")
#' 
#' ## run the function
#' avg.relatedness.density.int (mat, relatedness)
#' @author Pierre-Alexandre Balland \email{p.balland@uu.nl}
#' @seealso \code{\link{relatedness}}, \code{\link{relatedness.density}}, \code{\link{relatedness.density.ext}}, \code{\link{relatedness.density.int}}, \code{\link{avg.relatedness.density.ext}}
#' @references Boschma, R., Balland, P.A. and Kogler, D. (2015) Relatedness and Technological Change in Cities: The rise and fall of technological knowledge in U.S. metropolitan areas from 1981 to 2010, \emph{Industrial and Corporate Change} \strong{24} (1): 223-250 \cr
#' \cr
#' Balland P.A., Rigby, D., and Boschma, R. (2015) The Technological Resilience of U.S. Cities, \emph{Cambridge Journal of Regions, Economy and Society}, \strong{8} (2): 167-184

"avg.relatedness.density.int" <- function(mat, relatedness) {

# nb of tech related to i in each cities
rel <- mat %*% relatedness

# absolute nb of techs related to i (anywhere)
reltot <- colSums(relatedness)

# share of tech related to i in each cities
reldens <- t(rel) / reltot

# scale 0 to 100 - cities in rows / techs in columns
reldens <- t(reldens) * 100

# round
reldens <- round (reldens, digits = 0)

# set non existing tech to NA
mat[mat == 0] <- NA

reldensint <- (rowSums (reldens * mat, na.rm = T) / rowSums (mat, na.rm = T))

return (reldensint)
}



