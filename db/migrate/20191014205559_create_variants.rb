class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.string :name
      t.references :product

      t.timestamps
    end
  end
end
