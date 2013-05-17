# Clear out all the current data
DataMapper.repository(:default).adapter.execute("delete from clients")

CSV.open('./data/ct_databases/Clients.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    c = Client.create(
      school_id:          line['ClientID'].to_i,
      date_modified:      line['DateModified'],
      active:             line['Active'],
      first_name:         line['FirstName'],
      middle_initial:     line['MiddleI'],
      last_name:          line['LastName'],
      school_name:        line['SName'],
      school_address1:    line['SAddress1'],
      school_address2:    line['SAddress2'],
      school_city:        line['SCity'],
      school_state:       line['SState'],
      school_zip:         line['SZip'],
      mail_address1:      line['MAddress1'],
      mail_address2:      line['MAddress2'],
      mail_city:          line['MCity'],
      mail_state:         line['MState'],
      mail_zip:           line['MZip'],
      phone:              line['Phone'],
      fax:                line['Fax'],
      ng_rep:             line['NGRep'],
      email:              line['Email'],
      cd:                 line['CD'],
      ff:                 line['FF'],
      cd_before:          line['CDBefore'],
      number_seniors:     line['NumSeniors']
    )
    c.update(school_password: "cd#{c.school_zip}#{line['SZipUnique']}") if c.school_zip
  end
end
