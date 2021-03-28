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
    :section          => params[:section],
    :category         => params[:category],
    :tr_number        => params[:tr_number]
  )
  
  params[:answer_yes]  ? ie.update(:answer_yes => true) : ie.update(:answer_yes => false)
  params[:answer_no]  ? ie.update(:answer_no => true) : ie.update(:answer_no => false)

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
    :section          => params[:section],
    :category         => params[:category],
    :tr_number        => params[:tr_number]
  )
  
  params[:answer_yes]  ? ie.update(:answer_yes => true) : ie.update(:answer_yes => false)
  params[:answer_no]  ? ie.update(:answer_no => true) : ie.update(:answer_no => false)

  redirect "/ie/ies"
end

get "/ie/:id/delete/?" do
  auth_admin
  ie = Ie.get(params[:id])
  ie.destroy
  redirect "/ie/ies"
end
