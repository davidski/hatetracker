context("base functionality")
test_that("we can do something", {

  expect_that(get_hatetracker_activity("2017-11-25"), is_a("data.frame"))

})
