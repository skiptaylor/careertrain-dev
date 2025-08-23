get "/accounts/new/?" do
  auth_admin
  @account = Account.new
  erb :"/accounts/accounts_edit"
end

post "/accounts/new/?" do
  auth_admin
  Account.create(
    :name         => params[:name],
    :abbr         => params[:abbr],
  )
  params[:active] ? account.update(:active => true) : account.update(:active => false)

  redirect "/accounts/accounts"
end

get "/accounts/accounts/?" do
  auth_admin
  @account = Accounts
  erb :"/accounts/accounts"
end

get "/accounts/:id/edit/?" do
  auth_admin
  @account = Accounts[params[:id]]
  erb :"/accounts/account_edit"
end

post "/accounts/:id/edit/?" do
  auth_admin
  account = Accounts[params[:id]]
  account.update(
    :name         => params[:name],
    :abbr         => params[:abbr],
  )
  params[:active] ? account.update(:active => true) : account.update(:active => false)

  redirect "/accounts/accounts"
end

get "/accounts/:id/delete/?" do
  auth_admin
  account = Account[params[:id]]
  account.destroy
  redirect "/accounts/accounts"
end