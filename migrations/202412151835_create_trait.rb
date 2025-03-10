Sequel.migration do
  change do
    create_table(:traits) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at

      Integer :student_ideger
      Text :trait_1
      Text :trait_2
      Text :trait_3
      Text :opening_sentence
    end
  end
end