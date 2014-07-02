class CreateStageImages < ActiveRecord::Migration
  def change
    create_table :stage_images do |t|
      t.string :title
      t.attachment :image

      t.timestamps
    end
  end
end
