# Clear out all the current data
DataMapper.repository(:default).adapter.execute("delete from rrcs")

CSV.open('./data/ct_databases/Rrm.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Rrc.create(
      id:     line['RRMID'],
      state:  line['State'],
      email:  line['Email'],
      status: line['Status']
    )
  end
end
