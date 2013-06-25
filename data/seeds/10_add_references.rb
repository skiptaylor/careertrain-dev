# Clear out all the current data
DataMapper.repository(:default).adapter.execute("delete from refs")

CSV.open('./data/ct_resume_databases/references.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Reference.create(
      student_id:   line['ID'].to_i,
      id:           line['ID_PK'].to_i,
      name:         line['Name'],
      relationship: line['Relationship'],
      address:      line['Address'],
      city:         line['City'],
      state:        line['State'],
      zip:          line['Zip'],
      phone:        line['Phone_Number'],
      email:        line['Email']
    )
  end
end
