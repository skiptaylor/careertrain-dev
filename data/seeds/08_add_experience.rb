# Clear out all the current data
Experience.destroy

CSV.open('./data/ct_resume_databases/work_experience.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Experience.create(
      id_user:       line['ID'].to_i,
      id:            line['ID_PK'].to_i,
      company:       line['Company_Name'],
      city:          line['City'],
      state:         line['State'],
      start:         line['Employment_Start'],
      end:           line['Employment_End'],
      position:      line['Position'],
      start_change:  line['Employment_Start_Change'],
      end_change:    line['Employment_End_Change']
    )
  end
end
