# Clear out all the current data
DataMapper.repository(:default).adapter.execute("delete from activities")

CSV.open('./data/ct_resume_databases/activities.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Activity.create(
      user_id:            line['ID'].to_i,
      position:           line['Position'],
      organization:       line['Name_of_Org'],
      date_start:         line['Date_Start'],
      date_end:           line['Date_End'],
      id:                 line['ID_PK'].to_i,
      date_start_change:  line['Date_Start_Change'],
      date_end_change:    line['Date_End_Change']
    )
  end
end
