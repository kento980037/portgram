class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
