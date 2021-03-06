% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jam-sets.R
\name{list2im}
\alias{list2im}
\title{Convert list to incidence matrix}
\usage{
list2im(x, makeUnique = TRUE, verbose = FALSE, ...)
}
\arguments{
\item{x}{list of character vectors.}

\item{makeUnique}{logical indicating whether to enforce uniqueness on
each vector in the list. If \code{makeUnique=FALSE} and there are
duplicated values, then the resulting incidence matrix will be
updated to reflect the count of each element.}

\item{verbose}{logical indicating whether to print verbose output.}
}
\description{
Convert list to incidence matrix
}
\details{
This function uses some very efficient methods from the \code{arules}
package to convert a list of items into an incidence matrix.
The conversion creates a \code{transactions} object, which takes
advantage of the efficient code, then extracts the matrix from
that object. Unfortunately, that object class does not permit
counting each item, though it may be possible through another
method.

The incidence matrix will have rownames matching list elements,
and colnames match the list names.

In future the uniqueness step may be carried out using
\code{S4Vectors} list methods, which are also highly efficient
specifically in handling very large lists.
}
\examples{
set.seed(123);
l1 <- list(first=sample(letters, 10),
   second=sample(letters, 15),
   third=sample(letters, 5));
list2im(l1);

}
\seealso{
Other jam list functions: 
\code{\link{intercalate}()}
}
\concept{jam list functions}
