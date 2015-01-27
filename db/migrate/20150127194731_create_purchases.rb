class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:description, :string)

      t.timestamps
    end
  end
end
