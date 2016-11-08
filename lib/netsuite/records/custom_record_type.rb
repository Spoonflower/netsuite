module NetSuite
  module Records
    class CustomRecordType
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::SetupCustom

      actions :get, :get_list, :add, :delete, :update

      fields :allow_attachments, :allow_inline_editing, :allow_numbering_override, :allow_quick_search, :description,
        :disclaimer, :enable_dle, :enable_mail_merge, :enable_name_translation, :enable_numbering, :hierarchical, :include_name, :is_available_offline, :is_inactive,
        :is_numbering_updateable, :is_ordered, :numbering_current_number, :numbering_init, :numbering_min_digits,
        :numbering_prefix, :numbering_suffix, :record_name, :script_id, :show_creation_date, :show_creation_date_on_list,
        :show_id, :show_last_modified, :show_last_modified_on_list, :show_notes, :show_owner, :show_owner_allow_change,
        :show_owner_on_list, :use_permissions

      # accessType 	CustomRecordTypeAccessType 
      # childrenList 	CustomRecordTypeChildrenList
      field :custom_field_list, 	CustomRecordTypeFieldList		
      # formsList 	CustomRecordTypeFormsList 
      # linksList 	CustomRecordTypeLinksList
      # managersList 	CustomRecordTypeManagersList 
      # onlineFormsList 	CustomRecordTypeOnlineFormsList	
      # parentsList 	CustomRecordTypeParentsList
      # permissionsList 	CustomRecordTypePermissionsList		
      # sublistsList 	CustomRecordTypeSublistsList
      # tabsList 	CustomRecordTypeTabsList		
      # translationsList 	CustomRecordTypeTranslationsList

      record_ref :owner

      attr_reader :internal_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        initialize_from_attributes_hash(attributes)
      end

    end
  end
end
