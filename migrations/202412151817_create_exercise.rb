Sequel.migration do
  change do
    create_table(:exercises) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at
      DateTime :deleted_at
  
      Integer  :score_a, default: 0
      Integer  :score_b, default: 0
      Integer  :score_c, default: 0
      Integer  :score_d, default: 0
      Integer  :score_e, default: 0
      Integer  :score_f, default: 0
      Integer  :score_g, default: 0
      Integer  :score_h, default: 0
      Integer  :score_i, default: 0
      
      String  :high1
      String  :high2
    end
  end
end


