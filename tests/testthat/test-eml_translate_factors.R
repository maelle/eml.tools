context("eml_translate_factors")

test_that("eml_translate_factors works for one table", {
  data("animals_eml")
  data("animals_data")
  output1 <- eml_translate_factors(df = animals_data, eml = animals_eml, keep = FALSE)
  expect_is(output1, "tbl_df")
  expect_equal(ncol(output1), ncol(animals_data))
  output2 <- eml_translate_factors(df = animals_data, eml = animals_eml, keep = TRUE)
  expect_is(output2, "tbl_df")
  expect_equal(ncol(output2), ncol(animals_data) + 2)
})
