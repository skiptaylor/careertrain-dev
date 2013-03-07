# Clear out all the current data
Resume.destroy

CSV.open('./data/ct_resume_databases/login_table.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Resume.create(
      id:             line['ID'],
      email:          line['Email'],
      password:       line['Password'], 
      last_activity:  line['Last_Activity'],
      create_date:    line['Create_Date']
    )
  end
end
