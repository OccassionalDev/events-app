class RemoveEndDateFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :end_date
  end
end
