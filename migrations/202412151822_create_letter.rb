Sequel.migration do
  change do
    create_table(:letters) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      String :title
      String :first
      String :last
      String :position
      Integer :student_id
      Text :company
      String :address
      String :city
      String :state
      String :zip
      Text :apply
      Text :opening
    end
  end
end