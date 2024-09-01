extends CanvasLayer


func _ready():
	hide_win_screen()


func show_win_screen() -> void:
	$WinScreen.visible = true
	
	
func hide_win_screen() -> void:
	$WinScreen.visible = false
