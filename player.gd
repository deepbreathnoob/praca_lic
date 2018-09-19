extends KinematicBody2D

const UP = Vector2(0,-1);
const GRVTY = 20

const MAX_SPD = 205
const ACC = 50
const JUMP_H = -555
var motion = Vector2()



func _physics_process(delta):
	motion.y += GRVTY
	
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACC,MAX_SPD)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACC, -MAX_SPD)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction = true
		motion.x = lerp(motion.x, 0, 0.3)
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_H
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.3)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
			print(motion.y)
			if motion.y > 2000:
				get_tree().change_scene("StartMenu.tscn")
			
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)

	motion = move_and_slide(motion, UP)
	
	pass