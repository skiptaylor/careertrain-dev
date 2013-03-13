CSV.open('./data/ct_resume_databases/contact_info.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    if user = User.get(line['ID'])
      user.update(
        name:           line['Name'],
        address:        line['Address'],
        city:           line['City'],
        state:          line['State'],
        zip:            line['Zip'],
        phone:          line['Phone_Number'],
      )
    end
  end
end
