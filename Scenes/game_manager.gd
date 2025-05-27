extends Node

var score = 0
var maxScore = 15
@onready var score_label: Label = $ScoreLabel


func add_point():
	score += 1  
	score_label.text = " Your Score: " + str(score)  

	if score == maxScore:
		score_label.text = "You have collected all,great joob!"
