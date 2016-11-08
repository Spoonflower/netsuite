module NetSuite
  module Records
    class CustomRecordCustomField
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::SetupCustom
      
      #actions :add, :add_list, :delete, :delete_list, :get, :get_list, :get_select_value, :update, :update_list, :upsert, :upsert_list
      actions :add, :update, :get
      
      fields :check_spelling, :default_checked, :default_value, :description, :display_height, :display_width, :global_search, :help, 
             :is_formula, :is_mandatory, :is_parent, :label, :link_text, :max_length, :max_value, :min_value, :role_restrict, 
             :show_in_list, :store_value, :script_id, :field_type, :rec_type

      record_refs :default_selection, :insert_before, :owner, :parent_subtab, :search_compare_field, :search_default, :select_record_type, 
             :sourcefilterby, :source_from, :source_list, :subtab
             
      # accessLevel 	CustomizationAccessLevel	
      # deptAccessList 	CustomFieldDepartmentAccessList		
      # displayType 	CustomizationDisplayType
      # dynamicDefault 	CustomizationDynamicDefault		
      # filterList 	CustomRecordCustomFieldFilterList			
      # roleAccessList 	CustomFieldRoleAccessList			
      # searchLevel 	CustomizationSearchLevel
      # subAccessList 	CustomFieldSubAccessList
      # translationsList 	CustomFieldTranslationsList

      attr_reader :internal_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        initialize_from_attributes_hash(attributes)
      end
      
    end
  end
end
