extends Node

@export var levelScenes: Array[PackedScene]

var currentLevelIndex = 0


func change_level(levelIndex):
	currentLevelIndex = levelIndex
	if currentLevelIndex >= levelScenes.size():
		ScreenTransitionManager.transition_to_end()
	else:
		ScreenTransitionManager.transition_to_scene(levelScenes[currentLevelIndex])

func increment_level():
	change_level(currentLevelIndex + 1)

func _process(delta):
	if Input.is_action_just_pressed("skip_level"):
		increment_level()
