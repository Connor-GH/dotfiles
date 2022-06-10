#include <curses.h>         // the bulk of the work
#include <unistd.h>         // sleep, usleep, etc
#include <sys/ioctl.h>      // getting terminal size
int main() {
    struct winsize w;
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);

/*
    the excessive refreshing and delays are to simulate
    the effect of an older computer's boot screen
*/
 
    (void) initscr();
    erase();
    for (int i=0;i<w.ws_col;i++) {
        addstr("#");
        usleep(3000);
        refresh();
    }
    refresh();
    for (int j=0;j<w.ws_row-1;j++) {
        move(j+1,0);
        addstr("#");
        usleep(3000);
        refresh();
        move(j+1,w.ws_col-1);
        addstr("#");
        usleep(3000);
        refresh();
    }

move(1, (w.ws_col / 2)-19);
addstr("      ////                        //");
usleep(12000);
refresh();
move(2, (w.ws_col / 2)-19);
addstr("   //    //  //  ////    //////  //////");
usleep(12000);
refresh();
move(3, (w.ws_col / 2)-19);
addstr("  ////////  ////      //        //    //");
usleep(12000);
refresh();
move(4, (w.ws_col / 2)-19);
addstr(" //    //  //        //        //    //");
usleep(12000);
refresh();
move(5, (w.ws_col / 2)-19);
addstr("//    //  //          //////  //    //");
usleep(12000);
refresh();

move(9, (w.ws_col / 2)-19);
addstr("    //        //");
usleep(12000);
refresh();
move(10, (w.ws_col / 2)-19);
addstr("   //            //////    //    //  //    //");
usleep(12000);
refresh();
move(11, (w.ws_col / 2)-19);
addstr("  //        //  //    //  //    //    ////");
usleep(12000);
refresh();
move(12, (w.ws_col / 2)-19);
addstr(" //        //  //    //  //    //  //    //");
usleep(12000);
refresh();
move(13, (w.ws_col / 2)-19);     
addstr("////////  //  //    //    //////  //    //");
usleep(12000);
refresh();

    sleep(1);
    endwin();

    return 0;
}

