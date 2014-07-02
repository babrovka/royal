class CreateStageStageImages < ActiveRecord::Migration
  def change
    create_table :stage_stage_images do |t|
      t.integer :stage_id
      t.integer :stage_image_id

      t.timestamps
    end
  end
end
