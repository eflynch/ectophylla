from ecto.note import Note

# Schema:
# [pitch int] [velocity float] [duration int] [x int] [y int] [tick int]

def load_score(name, start_tick=0):
	all_notes = []
	with open('scores/%s.txt' % name) as score_file:
		for line in score_file:
			pitch, velocity, duration, x, y, tp = line.rstrip().split(" ")
			pitch = int(pitch)
			velocity = float(velocity)
			duration = int(duration)
			x = int(x)
			y = int(y)
			tp = int(tp) + start_tick
			all_notes.append(Note(pitch, velocity, duration, x, y, tp))
	
	return all_notes
