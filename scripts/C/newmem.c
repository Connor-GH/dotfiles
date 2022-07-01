#include <stdio.h>
#include <stdlib.h>
int main() {
	FILE *fp = fopen("/proc/meminfo", "r");
	if(fp == NULL) {
		return -1;
	printf("Unable to return meminfo");
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
	char line21[100];
	char line24[200];
// read line 1
	fgets(line1, sizeof(line1), fp);
// read name and value
	sscanf(line1, "%*100s %100s", line1_value);
//read line 2
	fgets(line2, sizeof(line2), fp);
	sscanf(line2, "%*100s %100s", line2_value);
// read line 3
	fgets(line3, sizeof(line3), fp);
// read name and value
	sscanf(line3, "%*100s %100s", line3_value);
	fgets(line4, sizeof(line4), fp);
	sscanf(line4, "%*100s %100s", line4_value);
	fgets(line5, sizeof(line5), fp);
	sscanf(line5, "%*100s %100s", line5_value);
	int c;
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF); 
	fgets(line21, sizeof(line21), fp);
	sscanf(line21, "%*100s %100s", line21_value);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	while ((c = fgetc(fp)) != '\n' && c != EOF);
	fgets(line24, sizeof(line24), fp);
	sscanf(line24, "%*100s %100s", line24_value);
	fclose(fp);
	int64_t x;
	sscanf(line1_value, "%lld", &x); //convert char to int //total
	int TOTAL_RAM = (x/1000/1000);
	int64_t y;
	sscanf(line2_value, "%lld", &y); //memfree
	int64_t z;
	sscanf(line3_value, "%lld", &z); //available
	int64_t z1;
	sscanf(line4_value, "%lld", &z1); //buffers
	int64_t z2;
	sscanf(line5_value, "%lld", &z2); //cache
	int64_t z3;
	sscanf(line21_value, "%lld", &z3); //shmem
	int64_t z4;
	sscanf(line24_value, "%lld", &z4); //reclaimable
	float USED_RAM = (x + z3 - y - z1 - z2 - z4)/1024./1024.;

		int MorG;
	if ("%.2f", USED_RAM < 1) {
		MorG = 'M';
		USED_RAM = (USED_RAM * 1000); 
		printf("%.0f%c/%dG\n", USED_RAM, MorG, TOTAL_RAM);
	}
	else {
		MorG = 'G';
	printf("%.1f%c/%dG\n", USED_RAM, MorG, TOTAL_RAM);
	}
}
