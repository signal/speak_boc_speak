class SpeakController < ApplicationController
  def index
    @voices = Dir["/System/Library/Speech/Voices/*.SpeechVoice"].map {|v| File.basename(v).gsub('.SpeechVoice', '').underscore.humanize }
    @voice = params[:voice] || 'Alex'
    if request.post?
      args = [params[:message]]
      if @voice.present?
        args.unshift('-v', @voice)
      end

      say = Say.create!(:voice => @voice, :phrase => params[:message])

      respond_to do |format|
        format.html
        format.js
      end
    end

  end
end
