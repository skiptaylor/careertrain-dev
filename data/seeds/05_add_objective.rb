# Clear out all the current data
Objective.destroy

CSV.open('./data/ct_resume_databases/career_objective.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Objective.create(
      id_user:    line['ID'],
      goal:       line['Goal'],
      learn:      line['Learn'],
      long_goal:  line['Long_Goal'],
      id:         line['ID_PK']
    )
  end
end
