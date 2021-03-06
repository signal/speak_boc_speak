class Say < ActiveRecord::Base

  after_create :say_it, :publish_audio_file

  private

  def say_it
    system "say", "-v", voice, phrase
  end

  def publish_audio_file
    path = Rails.root + "public/audio"
    FileUtils.mkdir_p(path)

    system "say", "-v", voice, "-o", "#{path}/#{id}.aiff", phrase
    system "/usr/local/bin/lame", "#{path}/#{id}.aiff", "#{path}/#{id}.mp3"
    Juggernaut.publish("speak_boc_speak", data)
  end

  def data
    "{\"url\" : \"/audio/#{id}.mp3\", \"phrase\" : \"#{phrase}\", \"voice\" : \"#{voice}\"}"
  end

end
