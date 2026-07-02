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
