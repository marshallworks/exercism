#include "acronym.h"
#include <ctype.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#define MAX_INTERIM_COUNT 12

char *abbreviate(const char *phrase) {
  if (phrase == NULL || *phrase == '\0') {
    return NULL;
  }

  char *result = malloc(strlen(phrase));
  char character;
  int count = 0;
  bool is_word = false;

  while ((character = *phrase++)) {
    if (!is_word && isalpha(character)) {
      result[count++] = toupper(character);
      is_word = true;
    } else if (is_word && character != '\'' && !isalpha(character)) {
      is_word = false;
    }
  }

  result[count] = '\0';

  return result;
}
