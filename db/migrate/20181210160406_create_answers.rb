class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
