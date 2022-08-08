#include <curses.h>


int main() {

    /*
     * COLS is a macro for columns
     * LINES is a macro for rows (lines)
     *
     * both are defined in curses.h
     * alternatively, you can use ioctl
     */

    (void) initscr();
    keypad(stdscr, TRUE);
    (void) cbreak();

    for (int i=0;i<COLS;i++) addstr("#");

    for (int i=0;i<LINES-2;i++) {
        move(i+1,0);
        addstr("#");

        move(i+1,COLS-1);
        addstr("#");
    }
        move(LINES-1, 0);

    for (int i=0;i<COLS;i++) addstr("#");

    /* spells 'Linux' */
    move(9, (COLS / 2)-19);
	addstr("    //        //");
	move(10, (COLS / 2)-19);
	addstr("   //            //////    //    //  //    //");
	move(11, (COLS / 2)-19);
	addstr("  //        //  //    //  //    //    ////");
	move(12, (COLS / 2)-19);
	addstr(" //        //  //    //  //    //  //    //");
	move(13, (COLS / 2)-19);
	addstr("////////  //  //    //    //////  //    //");

    /* color stuff */
    if (has_colors()) {

        start_color();
        init_pair(1, COLOR_BLUE, COLOR_BLACK);
	    attron(COLOR_PAIR(1));
	    attron(A_BOLD);
    }

    /* more printing */
	move(14, (COLS / 2)-19);     
	addstr("   Copyright (c) Linus Torvalds 1991 - 2022");
	move(17, (COLS / 2)-19);     
	addstr("   Press Enter to enter your X11 Server...");

    if (has_colors()) {

	attroff(A_BOLD);
	attroff(COLOR_PAIR(1));
    }
	refresh();

    /* get a Return character from the user */
	noecho();
	while (getch() != '\n') getch();
    echo();

    endwin();

    return 0;
}

