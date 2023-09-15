library("tidyverse")

regions  <- c(
  "Derbyshire",
  "Leicestershire",
  "Staffordshire",
  "Warwickshire"
)

data  <- read.csv("props.csv")

data %>%
  filter(Region_Name %in% regions) %>%
  filter(Date > "2013-01-01") %>%
  ggplot(aes(
    Date,
    Semi_Detached_Average_Price
  )) +
  geom_point(aes(color = Region_Name), size = 3) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  labs(
    title = "Average Semi-detached house prices per county",
    x = "Month and Year",
    y = "Average Price",
    color = "County"
  )

ggsave(
  "semi-detached-house-prices-derby-leicester-staffs-warwickshire.png",
  width = 4096,
  height = 2160,
  unit = "px"
)
