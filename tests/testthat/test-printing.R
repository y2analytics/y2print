### frequency tibble class testing
#Returns class freq_y2
test_that("`freq()` returns a frequency tibble", {
  expect_s3_class(y2clerk::freqs(mtcars, cyl), 'freq_y2')
})

# Prints the question wordings
test_that("`freq()` prints question wordings", {
  test_freq1 <- responses |>
    dplyr::select(q1) |>
    y2clerk::freq()

  expect_snapshot(print(test_freq1))
})


# Prints only three question wordings
test_that("`freq()` prints only three question wordings", {
  test_freq <- responses |>
    dplyr::select(q1, q2, q3, q4) |>
    y2clerk::freq()

  # Prints The question wordings for the first three
  # Does not print the question wording for the forth
  # Does print message saying how may questions have wordings that are not displayed
  expect_snapshot(print(test_freq))
})

test_that("freqs() prints a basic frequency tibble with the haven label data up top when applicable", {
  with_label <- responses |> y2clerk::freqs(q1)
  without_label <- responses |>
    dplyr::mutate(q5 = as.character(q5)) |>
    y2clerk::freqs(q5)
  expect_snapshot(print(with_label))
  expect_snapshot(print(without_label))
})

test_that("freqs() print shows truncation footer for long output", {
  test_freq <- mtcars |> y2clerk::freqs(hp)
  expect_snapshot(print(test_freq))
})

test_that("freqs() print shows Groups in header when grouped", {
  test_freq <- mtcars |>
    dplyr::group_by(cyl) |>
    y2clerk::freqs(gear)
  expect_snapshot(print(test_freq))
})
