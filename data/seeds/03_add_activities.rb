# Clear out all the current data
Activity.destroy

CSV.open('./data/ct_resume_databases/activities.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Activity.create(
      id_user:            line['ID'],
      position:           line['Position'],
      organization:       line['Name_of_Org'],
      date_start:         line['Date_Start'],
      date_end:           line['Date_End'],
      id:                 line['ID_PK'],
      date_start_change:  line['Date_Start_Change'],
      date_end_change:    line['Date_End_Change']
    )
  end
end
