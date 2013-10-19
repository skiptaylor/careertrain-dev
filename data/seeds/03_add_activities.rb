# Clear out all the current data
DataMapper.repository(:default).adapter.execute("delete from activities")

CSV.open('./data/ct_resume_databases/activities.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Activity.create(
      student_id:         line['ID'].to_i,
      position:           line['Position'],
      organization:       line['Name_of_Org'],
      date_start:         line['Date_Start'],
      date_end:           line['Date_End'],
      id:                 line['ID_PK'].to_i
    )
  end
end
