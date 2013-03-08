# Clear out all the current data
Reference.destroy

CSV.open('./data/ct_resume_databases/references.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Reference.create(
      id_user:      line['ID'],
      id:           line['ID_PK'],
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
