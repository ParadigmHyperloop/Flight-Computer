set(EXNAME core)

set(HEADERS

)

set(SOURCES
    main.cpp
)

add_executable(${EXNAME} ${HEADERS} ${SOURCES})

addLibs(${EXNAME})
addError(${EXNAME})
includeBoost(${EXNAME})
