Wrake::Engine.routes.draw do
  match '/tasks/:task_name' => 'tasks#invoke', via: [:get, :post]
end
