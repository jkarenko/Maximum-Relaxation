extends CanvasLayer

@onready var situation_label = $SituationLabel
@onready var score_label = $ScoreLabel
@onready var countdown_label = $CountdownLabel

func _ready():
	situation_label.text = "Ready to start!"
	score_label.text = "Score: 0"
	countdown_label.text = "3"

func update_situation(new_situation: String):
	situation_label.text = new_situation

func update_score(new_score: int):
	score_label.text = "Score: " + str(new_score)

func update_countdown(time: int):
	countdown_label.text = str(time)
