class SaveSearch < ActiveRecord::Migration[5.2]
  def change
    create_table :saves do |t|
      t.string :user_id
      t.string :books_id
    end
  end
end
