## code to create hex sticker

library(ggforce)
library(ggplot2)
library(here)
#library(magick)
library(hexSticker)
library(showtext)

font_add_google("Orbitron")

positions <- data.frame(
  x = c(-sin(pi/4), -2, -1.7),
  y = c(-cos(pi/4), 1, 1.5)
)

hp <- ggplot() +
  geom_circle(aes(x0 = 0, y0 = 0, r = 1),
              fill = "#0089b9",
              color = "#0089b9") +
  coord_equal() +
  geom_polygon(data = positions,
               aes(x = x, y = y),
               fill = "#0089b9",
               color = "#0089b9") +
  theme_void()
  #tools %>%
  #image_scale("150") %>%
  #image_ggplot()


hs <- sticker(hp,
              s_x = 1,
              s_y = 0.70,
              s_width = 0.8,
              s_height = 0.8,
              package = "gravity",
              h_fill = "orange",
              h_color = "#0089b9",
              p_size = 12,
              p_x = 1.03,
              p_y = 1.40,
              p_family = "Orbitron",
              p_fontface = "bold",
              p_color = "white",
              h_size = 2.3,
              url = "paezha.github.io/gravityshop",
              u_color = "orange",
              u_family = "Orbitron",
              u_x = 0.15,
              u_y = 1.52,
              u_size = 2,
              filename = paste0(here(), "/man/figures/logo.png"))
