from ecto.note import Note
import numpy as np

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
			if 'Off' in line:
				t, _, ch, n, _ = line.split(' ')
				ch = int(ch[3:])
				t = int(t)
				n = int(n[2:])
				v = 0
				if ch not in channels:
					channels[ch] = []
				channels[ch].append((t, n, v))

	with open('scores/%s.txt' % name, 'w') as f:
		for ch in channels:
			running_notes = {}
			i = sorted(channels.keys()).index(ch)
			x = (i % 5) - 5
			y = (i - (i % 5))/10 - 5
			for t, n, v in channels[ch]:
				if v > 0:
					running_notes[n] = t, v
				if v == 0:
					duration = t - running_notes[n][0]
					tick = running_notes[n][0]
					vel = running_notes[n][1] / 127.

	

					line = '%s %s %s %s %s %s' % (n, vel, duration, x, y, tick)

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

	all_notes.sort(key=lambda n: (n.tick, n.x, n.y))

	curr_tup = (all_notes[0].tick, all_notes[0].x, all_notes[0].y)
	print curr_tup
	print [(n.tick, n.x, n.y) for n in all_notes]
	curr_notes = []
	for note in all_notes:
		# print (note.tick, note.x, note.y)
		if (note.tick, note.x, note.y) == curr_tup:
			curr_notes.append(note)
		elif len(curr_notes) == 1:
			curr_notes = []
		elif len(curr_notes) > 1:
			num_notes = len(curr_notes)
			angle = 2. * np.pi / num_notes
			for i, n in enumerate(curr_notes):
				# print "POOOOOP"
				theta = angle*i
				# print np.cos(theta)
				# print np.sin(theta)
				n.x += .2 * np.cos(theta) 
				n.y += .2 * np.sin(theta) 
			curr_notes = []
		curr_tup = (note.tick, note.x, note.y)
	
	return all_notes
