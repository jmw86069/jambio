% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jambio-tx.R
\name{addGRgaps}
\alias{addGRgaps}
\title{Add gaps between GRanges regions}
\usage{
addGRgaps(
  gr,
  strandSpecific = TRUE,
  gapname = "gap",
  suffix = "_v",
  newValues = list(feature_type = "gap"),
  default_feature_type = "exon",
  feature_type_colname = "feature_type",
  doSort = TRUE,
  ...
)
}
\arguments{
\item{gr}{GRanges object}

\item{strandSpecific}{logical indicating whether the gaps are calculated
per strand, see \code{getGRgaps()}.}

\item{gapname, suffix}{character vector supplying the name to assign to new
gap GRanges elements, using \code{jamba::makeNames()} with \code{suffix} as
described to define non-duplicated names. If \verb{gapname is NULL} then
no names are assigned to new gap GRanges entries, however when the
input \code{gr} GRanges object has names, the concatenation of gaps
causes names \code{""} to be assigned to all gap GRanges elements, which
are duplicated for multiple gaps.}

\item{newValues}{list of values to add to the resulting gap GRanges,
whose names become \code{colnames(gr)}, and whose values are used
to populate each column. By default a colname \code{"feature_type"} is
added, with value \code{"gap"} added to each row. When \verb{newValues is NULL}
then no values are added to the gaps GRanges.}

\item{doSort}{logical indicating whether to sort the resulting
GRanges object. When \code{doSort=FALSE} the gaps are added to the end
of the \code{gr} input GRanges object.}

\item{...}{additional arguments are passed to \code{getGRgaps()}.}
}
\value{
GRanges object, sorted when \code{doSort=TRUE}. When \code{newValues}
is supplied, the values for gaps GRanges elements will be assigned,
otherwise any column values present in \code{gr} will be \code{NA} for
gaps elements. The names of gaps elements are assigned using
\code{gapname} then are made unique using \code{jamba::makeNames()},
unless \verb{gapname is NULL}.
}
\description{
Add gaps between GRanges regions
}
\details{
This function adds gaps between each GRanges region where
there is a gap between two GRanges for
the same seqnames. When \code{strandSpecific=TRUE} the gaps are
determined per strand.

This function is a wrapper around \code{getGRgaps()}, which is then
concatenated to the input \code{gr} GRanges object using \code{base::c()}.
When the input \code{gr} has column \code{S4Vectors::values()} then the
gaps GRanges object will have \code{NA} values used by default. To supply
values, use the \code{newValues} argument, which assigns name-value pairs.
}
\examples{
gr <- GenomicRanges::GRanges(seqnames=rep(c("chr1","chr2"), c(3,2)),
   ranges=IRanges::IRanges(start=c(100, 300, 400, 300, 700),
      end=c(199, 450, 500, 600, 800)),
   strand=rep(c("+","-"), c(3,2)));
gr;
getGRLgaps(GenomicRanges::split(gr, GenomicRanges::seqnames(gr)))
getGRgaps(gr);

}
\seealso{
Other jam GRanges functions: 
\code{\link{addGRLgaps}()},
\code{\link{annotateGRLfromGRL}()},
\code{\link{annotateGRfromGR}()},
\code{\link{assignGRLexonNames}()},
\code{\link{closestExonToJunctions}()},
\code{\link{combineGRcoverage}()},
\code{\link{exoncov2polygon}()},
\code{\link{findOverlapsGRL}()},
\code{\link{flattenExonsBy}()},
\code{\link{getFirstStrandedFromGRL}()},
\code{\link{getGRLgaps}()},
\code{\link{getGRcoverageFromBw}()},
\code{\link{getGRgaps}()},
\code{\link{grl2df}()},
\code{\link{jam_isDisjoint}()},
\code{\link{make_ref2compressed}()},
\code{\link{sortGRL}()},
\code{\link{spliceGR2junctionDF}()},
\code{\link{stackJunctions}()}
}
\concept{jam GRanges functions}
