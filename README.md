# Monkeys-Sprockets

~~~ruby
# config/initializers/monkeys.rb

# for example we will modify 'videojs-youtube' src file
# on the line 624 there a video quality changing attempt
# but it will not work, if a video is playing
# however it will work, if we stop a video, change a quality and then resume

Monkeys::Changer.tap do | change |

  # first we find a file by a full sprockets path
  # path, that you currently use in a //= require directive
  # but with full extensions

  # sprockets will throw error if there is no file

  change.file 'videojs-youtube/src/youtube.js' do | file |

    # then we get the 624 line
    # and checking that it has expected content
    # if not - error will be thrown
    # you can check content by string, regexp or omit it

    file.line 624, 'self.ytplayer.setPlaybackQuality(quality);' do | line |

      # block will receive line content
      # and returned value ( a string or an array )
      # will be used instead of this line

      [
        'if ( self.paused() ) {',
          line,
        '} else {',
          "self.ytplayer.stopVideo(); #{ line } self.ytplayer.playVideo();",
        '}'
      ]

    end

  end

end
~~~

And append 'monkeys/' to your require directives for this file
~~~js
//= require monkeys/videojs-youtube/src/youtube
~~~     

By default all patched files will be stored in 'vendor/assets/monkeys'.
