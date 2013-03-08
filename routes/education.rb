get '/educations/?' do
	@education = Education.all
	erb :educations
end

get '/educations/new/?' do
  @education = Education.new
  erb :edit_education
end

post '/educations/new/?' do
  education = Education.create(
    :id_user                  => params[:id_user],
    :attending                => params[:attending],
    :graduate_on              => params[:graduate_on],
    :plan_attend              => params[:plan_attend],
    :completed                => params[:completed],
    :completed_on             => params[:completed_on],
    :graduation_date          => params[:graduation_date],
    :study                    => params[:study],
    :grad_date_change         => params[:grad_date_change],
    :completed_date_change    => params[:completed_date_change],
    :graduation_date_change   => params[:graduation_date_change],
    :degree                   => params[:degree]
  )
  redirect '/educations'
end

get '/educations/:id/?' do
  @education = Education.get(params[:id])
  erb :education
end

get '/educations/:id/edit/?' do
  @education = Education.get(params[:id])
  erb :edit_education
end

post '/educations/:id/edit/?' do
  education = Education.get(params[:id])
  education.update(
    :id_user                  => params[:id_user],
    :attending                => params[:attending],
    :graduate_on              => params[:graduate_on],
    :plan_attend              => params[:plan_attend],
    :completed                => params[:completed],
    :completed_on             => params[:completed_on],
    :graduation_date          => params[:graduation_date],
    :study                    => params[:study],
    :grad_date_change         => params[:grad_date_change],
    :completed_date_change    => params[:completed_date_change],
    :graduation_date_change   => params[:graduation_date_change],
    :degree                   => params[:degree]
  )
  redirect '/educations'
end

get '/educations/:id/delete/?' do
  education = Education.get(params[:id])
  education.destroy
  redirect '/educations'
end
