from ecto.note import Note

# Schema:
# [pitch int] [velocity float] [duration int] [x int] [y int] [tick int]

def midi_to_txt(name):
	channels = {}
	with open('scores/%s.dat' % name) as f:
		for line in f:
			if 'On' in line:
				t, _, ch, n, v = line.split(' ')
				ch = int(ch[3:])
				t = int(t)
				n = int(n[2:])
				v = int(v[2:])
				if ch not in channels:
					channels[ch] = []
				channels[ch].append((t, n, v))

	with open('scores/%s.txt' % name, 'w') as f:
		for ch in channels:
			running_notes = {}
			for t, n, v in channels[ch]:
				if v > 0:
					running_notes[n] = t, v
				if v == 0:
					duration = t - running_notes[n][0]
					tick = running_notes[n][0]
					vel = running_notes[n][1] / 127.

					line = '%s %s %s %s 0 %s' % (n, vel, duration, ch, tick)

					f.write('%s\n' % line)



def load_score(name, start_tick=0):
	all_notes = []
	with open('scores/%s.txt' % name) as score_file:
		for line in score_file:
			pitch, velocity, duration, x, y, tick = line.rstrip().split(" ")
			pitch = int(pitch)
			velocity = float(velocity)
			duration = int(duration)
			x = int(x)
			y = int(y)
			tick = int(tick) + start_tick
			all_notes.append(Note(pitch, velocity, duration, x, y, tick))

	all_notes.sort(key=lambda n: n.tick)
	
	return all_notes
