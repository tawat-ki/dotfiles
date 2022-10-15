#include <stdio.h>
#include <stdlib.h>
int main( int argc, char *argv[] )
{

    FILE *fp;
    char path[1035];

    /* Open the command for reading. */
    fp = popen("/bin/xset q", "r");
    if (fp == NULL) {
        printf("Failed to run command\n" );
        exit(1);
    }
    int i=0;
    /* Read the output a line at a time - output it. */
    while (fgets(path, sizeof(path), fp) != NULL) {
		if (i==3) {if(path[22]=='n') printf("⇪\n");else printf(" \n");}
		i++;
    }
    /* close */
    pclose(fp);
    return 0;
}
