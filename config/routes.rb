SpeakBocSpeak::Application.routes.draw do
  match '/' => 'speak#index'
  match '/:controller(/:action(/:id))'
end
