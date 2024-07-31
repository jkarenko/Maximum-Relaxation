extends Node2D

var comfort_level: int = 50  # 0-100 scale
var current_mood: String = "neutral"

@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	if not sprite:
		push_error("Sprite2D child node not found in Character scene")
	update_appearance()

func react_to_choice(item_name: String):
	print("Character reacts to: ", item_name)
	# TODO: Implement actual reactions based on the item

func update_comfort(delta: int):
	comfort_level = clamp(comfort_level + delta, 0, 100)
	print("Comfort level is now: ", comfort_level)
	update_appearance()

func update_appearance():
	if not sprite:
		return
	
	if comfort_level < 30:
		current_mood = "uncomfortable"
		# TODO: Change texture to uncomfortable sprite
	elif comfort_level > 70:
		current_mood = "happy"
		# TODO: Change texture to happy sprite
	else:
		current_mood = "neutral"
		# TODO: Change texture to neutral sprite
	
	print("Character mood: ", current_mood)
	# sprite.texture = load("path/to/mood_texture.png")
