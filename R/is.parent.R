#' @title Is the study a parent or a child study?
#'
#' @param phs dbGaP study ID (phs00xxxx, or 00xxxx, or xxx)
#'
#' @return Returns a logical TRUE if the study is a parent, and FALSE if the study is a child
#'
#' @author Gregoire Versmee, Laura Versmee, Mikael Dusenne, Niloofar Jalali
#' @export


is.parent <- function(phs)  {

    phs <- phs.version(phs)
    return(cache.call(
        match.call()[[1]],
        phs, {
            content <- RCurl::getURL(paste0("https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id=", phs))
            !grepl("A sub-study of ", content)
        }))

}
