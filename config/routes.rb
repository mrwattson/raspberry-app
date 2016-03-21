Rails.application.routes.draw do
  get 'monitor/show'
  get 'monitor/footprint'
  root 'monitor#show'
end
