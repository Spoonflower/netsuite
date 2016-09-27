require 'spec_helper'

describe NetSuite::Records::InventoryAdjustmentInventory do
  let(:inventory_adjustment_inventory) { NetSuite::Records::InventoryAdjustmentInventory.new }
  
  it 'has all the right attributes' do
    [
      :adjust_qty_by, :bin_numbers, :currency, :current_value,
      :description, :exchange_rate, :expiration_date, :foreign_currency_unit_cost,
      :line, :memo, :new_quantity, :quantity_on_hand, :serial_numbers, :unit_cost
    ].each do |field|
      expect(inventory_adjustment_inventory).to have_field(field)
    end
  end

  it 'has all the right record refs' do
    [
      :item, :location, :units
    ].each do |record_ref|
      expect(inventory_adjustment_inventory).to have_record_ref(record_ref)
    end
  end
  
  describe '#inventory_detail' do
    it 'can be set from attributes'
  end

  describe '#custom_field_list' do
    it 'can be set from attributes'
    it 'can be set from a CustomFieldList object'
  end

end
