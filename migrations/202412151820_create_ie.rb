Sequel.migration do
  change do
    create_table(:ies) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Integer  :tr_number
      String  :item
      String  :category
      Integer  :position_number
      Integer  :section
    end
  end
end 