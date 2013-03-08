# Clear out all the current data
Contact.destroy

CSV.open('./data/ct_resume_databases/contact_info.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Contact.create(
      id_user:        line['ID'],
      name:           line['Name'],
      address:        line['Address'],
      city:           line['City'],
      state:          line['State'],
      zip:            line['Zip'],
      phone:          line['Phone_Number'],
      email:          line['email'],
      last_activity:  line['Last_Activity'],
      id:             line['PK_ID']
    )
  end
end
