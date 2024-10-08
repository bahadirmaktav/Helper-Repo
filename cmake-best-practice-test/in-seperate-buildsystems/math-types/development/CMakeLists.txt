## BUILD CONFIGURATIONS ##
set(MATH_TYPES math_types)

file(GLOB_RECURSE sources
    ${CMAKE_SOURCE_DIR}/development/src/*.c
    ${CMAKE_SOURCE_DIR}/development/src/*.cxx
    ${CMAKE_SOURCE_DIR}/development/src/*.cpp
)
file(GLOB_RECURSE public_headers
    ${CMAKE_SOURCE_DIR}/development/include/*.h
    ${CMAKE_SOURCE_DIR}/development/include/*.hxx
    ${CMAKE_SOURCE_DIR}/development/include/*.hpp
)

add_library(${MATH_TYPES} STATIC ${sources})

target_include_directories(${MATH_TYPES}
    PRIVATE
        ${CMAKE_SOURCE_DIR}/development/src
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/development/include>
)

## INTSTALL CONFIGURATIONS ##
install(TARGETS ${MATH_TYPES}
    EXPORT ${MATH_TYPES}Targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(FILES ${public_headers} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(EXPORT ${MATH_TYPES}Targets
    FILE ${MATH_TYPES}Targets.cmake
    NAMESPACE ${CMAKE_PROJECT_NAME}::
    DESTINATION cmake
)

write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/${MATH_TYPES}ConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion
)

configure_package_config_file(${CMAKE_SOURCE_DIR}/cmake/Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/${MATH_TYPES}Config.cmake
    INSTALL_DESTINATION cmake
)

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/${MATH_TYPES}Config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/${MATH_TYPES}ConfigVersion.cmake
    DESTINATION cmake
)
