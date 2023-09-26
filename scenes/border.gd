extends StaticBody2D

func _draw():
	draw_rect($ReferenceRect.get_rect(),
		Color(0,1,0), false, 20)


func _on_area_2d_body_entered(body):
	if body.is_in_group("ball"):
		get_parent().new_fail()
		body.init_ball()
