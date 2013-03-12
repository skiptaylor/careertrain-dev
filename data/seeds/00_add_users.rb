# Clear out all the current data
User.destroy

CSV.open('./data/ct_resume_databases/login_table.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    User.create(
      id:            line['ID'].to_i,
      email:         line['Email'],
      password:      line['Password'],
      last_activity: line['Last_Activity'],
      create_date:   line['Create_Date']
    )
  end
end
