extends Sprite2D

var comfort_level: int = 50  # 0-100 scale
var current_mood: String = "neutral"

func _ready():
	update_appearance()

func update_comfort(delta: int):
	comfort_level = clamp(comfort_level + delta, 0, 100)
	update_appearance()

func update_appearance():
	# Update the character's appearance based on comfort_level
	if comfort_level < 30:
		current_mood = "uncomfortable"
		# TODO: Change texture to uncomfortable sprite
	elif comfort_level > 70:
		current_mood = "happy"
		# TODO: Change texture to happy sprite
	else:
		current_mood = "neutral"
		# TODO: Change texture to neutral sprite
	
	# For now, let's just print the mood
	print("Character mood: ", current_mood)

func react_to_choice(item_name: String):
	# This function will be called when a choice is made
	# For now, let's just print a reaction
	print("Character reacts to: ", item_name)
	# TODO: Implement actual reactions and comfort changes
