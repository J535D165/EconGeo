#' Generate a matrix of exit events from two regions - industries matrices (same matrix composition from two different periods)
#'
#' This function generates a matrix of exit events from two regions - industries matrices (same matrix composition from two different periods)
#' @param mat1 An incidence matrix with regions in rows and industries in columns (period 1)
#' @param mat2 An incidence matrix with regions in rows and industries in columns (period 2)
#' @keywords diversification
#' @export
#' @examples
#' ## generate a first region - industry matrix in which cells represent the presence/absence
#' ## of a RCA (period 1)
#' set.seed(31)
#' mat1 <- matrix(sample(0:1,20,replace=T), ncol = 4)
#' rownames(mat1) <- c ("R1", "R2", "R3", "R4", "R5")
#' colnames(mat1) <- c ("I1", "I2", "I3", "I4")
#'
#' ## generate a second region - industry matrix in which cells represent the presence/absence
#' ## of a RCA (period 2)
#' mat2 <- mat1
#' mat2[2,1] <- 0
#'
#'
#' ## run the function
#' exit.mat (mat1, mat2)
#' @author Pierre-Alexandre Balland \email{p.balland@uu.nl}
#' @seealso \code{\link{entry}}, \code{\link{exit.list}}, \code{\link{entry.list}}
#' @references Boschma, R., Balland, P.A. and Kogler, D. (2015) Relatedness and Technological Change in Cities: The rise and fall of technological knowledge in U.S. metropolitan areas from 1981 to 2010, \emph{Industrial and Corporate Change} \strong{24} (1): 223-250 \cr
#' \cr
#' Boschma, R., Heimeriks, G. and Balland, P.A. (2014) Scientific Knowledge Dynamics and Relatedness in Bio-Tech Cities, \emph{Research Policy} \strong{43} (1): 107-114

"exit.mat" <- function(mat1, mat2) {

mat1[mat1 == 0] <- NA
exit = mat1 + mat2
exit[exit == 2] <- 0

return (exit)
}



