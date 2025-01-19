class_name Dialogue
extends Control

@onready var content := get_node("Content") as RichTextLabel
@onready var type_timer := get_node("TypeTyper") as Timer
@onready var pause_timer := get_node("PauseTimer") as Timer
@onready var voice_player := get_node("DialogueVoicePlayer") as AudioStreamPlayer

var _playing_voice := false

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	update_message("Hi, I was generated for the dialogue system test for the Godot game engine")

func update_message(message: String) -> void:
	content.bbcode_text = message
	content.visible_characters = 0
	type_timer.start()
	
	_playing_voice = true
	voice_player.play(0)

func _on_type_typer_timeout() -> void:
	if content.visible_characters < content.text.length():
		voice_player.play(0)
		content.visible_characters += 1
	else:
		_playing_voice = false
		type_timer.stop()

func _on_dialogue_voice_player_finished() -> void:
	if _playing_voice:
		voice_player.play(0)
