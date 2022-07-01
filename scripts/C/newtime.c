#include <stdio.h>
#include <time.h>
int main () {
   time_t rawtime;
   struct tm *info;
   char buffer[80];

    time( &rawtime );
    info = localtime( &rawtime );
    strftime(buffer,80,"%a, %b %d %I:%M %p", info);
    printf("%s\n", buffer );

return(0);
}
