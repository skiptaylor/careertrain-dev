# Clear out all the current data
Client.destroy

CSV.open('./data/ct_databases/Clients.csv', { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Client.create(
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
      school_zip_unique:  line['SZipUnique'],
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
  end
end
