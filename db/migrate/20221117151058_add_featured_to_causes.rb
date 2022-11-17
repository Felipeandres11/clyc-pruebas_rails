class AddFeaturedToCauses < ActiveRecord::Migration[6.1]
  def change
    add_column :causes, :featured, :boolean, default: true
  end
end
