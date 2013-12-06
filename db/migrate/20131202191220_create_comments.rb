class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.string :body
      t.string :email
      t.references :post

      t.timestamps
    end
  end
end
