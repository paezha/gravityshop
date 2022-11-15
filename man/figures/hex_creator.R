## code to create hex sticker

library(dplyr)
library(ggforce)
library(ggplot2)
library(here)
#library(magick)
library(hexSticker)
library(sf)
library(showtext)

font_add_google("Orbitron")

plot(st_make_grid(c, cellsize = 5, n = c(1, 1), square = FALSE))

hx <- matrix(c(0, 1/2,
               cos(2 * pi/12)/2, sin(2 * pi/12)/2,
               cos(2 * pi/12)/2, -sin(2 * pi/12)/2,
               0, -1/2,
               -cos(2 * pi/12)/2, -sin(2 * pi/12)/2,
               -cos(2 * pi/12)/2, sin(2 * pi/12)/2,
               0, 1/2),
             ncol=2,
             byrow=TRUE)

hx <- st_polygon(list(hx))

cc <- st_sfc(st_point(c(cos(2 * pi/12)/2,
                        -sin(2 * pi/12)/2)))
cc <- st_sf(r = 0.2,
            geometry = cc)
cc <- st_buffer(cc,
                dist = 0.6)
cc <- st_intersection(cc,
                      hx)

pt <- data.frame(x = rnorm(100000,
                           mean = cos(2 * pi/12)/2,
                           sd = 0.35),
                 y = rnorm(100000,
                           mean = -sin(2 * pi/12)/2,
                           sd = 0.35),
                 size = abs(rnorm(100000,
                              mean = -sin(2 * pi/12)/2,
                              sd = 0.15)),
                 alpha = 1- abs(rnorm(100000,
                                   mean = -sin(2 * pi/12)/2,
                                   sd = 0.35))) |>
  mutate(alpha = (alpha - min(alpha))/(max(alpha) - min(alpha))) |>
  st_as_sf(coords = c("x",
                      "y"))

pt <- st_intersection(pt,
                      hx)

hp <- ggplot() +
  geom_sf(data = hx,
          color = NA,
          fill = "#FF9966") +
  geom_sf(data = pt,
          aes(size = exp(size),
              alpha = alpha),
          shape = 16,
          color = "#FF691E") +
  geom_sf(data = cc,
          color = NA,
          fill = "#0089b9") +
  scale_size(range = c(0.001, 1)) +
  scale_alpha(range = c(0.1, 0.5)) +
  theme_void() +
    theme(legend.position = "none")




#positions <- data.frame(
#  x = c(-sin(pi/4), -2, -1.7),
#  y = c(-cos(pi/4), 1, 1.5)
#)

#ggplot() +
#  geom_circle(aes(x0 = 0, y0 = 0, r = 1),
#              fill = "#0089b9",
#              color = "#0089b9") +
#  coord_equal() +
#  geom_polygon(data = positions,
#               aes(x = x, y = y),
#               fill = "#0089b9",
#               color = "#0089b9") +
#  theme_void()


hs <- sticker(hp,
              s_x = 1,
              s_y = 1,
              s_width = 2.2,
              s_height = 2.2,
              package = "gravity",
              h_fill = "#FF9966",
              h_color = "#0089b9",
              p_size = 12,
              p_x = 1.00,
              p_y = 1.10,
              p_family = "Orbitron",
              p_fontface = "bold",
              p_color = "white",
              h_size = 2.3,
              url = "paezha.github.io/gravityshop",
              u_color = "#FF9966",
              u_family = "Orbitron",
              u_x = 0.94,
              u_y = 0.076,
              u_size = 2,
              filename = paste0(here(), "/man/figures/logo.png"))
