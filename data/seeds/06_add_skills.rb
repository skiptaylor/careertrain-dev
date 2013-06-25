# Clear out all the current data
DataMapper.repository(:default).adapter.execute("delete from skills")

CSV.open('./data/ct_resume_databases/career_skills.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Skill.create(
      student_id: line['ID'].to_i,
      skill:      line['Skill'],
      applied_1:  line['Applied_Skill_1'],
      applied_2:  line['Applied_Skill_2'],
      applied_3:  line['Applied_Skill_3'],
      applied_4:  line['Applied_Skill_4'],
      id:         line['ID_PK'].to_i
    )
  end
end
