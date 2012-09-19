class AddAnswerValueToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :value, :integer
  end
end
