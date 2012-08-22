class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :text
      t.integer :sequence
      t.string :value

      t.timestamps
    end
  end
end
