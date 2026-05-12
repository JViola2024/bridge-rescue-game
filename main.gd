extends Node2D

@onready var question_label = $UI/QuestionPanel/QuestionLabel
@onready var answer1 = $UI/QuestionPanel/Answer1
@onready var answer2 = $UI/QuestionPanel/Answer2
@onready var answer3 = $UI/QuestionPanel/Answer3
@onready var answer4 = $UI/QuestionPanel/Answer4
@onready var heart_label = $UI/HeartLabel
@onready var win_label = $UI/WinLabel
@onready var lose_label = $UI/LoseLabel

var mozog_a_lovag = false
var nyert = false

func _ready() -> void:
	GameManager.uj_jatek()
	heart_label.hide()
	win_label.hide()
	lose_label.hide()
	betolt_kerdes()

func _process(delta):
	if mozog_a_lovag:
		$Hero.position.x += 100 * delta

		if $Hero.position.x >= 1050:
			$Hero.position.x = 1050
			mozog_a_lovag = false

			if not nyert:
				nyert = true
				heart_label.show()
				win_label.show()

func betolt_kerdes():
	var lista = GameManager.kerdesek[GameManager.tema]
	var kerdes = lista[GameManager.aktualis_kerdes_index]

	question_label.text = kerdes["kerdes"]
	answer1.text = kerdes["valaszok"][0]
	answer2.text = kerdes["valaszok"][1]
	answer3.text = kerdes["valaszok"][2]
	answer4.text = kerdes["valaszok"][3]

func ellenoriz_valasz(valasztott_index):
	var lista = GameManager.kerdesek[GameManager.tema]

	if GameManager.aktualis_kerdes_index >= lista.size():
		return

	var kerdes = lista[GameManager.aktualis_kerdes_index]

	if valasztott_index == kerdes["helyes"]:
		$Bridge.add_bridge_piece()
	else:
		$Bridge.remove_bridge_piece()

	# ha kész a híd, azonnali győzelem
	if $Bridge.current_bridge_piece > 12:
		mozog_a_lovag = true
		$UI/QuestionPanel.hide()
		return

	GameManager.aktualis_kerdes_index += 1

	# ha elfogytak a kérdések és nincs kész a híd
	if GameManager.aktualis_kerdes_index >= lista.size():
		$UI/QuestionPanel.hide()
		lose_label.show()
		return

	betolt_kerdes()

func _on_answer_1_pressed() -> void:
	ellenoriz_valasz(0)

func _on_answer_2_pressed() -> void:
	ellenoriz_valasz(1)

func _on_answer_3_pressed() -> void:
	ellenoriz_valasz(2)

func _on_answer_4_pressed() -> void:
	ellenoriz_valasz(3)
