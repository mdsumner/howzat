## code to prepare `sfobj` dataset goes here
sfobj <- sf::st_sf(a = 1:2, geom = sf::st_sfc(silicate::sfzoo$multipolygon,
                                              silicate::sfzoo$multipolygon * 0.3 + 5))
usethis::use_data(sfobj)
