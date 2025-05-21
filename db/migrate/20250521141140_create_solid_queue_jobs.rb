class CreateSolidQueueJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :solid_queue_jobs do |t|
      t.string   :job_class,    null: false
      t.text     :arguments
      t.datetime :scheduled_at, null: false
      t.string   :queue_name,   null: false
      t.timestamps
    end

    add_index :solid_queue_jobs, [ :queue_name, :scheduled_at ]
  end
end
