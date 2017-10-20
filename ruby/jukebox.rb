class Jukebox
  attr_accessor :song_list
  def initialize(song_list)
    @song_list = song_list
  end
  def summary
    puts "\n\n"
    song_list.each do |song|
      puts song
    end
  end
  def shuffle
    @song_list.shuffle!
  end
  def play!
    the_song = @song_list[0]
    puts "\nPlaying the song, #{the_song}\n\n\n"
    @song_list.shift
    @song_list.push(the_song)
  end
  def add_track(song_name)
    if @song_list.include?(song_name)
      puts "\n#{song_name} is on the list.  Adding it now!\n"
      @song_list.push(song_name)
      true
    else
      puts "\nThis song is not on your list.  Try again!\n"
      false
    end
  end
end

my_songlist = [ "Hello - Lionel Ritchie",
"Kokomo – The Beach Boys",
"Girl You Know It’s True – Milli Vanilli",
"Agadoo – Black Lace",
"Down Under - Men at Work",
"Nothing's Gonna Stop Us Now - Starship",
"Get Outta My Dreams, Get Into My Car - Billy Ocean",
"I Just Called To Say I Love You - Stevie Wonder",
"Hangin' Tough - New Kids on the Block",
"We Built This City - Starship",
"Wake Me Up Before You Go Go - Wham!",
"We Didn't Start The Fire - Billy Joel",
"I Wanna Dance With Somebody - Whitney Houston",
"U Can't Touch This - MC Hammer",
]

jb_songlist = Jukebox.new(my_songlist)
jb_songlist.shuffle
jb_songlist.summary
jb_songlist.add_track("We Didn't Start The Fire - Billy Joel")
jb_songlist.summary
jb_songlist.add_track("Tom Sawyer - RUSH")
jb_songlist.summary
jb_songlist.play!
jb_songlist.play!
jb_songlist.shuffle
jb_songlist.summary
jb_songlist.play!
