Rails.application.routes.draw do
  get 'student/index'
  get 'student/show'
  get 'student/new'
  get 'student/edit'
  get 'invoice/index'
  get 'invoice/show'
  get 'invoice/new'
  get 'invoice/edit'
  get 'institution/index'
  get 'institution/show'
  get 'institution/new'
  get 'institution/edit'
  get 'enrollment/index'
  get 'enrollment/show'
  get 'enrollment/new'
  get 'enrollment/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
