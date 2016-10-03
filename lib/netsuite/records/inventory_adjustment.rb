module NetSuite
  module Records
    class InventoryAdjustment
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::TranInvt

      actions :get, :add, :update, :upsert, :delete, :search

      # https://system.netsuite.com/help/helpcenter/en_US/srbrowser/Browser2014_1/schema/record/inventoryadjustment.html
      
      fields :created_date, :last_modified_date, :memo, :tran_date, :tran_id 

      field :custom_field_list, CustomFieldList
      field :inventory_list, InventoryAdjustmentInventoryList

      # TODO from standard copied item record
      # field :accounting_book_detail_list,  AccountingBookDetailList
      
      read_only_fields :estimated_total_value

      record_refs :account, :adj_location, :customer, :custom_form, :department, :klass, :location,
        :posting_period, :subsidiary

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
