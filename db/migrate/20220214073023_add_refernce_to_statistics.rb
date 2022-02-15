class AddRefernceToStatistics < ActiveRecord::Migration[6.1]
  def change
    add_reference :statistics, :kid, index: true
  end
end
