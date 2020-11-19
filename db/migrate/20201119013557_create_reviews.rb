class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.string :rating
      t.string :integer

      t.timestamps
    end
  end
end