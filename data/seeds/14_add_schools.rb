# Clear out all the current data
DataMapper.repository(:default).adapter.execute("delete from schools")

CSV.open('./data/ct_databases/Clients.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    c = School.create(
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
      school_zip:         line['SZip'].to_i,
      mail_address1:      line['MAddress1'],
      mail_address2:      line['MAddress2'],
      mail_city:          line['MCity'],
      mail_state:         line['MState'],
      mail_zip:           line['MZip'].to_i,
      phone:              line['Phone'],
      fax:                line['Fax'],
      ng_rep:             line['NGRep'],
      email:              line['Email'],
      cd:                 line['CD'],
      ff:                 line['FF'],
      cd_before:          line['CDBefore'],
      number_seniors:     line['NumSeniors'].to_i
    )
    unique_scool_code = line['SZipUnique']
    unique_scool_code = ("%02d" % unique_scool_code.to_i).to_s if unique_scool_code.to_i < 10
    c.update(school_password: "cd#{c.school_zip}#{unique_scool_code}") if c.school_zip
  end
end
