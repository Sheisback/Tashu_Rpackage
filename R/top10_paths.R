#' Visualize Top 10 Pathes that were most used from 2013 to 2015.
#' @export
#' @importFrom ggplot2 ggplot geom_point aes_string
#' @importFrom utils head
#' @examples
#' \dontrun{top10_paths()}
#'
top10_paths <- function() {
  check_data()
    trace_cnt <- data.frame(table(tashudata::tashu$RENT_STATION, tashudata::tashu$RETURN_STATION))
    names(trace_cnt) <- c("RENT_STATION", "RETURN_STATION", "COUNT")
    sort_trace_cnt <- head(trace_cnt[order(-trace_cnt$COUNT), ], 10)
    ggplot() +
      geom_point(
        aes_string(x = "RENT_STATION", y = "RETURN_STATION", size = "COUNT"),
        data = sort_trace_cnt)+
      ggtitle("Most Popular paths In 2013 ~ 2015\n")
}
