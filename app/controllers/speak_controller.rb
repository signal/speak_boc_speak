class SpeakController < ApplicationController
  def index
    @voices = Dir["/System/Library/Speech/Voices/*.SpeechVoice"].map {|v| File.basename(v).gsub('.SpeechVoice', '').underscore.humanize }
    @voice = params[:voice] || 'Alex'
    if request.post?
      args = [params[:message]]
      if @voice.present?
        args.unshift('-v', @voice)
      end

      Say.create!(:voice => @voice, :phrase => params[:message])
    end
  end
end
