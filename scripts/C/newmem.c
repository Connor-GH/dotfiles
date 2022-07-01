#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *fp = fopen("/proc/meminfo", "r");
    if(fp == NULL) {
        printf("Unable to return meminfo\n");
        return -1;
    }
    char line1_value[100];
    char line2_value[100];
    char line3_value[100];
    char line4_value[100];
    char line5_value[100];
    char line21_value[100];
    char line24_value[100];
    char line1[200];
    char line2[200];
    char line3[200];
    char line4[200];
    char line5[200];
    char line21[200];
    char line24[200];
// TODO: replace fgets-scanf with fscanf

    fgets(line1, sizeof(line1), fp);
    sscanf(line1, "%*99s %99s", line1_value);

    fgets(line2, sizeof(line2), fp);
    sscanf(line2, "%*99s %99s", line2_value);

    fgets(line3, sizeof(line3), fp);
    sscanf(line3, "%*99s %99s", line3_value);

    fgets(line4, sizeof(line4), fp);
    sscanf(line4, "%*99s %99s", line4_value);

    fgets(line5, sizeof(line5), fp);
    sscanf(line5, "%*99s %99s", line5_value);

    int c;
    for (int i = 0; i < 15; i++) {
        while ((c = fgetc(fp)) != '\n' && c != EOF);
    }
    fgets(line21, sizeof(line21), fp);
    sscanf(line21, "%*99s %99s", line21_value);

// TODO: get rid of this mess used to skip lines

    while ((c = fgetc(fp)) != '\n' && c != EOF);
    while ((c = fgetc(fp)) != '\n' && c != EOF);

    fgets(line24, sizeof(line24), fp);
    sscanf(line24, "%*99s %99s", line24_value);

    fclose(fp);
    int x;
    sscanf(line1_value, "%d", &x); //convert char to int

    int TOTAL_RAM = (x/1000/1000);
/* TODO: better and more
 * descriptive variable names */
    int y;
    sscanf(line2_value, "%d", &y); //memfree
    int z;
    sscanf(line3_value, "%d", &z); //available
    int z1;
    sscanf(line4_value, "%d", &z1); //buffers
    int z2;
    sscanf(line5_value, "%d", &z2); //cache
    int z3;
    sscanf(line21_value, "%d", &z3); //shmem
    int z4;
    sscanf(line24_value, "%d", &z4); //reclaimable

    float USED_RAM = (x + z3 - y - z1 - z2 - z4)/1024./1024.;

    int MorG;                  // use MiB or GiB
    if (USED_RAM < 1) {
        MorG = 'M';
        USED_RAM = (USED_RAM * 1000);
    }
    else {
        MorG = 'G';
    }
    // This prints decimals for MB, which is not necessary, but fine.
        printf("%.1f%c/%dG\n", \
                USED_RAM, MorG, TOTAL_RAM);

    return 0;
}
