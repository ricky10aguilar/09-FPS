extends Spatial
var score = 0 

onready var Score = get_node("/root/Game/HUD/Score")


func update_score(s):
	score += s 
	Score.text = "Score: " + str(score)
