extends Node2D

var timer = 0
var fails = 0
var record = 0

func _ready():
	update_record()
	update_time()

func _process(delta):
	if !$Ball.started:
		return
	timer += delta
	update_record()
	update_time()
	
func new_fail():
	timer = 0
	fails += 1
	$Fails.text = "Fails: " + str(fails)
	update_time()
	
func update_record():
	if timer > record:
		record = timer
		$Record.text = "Record: " + str("%.2f" % timer) + " sec."

func update_time():
	$Time.text = str("%.2f" % timer) + " sec."
