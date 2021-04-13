library('tidytext')
library('tidyverse')
library('ggrepel')

setwd("~/listening-to-images")

ss <- read.csv("sound_scores.csv")

ss <- as.data.frame((ss))

ss_df <- tibble(id = ss$Figure, text = ss$emotion, intensity = ss$arousal_score)

ss_df <- mutate(ss_df, text = as.character(ss_df$text))

str(ss_df)

tidy_ss <- ss_df %>%
  unnest_tokens(word, text)

data(stop_words)

# delete stopwords from our data
tidy_ss <- tidy_ss %>%
  anti_join(stop_words)

get_sentiments("afinn")

afinn <- tidy_ss %>%
  inner_join(get_sentiments("afinn")) %>%
  mutate(method = "AFINN") %>%
  group_by(id)

tot_score <- aggregate(x = afinn$score,                # Specify data column
                       by = list(afinn$id),            # Specify group indicator
                       FUN = sum)

ss_df$emotion_score <- tot_score$x

ss_df$emotion_score2 <- bing_and_nrc$sentiment

ggplot(ss_df) +
  geom_point(aes(x=intensity, y=emotion_score)) +
  geom_text_repel(aes(x=intensity, y=emotion_score, label=id),hjust=0, vjust=0) +
  theme_bw()
