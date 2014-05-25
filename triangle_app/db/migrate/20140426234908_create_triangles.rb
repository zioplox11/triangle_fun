class CreateTriangles < ActiveRecord::Migration
  def change
    create_table :triangles do |t|
          t.text :body
          t.integer :final_sum
          t.timestamps
    end
  end
  end
