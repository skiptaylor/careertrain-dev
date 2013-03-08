# Clear out all the current data
Award.destroy

CSV.open('./data/ct_resume_databases/awards.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Award.create(
      id_user:            line['ID'],
      id:                 line['ID_PK'],
      award:              line['Award'],
      award_date:         line['Award_Date'],
      award_date_change:  line['Award_Date_Change']
    )
  end
end
