CC=gcc
CFLAGS=-O2 -pipe -Wall -Wpedantic
STATUSDIR="."
LIBS=`pkg-config --libs ncurses`
statusbar:
	$(CC) $(CFLAGS) -o $(STATUSDIR)/newcpu $(STATUSDIR)/newcpu.c
	$(CC) $(CFLAGS) -o $(STATUSDIR)/newmem $(STATUSDIR)/newmem.c
	$(CC) $(CFLAGS) -o $(STATUSDIR)/newdisk $(STATUSDIR)/newdisk.c
	$(CC) $(CFLAGS) -o $(STATUSDIR)/newtime $(STATUSDIR)/newtime.c
startup-script:
	$(CC) $(CFLAGS) -o $(STATUSDIR)/startup $(STATUSDIR)/startup.c $(LIBS)
