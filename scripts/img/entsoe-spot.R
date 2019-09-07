library(feather)
library(dplyr)
library(ggplot2)

dat <- read_feather("data/entsoe-spot.feather") %>%
  filter(between(Date,
    as.Date("2015-01-06"),
    as.Date("2018-12-31")
  ))

p <- ggplot(dat) +
  aes(Date, Spot, color = Hour) +
  geom_line() +
  scale_color_viridis_c() +
  theme_bw() +
  labs(y = "Price [EUR/MW]")

ggsave("img/gen/entsoe-spot.pdf", p, width = 7.2, height = 4.2)
