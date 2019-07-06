#include "isogram.h"
#include <ctype.h>
#include <string.h>

#define OFFSET_CHARACTERS_TO_ZERO 97

bool is_isogram(const char phrase[]) {
  if (phrase == NULL) {
    return false;
  }

  int matches = 0;
  char character;

  while ((character = *phrase++)) {
    if (!isalpha(character)) continue;
    character = tolower(character);

    int flag_position = 1 << (character - OFFSET_CHARACTERS_TO_ZERO);
    if (matches & flag_position) {
      return false;
    }
    matches |= flag_position;
  }

  return true;
}
