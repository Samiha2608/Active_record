Rails.application.routes.draw do
  resources :legacy_records
  root "legacy_records#index"
end
