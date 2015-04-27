from note import Note

def parse(path):
	all_notes = []
	score_file = open(path)
	for line in score_file:
		pitch, velocity, duration, x, y, tp, speed = line.rstrip().split(" ")
		pitch = float(pitch)
		velocity = float(velocity)
		duration = int(duration)
		x = float(x)
		y = float(y)
		tp = float(tp)
		speed = float(speed)
		all_notes.append(Note(pitch, velocity, duration, x, y, tp, speed))
	return all_notes
