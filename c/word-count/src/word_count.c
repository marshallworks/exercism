#include "word_count.h"
#include <ctype.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

static int check_word(const char *word, word_count_word_t *words, int count) {
  for (int i = 0; i < count; ++i) {
    if (strcmp(word, words[i].text) == 0) {
      ++words[i].count;
      return 0;
    }
  }
  strncpy(words[count].text, word, MAX_WORD_LENGTH + 1);
  words[count].count = 1;
  return 1;
}

int word_count(const char *input_text, word_count_word_t *words) {
  char temp_word[MAX_WORD_LENGTH + 1];
  int temp_count = 0;
  int unique_count = 0;
  bool is_word = false;
  bool is_apostrophe = false;
  char character;

  for (int i = 0; i < MAX_WORDS; ++i) {
    words[i].count = 0;
  }

  while ((character = *input_text++)) {
    if (isalpha(character) || isdigit(character)) {
      is_word = true;
      if (is_apostrophe) temp_word[temp_count++] = '\'';
      temp_word[temp_count++] = tolower(character);
      if (temp_count > MAX_WORD_LENGTH) {
        return -1;
      }
      continue;
    } else if (character == '\'' && is_word) {
      is_apostrophe = true;
      continue;
    }

    if (is_word) {
      temp_word[temp_count++] = '\0';
      temp_count = 0;
      unique_count += check_word(temp_word, words, unique_count);
      is_word = false;
    }
    if (unique_count > MAX_WORDS) {
      return -2;
    }
    is_apostrophe = false;
  }

  if (is_word && temp_count > 0) {
    temp_word[temp_count++] = '\0';
    unique_count += check_word(temp_word, words, unique_count);
  }

  return unique_count;
}
