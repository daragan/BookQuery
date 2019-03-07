class SaveSearch < ActiveRecord::Migration[5.2]
  def change
    create_table :saves do |t|
      t.string :user_id
      t.string :books_id
      t.string :search
    end
  end
end
