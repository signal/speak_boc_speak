class CreateSays < ActiveRecord::Migration
  def self.up
    create_table :says do |t|
      t.string :phrase
      t.string :voice

      t.timestamps
    end
  end

  def self.down
    drop_table :says
  end
end
