text_cleanr <- function(insert_original_texting_data_here) {
  bye_bye_brackets <- insert_original_texting_data_here %>%
    mutate(Birth_Gender = gsub("\\[|\\]", "", Birth_Gender))

  print("Stop texting in math class!")
  return(bye_bye_brackets)
}
