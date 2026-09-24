// Basic Identity
interact_radius = 10; // How close the player needs to be (in pixels)

// Dialogue Setup
dialogue = [
	"undefined text"
];
dialogue_index = 0; // Tracks which line of text they are on

sprite = sprite_index;


// Add this to your Create Event
my_prompt = noone; // 'noone' means no instance is currently tracked

show_text = false;

post_talk_event = false;
pt_which = 0;
pt_argument_one = 0;
pt_argument_two	= 0;
pt_argument_three = 0;