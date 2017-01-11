def play_super_mario_brothers_overworld_theme
  use_bpm 97
  use_synth :pulse
  
  intro
  vamp
  2.times{ section_one }
  2.times{ section_two }
  section_three
  2.times{ section_one }
  2.times{ section_four }
  section_three
  section_four(true)
  outro
end


#####################################
# INTRO
#####################################
def intro_notes(part)
  {
    tenor: [[:E5, 0.25], [:E5, 0.5], [:E5, 0.5], [:C5, 0.25], [:E5, 0.5], [:G5, 2]],
    baritone: [[:Fs4, 0.25], [:Fs4, 0.5], [:Fs4, 0.5], [:Fs4, 0.25], [:Fs4, 0.5], [:G4, 2]],
    bass: [[:D3, 0.25],  [:D3, 0.5], [:D3, 0.5], [:D3, 0.25], [:D3, 0.5], [1], [:G3, 1]]
  }[part]
end

def intro(add_percussion = false)
  play_percussion(2) if add_percussion
  play_thread(intro_notes(:tenor))
  play_thread(intro_notes(:baritone))
  play_thread(intro_notes(:bass))
  sleep 4
end


#####################################
# VAMP
#####################################
def vamp
  play_percussion 4
  sleep 8
  2.times do
    play_percussion 4
    play_thread([[:G3, 0.75], [:E3, 0.75], [:C3, 1], [:F3, 0.25], [:G3, 0.5], [:Gb3, 0.25], [:F3, 0.5, 0.5]])
    sleep 8
  end
end


#####################################
# SECTION ONE
#####################################
def section_one_notes(part)
  {
    tenor: [
      [:C5, 0.75], [:G4, 0.75], [:E4, 1], [:A4, 0.25], [:B4, 0.5], [:Bb4, 0.25], [:A4, 0.5, 0.5], [:G4, 0.33], 
      [:C5, 0.33], [:E5, 0.34], [:A5, 0.5], [:F5, 0.25], [:G5, 0.5], [:E5, 0.5], [:C5, 0.25], [:D5, 0.25], [:B4, 1]
    ],
    baritone: [
      [:E4, 0.75], [:C4, 0.75], [:G3, 1], [:C4, 0.25], [:D4, 0.5], [:Db4, 0.25], [:C4, 0.5, 0.5], [:C4, 0.33], 
      [:G4, 0.33], [:B4, 0.34], [:C5, 0.5], [:A4, 0.25], [:B4, 0.5], [:G4, 0.5], [:E4, 0.25], [:F4, 0.25], [:D4, 1]
    ],
    bass: [
      [:G3, 0.75], [:E3, 0.75], [:C3, 1], [:F3, 0.25], [:G3, 0.5], [:Gb3, 0.25], [:F3, 0.5, 0.5], [:E3, 0.33], 
      [:C3, 0.33], [:E3, 0.34], [:F3, 0.5], [:D3, 0.25], [:E3, 0.5], [:C3, 0.5], [:A3, 0.25], [:B3, 0.25], [:G3, 1]
    ]
  }[part]
end

def section_one
  play_percussion 4
  play_thread(section_one_notes(:tenor))
  play_thread(section_one_notes(:baritone))
  play_thread(section_one_notes(:bass))
  sleep 8
end


#####################################
# SECTION TWO
#####################################
def section_two_notes(part)
  {
    tenor: [
      [0.5], [:G5, 0.25], [:Fs5, 0.25], [:F5, 0.25], [:Eb5, 0.5], [:E5, 0.5], [:Ab4, 0.25], [:A4, 0.25], [:C5, 0.5], 
      [:A4, 0.25], [:C5, 0.25], [:D5, 0.75], [:G5, 0.25], [:Fs5, 0.25], [:F5, 0.25], [:Eb5, 0.5], [:E5, 0.5], 
      [:C6, 0.5], [:C6, 0.25], [:C6, 1.5, 0.25], [:G5, 0.25], [:Fs5, 0.25], [:F5, 0.25], [:Eb5, 0.5], [:E5, 0.5], 
      [:Ab4, 0.25], [:A4, 0.25], [:C5, 0.5], [:A4, 0.25], [:C5, 0.25], [:D5, 0.75], [:Eb5, 0.75], [:D5, 0.75], [:C5, 2]
    ],
    baritone: [
      [0.5], [:E5, 0.25], [:Ds5, 0.25], [:D5, 0.25], [:B4, 0.5], [:C5, 0.5], [:E4, 0.25], [:F4, 0.25], [:G4, 0.5], 
      [:C4, 0.25], [:E4, 0.25], [:F4, 0.75], [:E5, 0.25], [:Ds5, 0.25], [:D5, 0.25], [:B4, 0.5], [:C5, 0.5], 
      [:G5, 0.5], [:G5, 0.25], [:G5, 1.5, 0.25], [:E5, 0.25], [:Ds5, 0.25], [:D5, 0.25], [:B4, 0.5], [:C5, 0.5], 
      [:E4, 0.25], [:F4, 0.25], [:G4, 0.5], [:C4, 0.25], [:E4, 0.25], [:F4, 0.75], [:Ab4, 0.75], [:F4, 0.75], [:E4, 2]
    ],
    bass: [
      [:C3, 0.75], [:G3, 0.75], [:C4, 0.5], [:F3, 0.75], [:C4, 0.25], [:C4, 0.5], [:F3, 0.5], [:C3, 0.75], [:E3, 0.75], 
      [:G3, 0.25], [:C4, 0.25], [0.25], [:F5, 0.5], [:F5, 0.25], [:F5, 0.5, 0.25], [:G3, 0.5], [:C3, 0.75], [:G3, 0.75], 
      [:C4, 0.5], [:F3, 0.75], [:C4, 0.25], [:C4, 0.5], [:F3, 0.5], [:C3, 0.5], [:Ab3, 0.75], [:Bb3, 0.75], [:C4, 0.75], 
      [:G3, 0.25], [:G3, 0.5], [:C3, 0.5]
    ]
  }[part]
end

def section_two
  play_percussion 8
  play_thread(section_two_notes(:tenor))
  play_thread(section_two_notes(:baritone))
  play_thread(section_two_notes(:bass))
  sleep 16
end


#####################################
# SECTION THREE
#####################################
def section_three_notes(part)
  {
    tenor: [
      [:C5, 0.25], [:C5, 0.5], [:C5, 0.5], [:C5, 0.25], [:D5, 0.5], [:E5, 0.25], [:C5, 0.5], [:A4, 0.25], 
      [:G4, 1], [:C5,  0.25], [:C5, 0.5], [:C5, 0.5], [:C5, 0.25], [:D5, 0.25], [:E5, 0.5], [1.75],
      [:C5, 0.25], [:C5, 0.5], [:C5, 0.5], [:C5, 0.25], [:D5, 0.5], [:E5, 0.25], [:C5, 0.5], [:A4, 0.25], [:G4, 1]
    ],
    baritone: [
      [:Ab4, 0.25], [:Ab4, 0.5], [:Ab4, 0.5], [:Ab4, 0.25], [:Bb4, 0.5], [:G4, 0.25], [:E4, 0.5], [:E4, 0.25], 
      [:C4, 1], [:Ab4, 0.25], [:Ab4, 0.5], [:Ab4, 0.5], [:Ab4, 0.25], [:Bb4, 0.25], [:G4, 0.5], [1.75],
      [:Ab4, 0.25], [:Ab4, 0.5], [:Ab4, 0.5], [:Ab4, 0.25], [:Bb4, 0.5], [:G4, 0.25], [:E4, 0.5], [:E4, 0.25], [:C4, 1]
    ],
    bass: [
      [:Ab2, 0.75], [:Eb3, 0.75], [:Ab3, 0.5], [:G3, 0.75], [:C3, 0.75], [:G2, 0.5], [:Ab2, 0.75], [:Eb3, 0.75], 
      [:Ab3, 0.5], [:G3, 0.75], [:C3, 0.75], [:G2, 0.5], [:Ab2, 0.75], [:Eb3, 0.75], [:Ab3, 0.5], [:G3, 0.75], 
      [:C3, 0.75], [:G2, 0.5]
    ]
  }[part]
end

def section_three
  play_percussion 6
  play_thread(section_three_notes(:tenor))
  play_thread(section_three_notes(:baritone))
  play_thread(section_three_notes(:bass))
  sleep 12
  intro(true)
end


#####################################
# SECTION FOUR
#####################################
def section_four_notes(part)
  {
    tenor: [
      [:E5, 0.25], [:C5, 0.5], [:G4, 0.75], [:Ab4, 0.5], [:A4, 0.25], [:F5, 0.5], [:F5, 0.25], [:A4, 1],
      [:B4, 0.33], [:A5, 0.33], [:A5, 0.34], [:A5, 0.33], [:G5, 0.33], [:F5, 0.34], [:E5, 0.25], [:C5, 0.5],
      [:A4, 0.25], [:G4, 1], [:E5, 0.25], [:C5, 0.5], [:G4, 0.75], [:Ab4, 0.5], [:A4, 0.25], [:F5, 0.5], 
      [:F5, 0.25], [:A4, 1], [:B4, 0.25], [:F5, 0.5], [:F5, 0.25], [:F5, 0.33], [:E5, 0.33], [:D5, 0.34], [:C5, 2]
    ],
    baritone: [
      [:C5, 0.25], [:A4, 0.5], [:E4, 0.75], [:E4, 0.5], [:F4, 0.25], [:C5, 0.5], [:C5, 0.25], [:F4, 1],
      [:G4, 0.33], [:F5, 0.33], [:F5, 0.34], [:F5, 0.33], [:E5, 0.33], [:D5, 0.334], [:C5, 0.25], [:A4, 0.5], 
      [:F4, 0.25], [:E4, 1], [:C5, 0.25], [:A4, 0.5], [:E4, 0.75], [:E4, 0.5], [:F4, 0.25], [:C5, 0.5], [:C5, 0.25], 
      [:F4, 1], [:G4, 0.25], [:D5, 0.5], [:D5, 0.25], [:D5, 0.33], [:C5, 0.33], [:B4, 0.34], [:G4, 0.25], [:E4, 0.5], 
      [:E4, 0.25], [:C4, 1]
    ],
    bass: [
      [:C3, 0.75], [:Fs3, 0.25], [:G3, 0.5], [:C4, 0.5], [:F3, 0.5], [:F3, 0.5], [:C4, 0.25], [:C4, 0.25], [:F3, 0.5],
      [:D3, 0.75], [:F3, 0.25], [:G3, 0.5], [:B3, 0.5], [:G3, 0.5], [:G3, 0.5], [:C4, 0.25], [:C4, 0.25], [:G3, 0.5],
      [:C3, 0.75], [:Fs3, 0.25], [:G3, 0.5], [:C4, 0.5], [:F3, 0.5], [:F3, 0.5], [:C4, 0.25], [:C4, 0.25], [:F3, 0.5],
      [:G3, 0.25], [:G3, 0.5], [:G3, 0.25], [:G3, 0.33], [:A3, 0.33], [:B3, 0.34], [:C4, 0.5],  [:G3, 0.5], [:C3, 1]
    ]
  }[part]
end

def section_four(last_time = false)
  play_percussion(last_time ? 6 : 8)
  play_thread(section_four_notes(:tenor))
  play_thread(section_four_notes(:baritone))
  play_thread(section_four_notes(:bass))
  sleep 16
end


#####################################
# OUTRO
#####################################
def outro_notes(part)
  {
    tenor: [
      [:C5, 1, 1], [:G4, 1, 1], [:E4, 1, 1], [:A4, 0.54, 0.54], [:B4, 0.58, 0.58], [:A4, 0.62, 0.62], [:Gs4, 0.66, 0.66], 
      [:Bb4, 0.7, 0.7], [:Gs4, 0.74, 0.74], [:G4, 3.5, 3.5]
    ],
    baritone: [
      [:E4, 1, 1], [:C4, 1, 1], [:G3, 1, 1], [:C4, 1.74, 1.74], [:Es4, 2.1, 2.1], [:G4, 0.25, 0.25], [:F4, 0.25, 0.25],
      [:G4, 3, 3]
    ],
    bass: [[:G3, 1, 1], [:E3, 1, 1], [:C3, 1, 1], [:F3, 1.74, 1.74], [:Cs3, 2.1, 2.1], [:E3, 3.5, 3.5]]
  }[part]
end

def outro(last_time = false)
  play_thread(outro_notes(:tenor))
  play_thread(outro_notes(:baritone))
  play_thread(outro_notes(:bass))
end


#####################################
# PERCUSSION
#####################################
def percussion
  [[1, 100], [100, 1]].each do |pitch1, pitch2|
    play pitch1, release: 0.065, attack_level: 0.8, amp: 1
    sleep 0.5
    play pitch2, release: 0.0625, attack_level: 0.2, amp: 0.4
    sleep 0.375
    play pitch2, release: 0.0625, attack_level: 0.2, amp: 0.4
    sleep 0.125
  end
end

def play_percussion(n)
  in_thread do
    use_synth :pnoise
    n.times do
      percussion
    end
  end
end


#####################################
# CONVINIENCE
#####################################
def play_thread(note_thread)
  in_thread do
    note_thread.each do |note_attributes|
      if note_attributes.length == 1
        sleep note_attributes[0]
        next
      end
      
      sustain = note_attributes.length == 2 ? 0.25 : note_attributes[2]
      play_note_for_duration(note_attributes[0], note_attributes[1], sustain)
    end
  end
end

def play_note_for_duration(pitch, duration, sustain = 0.25)
  play pitch, release: sustain, env_curve: 4
  sleep duration
end


#####################################
# PLAY IT!
#####################################
play_super_mario_brothers_overworld_theme

