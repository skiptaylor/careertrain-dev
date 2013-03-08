# Clear out all the current data
Education.destroy

CSV.open('./data/ct_resume_databases/education.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Education.create(
      id_user:                line['ID'],
      id:                     line['ID_PK'],
      attending:              line['Attending'],
      graduate_on:            line['Graduate_On'],
      plan_attend:            line['Plan_attend'],
      completed:              line['Completed'],
      completed_on:           line['Completed_On'],
      graduated:              line['Graduated'],
      graduation_date:        line['Graduation_Date'],
      study:                  line['Study'],
      grad_date_change:       line['Grad_Date_Change'],
      completed_date_change:  line['Completed_Date_Change'],
      graduation_date_change: line['Graduation_Date_Change'],
      degree:                 line['Degree_Recieved']
    )
  end
end
