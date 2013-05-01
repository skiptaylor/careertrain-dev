namespace '/educator' do
  
  ['/student/resume/sign-in/?'].each do |path|
    before(path) { authenticate :educator }
  end
  
end