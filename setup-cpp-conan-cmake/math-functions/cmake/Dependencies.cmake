## DEPENDENCIES CONFIGURATIONS ##
set(MATH_TYPES_PACKAGE_NAME math_types)
set(MATH_TYPES_PACKAGE_VERSION 0.1.0)
set(MATH_TYPES_PACKAGE_CONFIG_DIR ${INSTALL_ROOT_DIR}/${MATH_TYPES_PACKAGE_NAME}/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_VERSION}/${CMAKE_BUILD_TYPE}/cmake)

list(APPEND CMAKE_PREFIX_PATH ${MATH_TYPES_PACKAGE_CONFIG_DIR})

# find_package(${MATH_TYPES_PACKAGE_NAME} ${MATH_TYPES_PACKAGE_VERSION} REQUIRED CONFIG)
find_package(math_types REQUIRED)