module NetSuite
  module Records
    class CustomRecordTypeFieldList < Support::Sublist
      include Support::Records
      include Namespaces::SetupCustom

      fields :replace_all

      sublist :custom_field, CustomRecordCustomField

    end
  end
end
