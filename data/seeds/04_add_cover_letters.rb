# Clear out all the current data
DataMapper.repository(:default).adapter.execute("delete from letters")

CSV.open('./data/ct_resume_databases/cover_letters.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Letter.create(
      user_id:  line['ID'].to_i,
      title:    line['Title'],
      first:    line['First_Name'],
      last:     line['Last_Name'],
      position: line['Position'],
      id:       line['ID_PK'].to_i,
      company:  line['Company_Name'],
      address:  line['Company_Address'],
      city:     line['Company_City'],
      state:    line['Company_State'],
      zip:      line['Company_Zip'],
      apply:    line['Apply_Job'],
      opening:  line['Opening_Sentence']
    )
  end
end
