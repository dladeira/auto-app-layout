#ifndef CONFIG_H
#define CONFIG_H

#define APP_NAME "auto-app-layout"
/* Version is now defined by the build system */
#define APP_AUTHOR "Daniel Ladeira"
#define APP_EMAIL "dladeiratx@gmail.com"
#define APP_WEBSITE "https://github.com/dladeira/auto-app-layout"
#define APP_LICENSE "MIT"
#define APP_LICENSE_URL "https://opensource.org/licenses/MIT"
#define APP_LICENSE_TEXT "MIT License"
#define APP_LICENSE_TEXT_URL "https://opensource.org/licenses/MIT"

/* Version information macros (defined by build system) */
#ifndef APP_VERSION
#define APP_VERSION "unknown"
#endif

#ifndef GIT_COMMIT
#define GIT_COMMIT "unknown"
#endif

#ifndef GIT_TAG
#define GIT_TAG "unknown"
#endif

#ifndef BUILD_DATE
#define BUILD_DATE "unknown"
#endif

#endif