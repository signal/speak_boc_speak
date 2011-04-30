class SpeakController < ApplicationController
  def index
    @voices = Dir["/System/Library/Speech/Voices/*.SpeechVoice"].map {|v| File.basename(v).gsub('.SpeechVoice', '').underscore.humanize }
    @voice = params[:voice] || 'Alex'
    if request.post?
      args = [params[:message]]
      if @voice.present?
        args.unshift('-v', @voice)
      end

      path = Rails.root + "public"

      system "say", *args
      system "say", *args.concat(['-o', "#{path}/sound"])
      system "lame", "#{path}/sound.aiff", "#{path}/sound.mp3"
      Juggernaut.publish("speak_boc_speak", "http://#{request.host_with_port}/sound.mp3");
    end
  end
end
