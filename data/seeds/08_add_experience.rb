# Clear out all the current data
DataMapper.repository(:default).adapter.execute("delete from experiences")

CSV.open('./data/ct_resume_databases/work_experience.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Experience.create(
      student_id:    line['ID'].to_i,
      id:            line['ID_PK'].to_i,
      company:       line['Company_Name'],
      city:          line['City'],
      state:         line['State'],
      start:         line['Employment_Start'],
      end:           line['Employment_End'],
      position:      line['Position']
    )
  end
end
