#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int main() {
	FILE *cpu = fopen("/proc/stat", "r");
	char i2v[100];
	char i4v[100];
	char i5v[100];
	char line1[200];
	fgets(line1, sizeof(line1), cpu);
	sscanf(line1, "%*100s %100s %*100s %100s %100s %*100s %*100s %*100s \
	%*100s %*100s %*100s", i2v, i4v, i5v);
	fclose(cpu);
	sleep(1); //going into the second part, grabbing second values


	FILE *cpu2 = fopen("/proc/stat", "r");
	char i13v[100];
	char i15v[100];
	char i16v[100];
	char line1pt2[200];
	fgets(line1pt2, sizeof(line1pt2), cpu2);
	sscanf(line1pt2, "%*100s %100s %*100s %100s %100s %*100s %*100s \
	%*100s %*100s %*100s %*100s", i13v, i15v, i16v);
	fclose(cpu2);	


	int64_t x;
	sscanf(i2v, "%lld", &x);
	int64_t y;
	sscanf(i4v, "%lld", &y);
	int64_t z;
	sscanf(i5v, "%lld", &z);
	int64_t z1;
	sscanf(i13v, "%lld", &z1);
	int64_t z2;
	sscanf(i15v, "%lld", &z2);
	int64_t z3;
	sscanf(i16v, "%lld", &z3);


	FILE *cpu3 = fopen("/sys/class/hwmon/hwmon1/temp3_input", "r");
	char line1_value[100];
	char line1temp[100];
	fgets(line1temp, sizeof(line1temp), cpu3);
	sscanf(line1temp, "%100s", line1_value);
	fclose(cpu3);
	int x2;
	sscanf(line1_value, "%d", &x2);
	float TEMP = (x2/1000.);

	printf("%.2f% @ %.1f°C\n", (z1-x+z2-y)*100./(z1-x+z2-y+z3-z), TEMP);
}
