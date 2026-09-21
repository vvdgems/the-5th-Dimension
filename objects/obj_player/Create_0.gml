hsp = 0;
vsp = 0;

walk_multiplier = 1; // ooh look at me and my fancy "walk multiplier" instead of "walk speed" aren't i just soooo PROFESSIONAL?!??!

canmove = true;

is_invincible = false;
invincibility_duration = 60; // 1 second at 60 FPS

// Start in WASD mode (true = WASD layout, false = Arrow layout)
is_wasd_mode = false;

// Initialize Facing Direction & States
facing = "down"; 

enum PLAYERSTATE {
    FREE,
	WEAPON
}

state = PLAYERSTATE.FREE;
attack_timer = 0;
equipped_sword_id = "null";

sword = 0;
armor = 0;

combo_count = 0;
combo_timer = 0;

text_s = false;
text_t_s = "not enough magic points!!!";
text_time = 20;

hp = 100;
maxhp = 100;

base_atk = 1;
atk = 0;
base_def = 2;
def = 0;
base_spd = 2;
spd = base_spd;

bux = 0;

lvl = 1;
xp = 0;

timer = 0;