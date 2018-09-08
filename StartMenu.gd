#Start menu
extends Control


func _on_Start_pressed():
	print("Idź do peirwszej sceny")
	get_tree().change_scene("res://scene1.tscn")


func _on_Wyjcie_pressed():
	get_tree().quit()
