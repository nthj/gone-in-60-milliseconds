class CreateFlags < ActiveRecord::Migration[5.0]
  def change
    create_table :flags do |t|
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
