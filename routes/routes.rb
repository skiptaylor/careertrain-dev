get '/?' do
	erb :index, layout: false
end

get '/index/?' do
	erb :index, layout: false
end

get '/admin/?'  do
  erb :resume_admin
end

get '/student/report/scores' do
  erb :'/student/report/scores', layout: false
end