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

      def initialize(attributes_or_record = {})
        case attributes_or_record
        when Hash
          initialize_from_attributes_hash(attributes_or_record)
        when self.class
          initialize_from_record(attributes_or_record)
        end
      end

      def initialize_from_record(record)
        self.attributes = record.send(:attributes)
      end

      def to_record
        rec = super
        if rec["#{record_namespace}:customFieldList"]
          rec["#{record_namespace}:customFieldList!"] = rec.delete("#{record_namespace}:customFieldList")
        end
        rec
      end
    end
  end
end
