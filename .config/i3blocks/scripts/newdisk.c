#include <stdio.h>
#include <sys/statvfs.h>
#include <stdint.h> 
int main() { 
	char *filename = "/";
 
	struct statvfs buf;
	if (!statvfs(filename, &buf)) {

	    unsigned long blksize, blocks, freeblks, disk_size, used, free;
	    blksize = buf.f_bsize;
	    blocks = buf.f_blocks;
	    freeblks = buf.f_bfree;
	    int64_t unit;
	    disk_size = blocks * blksize;
	    free = freeblks * blksize;
	    used = disk_size - free;
	    
	    if ((used > 1024L*1024*1024) && (used < 1024L*1024*1024*1024)) {
		unit = 'G'; }
	    else if ((used > 1024L*1024) && (used < 1024L*1024*1024)) {
		unit = 'M'; }
	    else {
		unit = 'T'; }
	   	printf("💾: %lu%c/%lu%c\n", (used/1024/1024/1024), unit, ((used/1024/1024/1024)+free/1024/1024/1024), unit);
		} 
	    	else {
	   	 printf("Couldn't get file system statistics\n");
		}
}
