# Clear out all the current data
Interest.destroy

CSV.open('./data/ct_resume_databases/Interests.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Interest.create(
      id_user:    line['ID'].to_i,
      id:         line['ID_PK'].to_i,
      interest:   line['Interest'],
    )
  end
end
