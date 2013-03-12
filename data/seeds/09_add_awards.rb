# Clear out all the current data
Award.destroy

CSV.open('./data/ct_resume_databases/awards.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Award.create(
      user_id:            line['ID'].to_i,
      id:                 line['ID_PK'].to_i,
      award:              line['Award'],
      award_date:         line['Award_Date'],
      award_date_change:  line['Award_Date_Change']
    )
  end
end
