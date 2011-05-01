SpeakBocSpeak::Application.routes.draw do
  root :to => 'speak#index'
  match '/:controller(/:action(/:id))'
end
