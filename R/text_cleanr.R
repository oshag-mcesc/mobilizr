text_cleanr <- function(insert_original_texting_data_here) {
  bye_bye_brackets <- insert_original_texting_data_here %>%
    mutate(Birth_Gender = gsub("\\[|\\]", "", Birth_Gender))
  bye_bye_spaces <- bye_bye_brackets %>%
    mutate(Birth_Gender = gsub(" ", "", Birth_Gender))

  print("Stop texting in math class!")
  return(bye_bye_spaces)
}

again <- mobilizr::read.csv("~/Downloads/Fixed data.csv")

again <- text_cleanr(again)
str(again)
