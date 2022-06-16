class RemovePaymentMethodFromSpendings < ActiveRecord::Migration[5.2]
  def change
    remove_column :spendings, :payment_method, :integer
  end
end
