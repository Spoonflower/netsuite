module NetSuite
  module Records
    class InventoryAdjustmentInventory
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Namespaces::TranInvt

      fields :adjust_qty_by, :bin_numbers, :currency, :current_value,
             :description, :exchange_rate, :expiration_date, :foreign_currency_unit_cost,
             :line, :memo, :new_quantity, :quantity_on_hand, :serial_numbers, :unit_cost
             
      field :options, CustomFieldList
      field :custom_field_list, CustomFieldList
      field :inventory_detail, InventoryDetail

      record_refs :item, :location, :units

      def initialize(attributes = {})
        initialize_from_attributes_hash(attributes)
      end
    end
  end
end
