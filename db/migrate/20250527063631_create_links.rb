class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.string :lookup_code
      t.string :original_url

      t.timestamps
    end
  end
end
