/// @description Size Vars and Mode Setup

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h / 2;

enum TRANS_MODE  //enum for constant and TRANS_MODE so the correlated number doesnt need to be remembered
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;