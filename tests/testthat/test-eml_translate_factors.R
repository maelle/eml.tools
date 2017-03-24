context("eml_translate_factors")

test_that("eml_translate_factors works for one table", {
  data("animals_eml")
  data("animals_data")
  output1 <- eml_translate_factors(df = animals_data, eml = animals_eml, keep = FALSE)
  expect_is(output1, "tbl_df")
  expect_equal(ncol(output1), ncol(animals_data))
  expect_equal(sum(is.na(output1$age)), 0)
  expect_equal(sum(is.na(output1$animal)), 0)
  output2 <- eml_translate_factors(df = animals_data,
                                   eml = animals_eml,
                                   keep = TRUE)
  expect_is(output2, "tbl_df")
  expect_equal(ncol(output2), ncol(animals_data) + 2)
  expect_equal(sum(is.na(output2$age_meaning)), 0)
  expect_equal(sum(is.na(output2$animal_meaning)), 0)
})



test_that("eml_translate_factors works for a group of tables", {
  data("animals_db_eml")
  data("animals_data")
  output1 <- eml_translate_factors(df = animals_data,
                                   eml = animals_db_eml,
                                   keep = FALSE,
                                   which_table = "english_animals")
  expect_is(output1, "tbl_df")
  expect_equal(ncol(output1), ncol(animals_data))
  expect_equal(sum(is.na(output1$age)), 0)
  expect_equal(sum(is.na(output1$animal)), 0)
  output2 <- eml_translate_factors(df = animals_data,
                                   eml = animals_db_eml,
                                   keep = TRUE,
                                   which_table = "english_animals")
  expect_is(output2, "tbl_df")
  expect_equal(ncol(output2), ncol(animals_data) + 2)
  expect_equal(sum(is.na(output2$age_meaning)), 0)
  expect_equal(sum(is.na(output2$animal_meaning)), 0)
})
