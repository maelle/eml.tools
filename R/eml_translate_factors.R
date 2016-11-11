#' Translate factors into their meanings
#'
#' @param df Data frame
#' @param eml eml metadata
#' @param keep Whether to keep the columns with codes. If FALSE, the meanings replace the factors previous codes.
#'
#' @return
#' @export
#'
#' @examples
#' data("animals_eml")
#' df_factor <- eml_get(animals_eml, "attributeList")$factors
#' data("animals_data")
#' eml_translate_factors(df = animals_data, eml = animals_eml, keep = FALSE)
#' eml_translate_factors(df = animals_data, eml = animals_eml, keep = TRUE)
#'
eml_translate_factors <- function(df, eml, keep = FALSE){
  df_factor <- EML::eml_get(eml, "attributeList")$factors
  names_factors <- unique(df_factor$attributeName)
  names_factors <- names_factors[names_factors %in% names(df)]

  for(name in names_factors){
    df <- eml_translate_one_factor(name, df = df,
                                   df_factor = df_factor,
                                   keep = keep)
  }

  return(df)
}

eml_translate_one_factor <- function(name, df, df_factor, keep){
  df_factor <- dplyr::filter_(df_factor, lazyeval::interp(~ attributeName == name))
  df_factor <- dplyr::select_(df_factor, quote(- attributeName))

  if(keep){
    df_factor <- dplyr::rename_(df_factor, .dots=setNames("definition", paste0(name, "_meaning")))
    df <- suppressWarnings(dplyr::left_join(df, df_factor, by = setNames("code", name)))
  }else{
    df_factor <- dplyr::rename_(df_factor, .dots=setNames("definition", name))
    df <- dplyr::rename_(df, .dots=setNames(name, "code"))
    df <- suppressWarnings(dplyr::left_join(df, df_factor, by = setNames("code", "code")))
    df <- dplyr::select_(df, quote(- code))
  }
  return(df)
}
