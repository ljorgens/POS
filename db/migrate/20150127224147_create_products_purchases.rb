class CreateProductsPurchases < ActiveRecord::Migration
  def change
    create_table(:products_purchases) do |t|
      t.column(:product_id, :integer)
      t.column(:purchase_id, :integer)

      t.timestamps
    end
  end
end
