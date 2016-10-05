module NetSuite
  module Records
    class LotNumberedInventoryItem
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::ListAcct

      actions :get, :get_list, :add, :delete, :search, :update, :upsert
      
      fields :available_to_partners,:backward_consumption_days,:cost,:cost_units,:default_return_cost,:demand_modifier,:demand_time_fence,:display_name,:dont_show_price,
      :enforce_min_qty_internally,:exclude_from_sitemap,:expiration_date,:featured_description,:fixed_lot_size,:forward_consumption_days,:hazmat_hazard_class,:hazmat_id,:hazmat_item_units,
      :hazmat_item_units_qty,:hazmat_shipping_name,:include_children,:invt_count_interval,:is_drop_ship_item,:is_gco_compliant,:is_hazmat_item,:is_inactive,:is_online,
      :is_special_order_item,:item_id,:lead_time,:manufacturer,:manufacturer_addr1,:manufacturer_city,:manufacturer_state,:manufacturer_tariff,:manufacturer_tax_id,:manufacturer_zip,
      :match_bill_to_receipt,:max_donation_amount,:meta_tag_html,:minimum_quantity,:minimum_quantity_units,:mpn,:mult_manufacture_addr,:nex_tag_category,:no_price_message,
      :offer_support,:on_hand_value_mli,:on_special,:out_of_stock_message,:page_title,:periodic_lot_size_days,:preferred_stock_level,:preferred_stock_level_days,:preferred_stock_level_units,
      :prices_include_tax,:producer,:purchase_description,:purchase_order_amount,:purchase_order_quantity,:purchase_order_quantity_diff,:quantity_on_hand,:quantity_on_hand_units,
      :rate,:receipt_amount,:receipt_quantity,:receipt_quantity_diff,:related_items_description,:reorder_multiple,:reorder_point,:reorder_point_units,:reschedule_in_days,
      :reschedule_out_days,:round_up_as_component,:safety_stock_level,:safety_stock_level_days,:safety_stock_level_units,:schedule_b_number,:schedule_b_quantity,
      :search_keywords,:seasonal_demand,:serial_numbers,:ship_individually,:shipping_cost,:shipping_cost_units,:shopping_dot_com_category,:shopzilla_category_id,:show_default_donation_amount,
      :specials_description,:stock_description,:store_description,:store_detailed_description,:store_display_name,:supply_time_fence,:total_value,:track_landed_cost,
      :transfer_price,:upc_code,:url_component,:use_bins,:use_marginal_rates,:vendor_name,:vsoe_delivered,:vsoe_price,:weight,:weight_units

      read_only_fields :auto_lead_time, :auto_preferred_stock_level,:auto_reorder_point,:average_cost,:copy_description,:cost_estimate,:costing_method_display,:created_date,
      :currency,:handling_cost,:handling_cost_units,:is_taxable,:last_invt_count_date,:last_modified_date,:last_purchase_price,:next_invt_count_date,:quantity_available,
      :quantity_back_ordered,:quantity_committed,:quantity_on_order,:quantity_reorder_units


      record_refs :alternate_demand_source_item, :asset_account,:bill_exch_rate_variance_acct,:billing_schedule,:bill_price_variance_acct,
      :bill_qty_variance_acct,:klass,:cogs_account,:cost_category,:custom_form,:default_item_ship_method,:deferred_revenue_account,
      :demand_source,:department,:dropship_expense_account,:gain_loss_account,:income_account,:interco_cogs_account,:interco_income_account,
      :issue_product,:item_revenue_category,:location,:parent,:preferred_location,:pricing_group,:purchase_price_variance_acct,
      :purchase_tax_code,:purchase_unit,:quantity_pricing_schedule,:quantity_pricing_schedule,:revenue_allocation_group,:revenue_recognition_rule,
      :rev_rec_schedule,:sales_tax_code,:sale_unit,:ship_package,:soft_descriptor,:stock_unit,:store_display_image,:store_display_thumbnail,
      :store_item_template,:supply_lot_sizing_method,:supply_replenishment_method,:supply_type,:tax_schedule, :units_type, :vendor


      #field :accounting_book_detail_list, ItemAccountingBookDetailList
      #field :bin_number_list, InventoryItemBinNumberList	
      field :custom_field_list, CustomFieldList
      #field :item_number_options_list, RecordRefList
      #field :item_options_list, RecordRefList
      #field :item_ship_method_list, RecordRefList
      #field :item_vendor_list, ItemVendorList
      #field :locations_list, LotNumberedInventoryItemLocationsList
      #field :matrix_option_list, MatrixOptionList	
      #field :numbers_list, LotNumberedInventoryItemNumbersList
      #field :presentation_item_list, PresentationItemList
      #field :product_feed_list, ProductFeedList	
      #field :site_category_list, SiteCategoryList
      field :subsidiary_list, RecordRefList
      #field :translations_list, TranslationList

      #
      #:cost_estimate_type, ItemCostEstimateType
      #:costing_method, ItemCostingMethod
      #:country_of_manufacture, Country
      #:create_revenue_plans_on, ItemCreateRevenuePlansOn
      #:hazmat_packing_group, HazmatPackingGroup
      #:invt_classification ,ItemInvtClassificatio
      #:item_carrier,ShippingCarrier
      #:matrix_type,ItemMatrixType
      #:out_of_stock_behavior,ItemOutOfStockBehavior
      #:overall_quantity_pricing_type,ItemOverallQuantityPricingType
      #:periodic_lot_size_type,PeriodicLotSizeType
      #:preference_criterion,ItemPreferenceCriterion
      #:pricing_matrix,PricingMatrix
      #:schedule_b_code,ScheduleBCode
      #:sitemap_priority,SitemapPriority
      #:vsoe_deferral, VsoeDeferral
      #:vsoe_permit_discount, VsoePermitDiscount
      #:vsoe_sop_group, VsoeSopGroup
      #:weight_unit, ItemWeightUnit


      attr_reader :internal_id
      attr_accessor :external_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

      def self.search_class_name
        "Item"
      end
    end
  end
end
