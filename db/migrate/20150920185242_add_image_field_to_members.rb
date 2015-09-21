class AddImageFieldToMembers < ActiveRecord::Migration
  def change
  	add_column	:members,	:image_path,	:string
  end
end
