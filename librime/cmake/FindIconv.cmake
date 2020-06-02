# Find iconv library
#
# Author: Eddy Xu <eddyxu at gmail.com>
#
# Released under BSD license
#
#  ICONV_INCLUDE_DIRS   - where to find iconv.h, etc
#  ICONV_LIBRARIES      - Lists of libraries when using iconv
#  ICONV_FOUND          - True if iconv found


# Look for the header file
FIND_PATH( ICONV_INCLUDE_DIR NAMES iconv.h )
MARK_AS_ADVANCED( ICONV_INCLUDE_DIR )

# Look for the library
FIND_LIBRARY( ICONV_LIBRARY NAMES iconv )
MARK_AS_ADVANCED( ICONV_LIBRARY )

# Copy the result to output variables
IF(ICONV_INCLUDE_DIR AND ICONV_LIBRARY)
  SET(ICONV_FOUND 1)
  SET(ICONV_LIBRARIES ${ICONV_LIBRARY})
  SET(ICONV_INCLUDE_DIRS ${ICONV_INCLUDE_DIR})
ELSE(ICONV_INCLUDE_DIR AND ICONV_LIBRARY)
  SET(ICONV_FOUND 0)
  SET(ICONV_LIBRARIES)
  SET(ICONV_INCLUDE_DIRS)
ENDIF(ICONV_INCLUDE_DIR AND ICONV_LIBRARY)

# Report results
IF(NOT ICONV_FOUND)
  SET(ICONV_DIR_MESSAGE
    "Iconv was not found. Make sure ICONV_LIBRARY and ICONV_INCLUDE_DIR are
set.")
    IF(NOT ICONV_FIND_QUIETLY)
      MESSAGE(STATUS ${ICONV_DIR_MESSAGE})
    ELSE(NOT ICONV_FIND_QUIETLY)
      IF(ICONV_FIND_REQUIRED)
        MESSAGE(FETAL_ERROR ${ICONV_DIR_MESSAGE})
      ENDIF(ICONV_FIND_REQUIRED)
    ENDIF(NOT ICONV_FIND_QUIETLY)
ENDIF(NOT ICONV_FOUND)
