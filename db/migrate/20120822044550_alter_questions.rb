class AlterQuestions < ActiveRecord::Migration
  def up
    rename_column('questions', 'type', 'kind')
  end

  def down
    rename_column('questions', 'kind', 'type')
  end
end
