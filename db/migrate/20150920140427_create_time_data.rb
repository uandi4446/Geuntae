class CreateTimeData < ActiveRecord::Migration
  def change
    create_table :time_data do |t|    
      t.string :enum, null: false
      t.date :date, null: false
      t.time :start_time
      t.time :end_time
      t.time :avg_start_time
      t.time :avg_end_time

      t.timestamps null: false
    end

    execute 'ALTER TABLE time_data ADD CONSTRAINT fk_id FOREIGN KEY (enum) REFERENCES members (enum) ON DELETE CASCADE;'

  end

  def self.down
    drop_table :time_data
  end
end
