class CreateAvgTimeData < ActiveRecord::Migration
  def change
    create_table :avg_time_data, id: false  do |t|
    	t.string	:enum, null: false
    	t.time 		:avg_start_time, null: false
    	t.time 		:avg_end_time,   null: false

      	t.timestamps null: false
    end

	execute 'ALTER TABLE avg_time_data ADD CONSTRAINT fk_id_avg FOREIGN KEY (enum) REFERENCES members (enum) ON DELETE CASCADE;'
	execute 'ALTER TABLE avg_time_data ADD PRIMARY KEY (enum);'

  end

  def self.down
    drop_table :avg_time_data
  end
end