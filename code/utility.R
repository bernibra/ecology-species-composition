# Global parameters
fontsize <- 12

# A few functions to facilitate the visualizations and reduce the code length

# A function factory for getting integer y-axis values.
integer_breaks <- function(n = 5, ...) {
  fxn <- function(x) {
    breaks <- floor(pretty(x, n, ...))
    names(breaks) <- attr(breaks, "labels")
    breaks
  }
  return(fxn)
}

# A theme for the figures

add_theme <- function(p){
  return(
    p + 
      scale_linetype_manual(values = c("0" = 2, "1" = 1)) +
      scale_x_continuous(breaks = integer_breaks()) +
      guides(colour = guide_legend(override.aes = list(alpha = 1)), linetype=FALSE, fill=FALSE) +
      theme_bw() +
      theme(text = element_text(size=fontsize),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            legend.title = element_blank(),
            legend.text=element_text(size=fontsize),
            legend.background = element_rect(size = 0.2, colour = "black"),
            legend.position = c(0.05, 0.95),
            legend.justification=c(0,1),
            plot.margin = unit(c(0.3,0.3,0.5,0.5), "cm"),
            axis.text = element_text(colour = "black"),
            panel.border = element_rect(colour = "black", fill=NA, size=0.4))
  )
}