# Clear out all the current data
Interest.destroy

CSV.open('./data/ct_resume_databases/Interests.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Interest.create(
      id_user:    line['ID'],
      id:         line['ID_PK'],
      interest:   line['Interest'],
    )
  end
end
