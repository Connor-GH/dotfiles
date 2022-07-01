CC=gcc
CFLAGS=-O2 -pipe -Wall -Wpedantic
STATUSDIR="$(HOME)/.config/i3blocks/scripts"
STARTUPLIBS="-lncurses"
statusbar:
	$(CC) $(CFLAGS) -o $(STATUSDIR)/newcpu $(STATUSDIR)/newcpu.c
	$(CC) $(CFLAGS) -o $(STATUSDIR)/newmem $(STATUSDIR)/newmem.c
	$(CC) $(CFLAGS) -o $(STATUSDIR)/newdisk $(STATUSDIR)/newdisk.c
	$(CC) $(CFLAGS) -o $(STATUSDIR)/newtime $(STATUSDIR)/newtime.c
startup-script:
	$(CC) $(CFLAGS) $(STARTUPLIBS) \
		-o $(STATUSDIR)/startup $(STATUSDIR)/startup.c
