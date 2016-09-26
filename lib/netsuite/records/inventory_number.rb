module NetSuite
  module Records
    class InventoryNumber
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::ListAcct

      actions :get, :search

      # https://system.netsuite.com/help/helpcenter/en_US/srbrowser/Browser2016_1/schema/record/inventorynumber.html

      field :location_list,  LocationsList
      field :custom_field_list, CustomFieldList

      fields :memo, :expiration_date
      
      read_only_fields :inventory_number, :status, :units

      record_refs :item

      attr_reader   :internal_id
      attr_accessor :external_id
      attr_accessor :search_joins

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
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
