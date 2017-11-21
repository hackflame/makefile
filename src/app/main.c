#include <stdio.h>
#include "player.h"
#include "usb.h"
#include "jpg.h"
#include "maths.h"
#include "sp.h"
#include "test.h"
int main(int argc,char * agrv[])
{
	printf("main init ....\n");
	usb_init();
	player_init();
	jpg_init();
	sp_init();
	maths_init();
	test();
	return 0;
}
