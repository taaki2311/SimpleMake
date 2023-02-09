#include "testProject.h"

#include <libTest.h>
#include <lib2.h>

int main(void)
{
    hello_from_project();
    super_print("Hello from lib 1");
    hello_from_lib2();
    return 0;
}