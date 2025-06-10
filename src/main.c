#include <stdio.h>
#include "../include/config.h"

int main() {
    printf("Application Information:\n");
    printf("Name: %s\n", APP_NAME);
    printf("Version: %s\n", APP_VERSION);
    printf("Author: %s\n", APP_AUTHOR);
    printf("Email: %s\n", APP_EMAIL);
    printf("Website: %s\n", APP_WEBSITE);
    
    printf("\n\n");

    return 0;
}