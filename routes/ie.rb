get "/ie/new/?" do
  auth_admin
  @ie = Ie.new
  erb :"/ie/ie_edit"
end

post "/ie/new/?" do
  auth_admin
  ie = Ie.create(
  :position_number  => params[:position_number],
  :item             => params[:item],
  :category        => params[:category]
  )

  redirect "/ie/ies"
end

get "/ie/ies/?" do
  auth_admin
  @ie = Ie.all
  erb :"/ie/ies"
end

get "/ie/:id/edit/?" do
  auth_admin
  @ie = Ie.get(params[:id])
  erb :"/ie/ie_edit"
end

post "/ie/:id/edit/?" do
  auth_admin
  ie = Ie.get(params[:id])
  ie.update(
    :position_number  => params[:position_number],
    :item             => params[:item],
    :category        => params[:category]
  )

  redirect "/ie/ies"
end

get "/ie/:id/delete/?" do
  auth_admin
  ie = Ie.get(params[:id])
  ie.destroy
  redirect "/ie/ies"
end

get "/ie/exercise/?"  do
  @ie = Ie.all
  erb :"/ie/exercise"
end