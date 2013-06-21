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

get '/student/resources/?'  do
  erb :'/student/resources'
end

get '/student/feedback/?'  do
  erb :'/student/feedback'
end

get '/student/resume_tool/?'  do
  erb :'/student/resume_tool'
end