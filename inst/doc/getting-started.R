## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment  = "#>",
  eval     = FALSE
)

## ----install------------------------------------------------------------------
# # Install from GitHub
# remotes::install_github("janfreihardt/BEMPdata")

## ----wave-overview------------------------------------------------------------
# library(BEMPdata)
# 
# wave_overview
# 
# # In-person waves only
# wave_overview[wave_overview$type == "in-person", ]

## ----get-wave-----------------------------------------------------------------
# # Baseline in-person wave (2021)
# w1 <- get_wave("w1")
# head(w1)
# 
# # Wave 6, migrant questionnaire
# w6_migrant <- get_wave("w6_M")
# 
# # Wave 14, non-migrant questionnaire, in Stata format (with value labels)
# w14_nm <- get_wave("w14_N", format = "dta")

## ----lookup-------------------------------------------------------------------
# # Find all variables related to income
# lookup_variable("income")
# 
# # Search only in variable labels
# lookup_variable("migrat", fields = "label")
# 
# # Use a regular expression
# lookup_variable("flood|erosion")

## ----get-codebook-------------------------------------------------------------
# # Codebook for the baseline wave
# cb_w1 <- get_codebook("w1")
# names(cb_w1)
# 
# # Merged codebook across all waves
# cb_all <- get_codebook("all")
# nrow(cb_all)

## ----bundled-codebook---------------------------------------------------------
# # Available offline
# head(codebook[, c("wave", "variable_name", "variable_label", "block")])

## ----cache--------------------------------------------------------------------
# # Check what is cached and how much space it uses
# bemp_cache_info()
# 
# # Clear the cache (will prompt for confirmation)
# bemp_cache_clear()

## ----merge--------------------------------------------------------------------
# library(dplyr)
# 
# w1  <- get_wave("w1")
# w6n <- get_wave("w6_N")
# 
# # Identify the respondent code columns
# lookup_variable("respondent code", fields = "label")
# 
# # Merge on respondent code (adjust variable names as needed)
# panel <- inner_join(w1, w6n, by = "w1_reg1", suffix = c("_w1", "_w6n"))

