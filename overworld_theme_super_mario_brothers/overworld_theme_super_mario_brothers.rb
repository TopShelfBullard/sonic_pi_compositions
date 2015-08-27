QUARTER = 0.61
SIXTEENTH = QUARTER / 4
EIGHTH = QUARTER / 2
HALF = QUARTER * 2
WHOLE = QUARTER * 4

def play_thread(note_thread)
  in_thread do
    use_synth :pulse
    note_thread.each do |note_attributes|
      if note_attributes.length == 1
        sleep note_attributes[0]
        next
      end

      if note_attributes.length > 4
        triplet([note_attributes[0], note_attributes[1], note_attributes[2]], note_attributes[3], note_attributes[4])
        next
      end

      sustain = note_attributes.length == 2 ? SIXTEENTH : note_attributes[2]
      play_note_for_duration(note_attributes[0], note_attributes[1], sustain)
    end
  end
end

def play_note_for_duration(pitch, duration, sustain = SIXTEENTH)
  play pitch, release: sustain, env_curve: 4
  sleep duration
end

def syncopate(duration)
  duration + (duration / 2)
end

def triplet(notes, total_duartion, sustain)
  notes.map{|note| play_note_for_duration(note, total_duartion / 3, sustain)}
end

def intro
  play_thread([[:E5, SIXTEENTH], [:E5, EIGHTH], [:E5, EIGHTH], [:C5, SIXTEENTH], [:E5, EIGHTH], [:G5, HALF]])
  play_thread([[:Fs4, SIXTEENTH], [:Fs4, EIGHTH], [:Fs4, EIGHTH], [:Fs4, SIXTEENTH], [:Fs4, EIGHTH], [:G4, HALF]])
  play_thread([[:D3, SIXTEENTH], [:D3, EIGHTH], [:D3, EIGHTH], [:D3, SIXTEENTH], [:D3, EIGHTH], [QUARTER], [:G3, QUARTER]])
  sleep WHOLE
end

def section_one
  play_thread([
    [:C5, syncopate(EIGHTH)], [:G4, syncopate(EIGHTH)], [:E4, QUARTER], [:A4, SIXTEENTH], [:B4, EIGHTH], [:Bb4, SIXTEENTH], [:A4, EIGHTH, EIGHTH],
    [:G4, :C5, :E5, QUARTER, SIXTEENTH], [:A5, EIGHTH], [:F5, SIXTEENTH], [:G5, EIGHTH], [:E5, EIGHTH], [:C5, SIXTEENTH], [:D5, SIXTEENTH], [:B4, QUARTER]
  ])

  play_thread([
    [:E4, syncopate(EIGHTH)], [:C4, syncopate(EIGHTH)], [:G3, QUARTER], [:C4, SIXTEENTH], [:D4, EIGHTH], [:Db4, SIXTEENTH], [:C4, EIGHTH, EIGHTH],
    [:C4, :G4, :B4, QUARTER, SIXTEENTH], [:C5, EIGHTH], [:A4, SIXTEENTH], [:B4, EIGHTH], [:G4, EIGHTH], [:E4, SIXTEENTH], [:F4, SIXTEENTH], [:D4, QUARTER]
  ])

  play_thread([
    [:G3, syncopate(EIGHTH)], [:E3, syncopate(EIGHTH)], [:C3, QUARTER], [:F3, SIXTEENTH], [:G3, EIGHTH], [:Gb3, SIXTEENTH], [:F3, EIGHTH, EIGHTH],
    [:E3, :C3, :E3, QUARTER, SIXTEENTH], [:F3, EIGHTH], [:D3, SIXTEENTH], [:E3, EIGHTH], [:C3, EIGHTH], [:A3, SIXTEENTH], [:B3, SIXTEENTH], [:G3, QUARTER]
  ])

  sleep WHOLE * 2
end

def section_two_common_beginning
  play_thread([[EIGHTH], [:G5, SIXTEENTH], [:Fs5, SIXTEENTH], [:F5, SIXTEENTH], [:Eb5, EIGHTH], [:E5, EIGHTH], [:Ab4, SIXTEENTH], [:A4, SIXTEENTH],
    [:C5, EIGHTH], [:A4, SIXTEENTH], [:C5, SIXTEENTH], [:D5, syncopate(EIGHTH)]
  ])

  play_thread([[EIGHTH], [:E5, SIXTEENTH], [:Ds5, SIXTEENTH], [:D5, SIXTEENTH], [:B4, EIGHTH], [:C5, EIGHTH], [:E4, SIXTEENTH], [:F4, SIXTEENTH],
    [:G4, EIGHTH], [:C4, SIXTEENTH], [:E4, SIXTEENTH], [:F4, syncopate(EIGHTH)]
  ])

  play_thread([
    [:C3, syncopate(EIGHTH)], [:G3, syncopate(EIGHTH)], [:C4, EIGHTH], [:F3, syncopate(EIGHTH)], [:C4, SIXTEENTH], [:C4, EIGHTH], [:F3, EIGHTH]
  ])

  sleep WHOLE
end

def section_two_part_one
  section_two_common_beginning

  play_thread([[
    EIGHTH], [:G5, SIXTEENTH], [:Fs5, SIXTEENTH], [:F5, SIXTEENTH], [:Eb5, EIGHTH], [:E5, EIGHTH], [:C6, EIGHTH], [:C6, SIXTEENTH], [:C6, syncopate(QUARTER), SIXTEENTH]
  ])

  play_thread([
    [EIGHTH], [:E5, SIXTEENTH], [:Ds5, SIXTEENTH], [:D5, SIXTEENTH], [:B4, EIGHTH], [:C5, EIGHTH], [:G5, EIGHTH], [:G5, SIXTEENTH], [:G5, syncopate(QUARTER), SIXTEENTH]
  ])

  play_thread([[:C3, syncopate(EIGHTH)], [:E3, syncopate(EIGHTH)], [:G3, SIXTEENTH], [:C4, SIXTEENTH], [SIXTEENTH], [:F5, EIGHTH], [:F5, SIXTEENTH], 
    [:F5, EIGHTH, SIXTEENTH], [:G3, EIGHTH]
  ])

  sleep WHOLE
end

def section_two_part_two
  section_two_common_beginning
  play_thread([[EIGHTH], [:Eb5, syncopate(EIGHTH)], [:D5, syncopate(EIGHTH)], [:C5, HALF]])
  play_thread([[EIGHTH], [:Ab4, syncopate(EIGHTH)], [:F4, syncopate(EIGHTH)], [:E4, HALF]])
  play_thread([[:C3, EIGHTH], [:Ab3, syncopate(EIGHTH)], [:Bb3, syncopate(EIGHTH)], [:C4, syncopate(EIGHTH)], [:G3, SIXTEENTH], [:G3, EIGHTH], [:C3, EIGHTH]])
  sleep WHOLE
end

def section_two
  section_two_part_one
  section_two_part_two
end

def section_three_common_beginning
  play_thread([[:C5, SIXTEENTH], [:C5, EIGHTH], [:C5, EIGHTH], [:C5, SIXTEENTH], [:D5, EIGHTH]])
  play_thread([[:Ab4, SIXTEENTH], [:Ab4, EIGHTH], [:Ab4, EIGHTH], [:Ab4, SIXTEENTH], [:Bb4, EIGHTH]])
  play_thread([[:Ab2, syncopate(EIGHTH)], [:Eb3, syncopate(EIGHTH)], [:Ab3, EIGHTH]])
  sleep HALF
end

def section_three_part_one
  section_three_common_beginning
  play_thread([[:E5, SIXTEENTH], [:C5, EIGHTH], [:A4, SIXTEENTH], [:G4, QUARTER]])
  play_thread([[:G4, SIXTEENTH], [:E4, EIGHTH], [:E4, SIXTEENTH], [:C4, QUARTER]])
  play_thread([[:G3, syncopate(EIGHTH)], [:C3, syncopate(EIGHTH)], [:G2, EIGHTH]])
  sleep HALF
end

def section_three_part_two
  section_three_common_beginning
  play_thread([[:E5, HALF]])
  play_thread([[:G4, HALF]])
  play_thread([[:G3, syncopate(EIGHTH)], [:C3, syncopate(EIGHTH)], [:G2, EIGHTH]])
  sleep HALF
end

def section_three
  section_three_part_one
  section_three_part_two
  section_three_part_one
  intro
end

def section_four_common_beginning
  play_thread([[:E5, SIXTEENTH], [:C5, EIGHTH], [:G4, syncopate(EIGHTH)], [:Ab4, EIGHTH], [:A4, SIXTEENTH], [:F5, EIGHTH], [:F5, SIXTEENTH], [:A4, QUARTER]])
  play_thread([[:C5, SIXTEENTH], [:A4, EIGHTH], [:E4, syncopate(EIGHTH)], [:E4, EIGHTH], [:F4, SIXTEENTH], [:C5, EIGHTH], [:C5, SIXTEENTH], [:F4, QUARTER]])
  play_thread([[:C3, syncopate(EIGHTH)], [:Fs3, SIXTEENTH], [:G3, EIGHTH], [:C4, EIGHTH], [:F3, EIGHTH], [:F3, EIGHTH], [:C4, SIXTEENTH], [:C4, SIXTEENTH], [:F3, EIGHTH]])
  sleep WHOLE
end

def section_four_part_one
  section_four_common_beginning
  play_thread([[:B4, :A5, :A5, QUARTER, SIXTEENTH], [:A5, :G5, :F5, QUARTER, SIXTEENTH], [:E5, SIXTEENTH], [:C5, EIGHTH], [:A4, SIXTEENTH], [:G4, QUARTER]])
  play_thread([[:G4, :F5, :F5, QUARTER, SIXTEENTH], [:F5, :E5, :D5, QUARTER, SIXTEENTH], [:C5, SIXTEENTH], [:A4, EIGHTH], [:F4, SIXTEENTH], [:E4, QUARTER]])
  play_thread([[:D3, syncopate(EIGHTH)], [:F3, SIXTEENTH], [:G3, EIGHTH], [:B3, EIGHTH], [:G3, EIGHTH], [:G3, EIGHTH], [:C4, SIXTEENTH], [:C4, SIXTEENTH], [:G3, EIGHTH]])
  sleep WHOLE
end

def section_four_part_two
  section_four_common_beginning
  play_thread([[:B4, SIXTEENTH], [:F5, EIGHTH], [:F5, SIXTEENTH], [:F5, :E5, :D5, QUARTER, SIXTEENTH], [:C5, HALF]])
  play_thread([[:G4, SIXTEENTH], [:D5, EIGHTH], [:D5, SIXTEENTH], [:D5, :C5, :B4, QUARTER, SIXTEENTH], [:G4, SIXTEENTH], [:E4, EIGHTH], [:E4, SIXTEENTH], [:C4, QUARTER]])
  play_thread([[:G3, SIXTEENTH], [:G3, EIGHTH], [:G3, SIXTEENTH], [:G3, :A3, :B3, QUARTER, SIXTEENTH], [:C4, EIGHTH], [:G3, EIGHTH], [:C3, QUARTER]])
  sleep WHOLE
end

def section_four
  section_four_part_one
  section_four_part_two
end

intro
2.times do section_one end
2.times do section_two end
section_three
2.times do section_one end
2.times do section_four end
