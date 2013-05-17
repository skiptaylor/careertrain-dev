# Clear out all the current data
DataMapper.repository(:default).adapter.execute("delete from traits")

CSV.open('./data/ct_resume_databases/character_traits.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Trait.create(
      user_id:          line['ID'].to_i,
      id:               line['ID_PK'].to_i,
      trait_1:          line['Trait_1'],
      trait_2:          line['Trait_2'],
      trait_3:          line['Trait_3'],
      opening_sentence: line['Opening_Sentence']
    )
  end
end
