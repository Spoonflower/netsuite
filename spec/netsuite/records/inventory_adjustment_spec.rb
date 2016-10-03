require 'spec_helper'

describe NetSuite::Records::InventoryAdjustment do
  let(:inventory_adjustment) { NetSuite::Records::InventoryAdjustment.new }
  
  it 'has all the right read_only_fields' do
    [
      :estimated_total_value
    ].each do |field|
      expect(NetSuite::Records::InventoryAdjustment).to have_read_only_field(field)
    end
  end
  
  it 'has all the right attributes' do
    [
      :created_date, :last_modified_date, :memo, :tran_date, :tran_id 
    ].each do |field|
      expect(inventory_adjustment).to have_field(field)
    end
  end

  it 'has all the right record refs' do
    [
      :account, :adj_location, :customer, :custom_form, :department, :klass, :location,
        :posting_period, :subsidiary
    ].each do |record_ref|
      expect(inventory_adjustment).to have_record_ref(record_ref)
    end
  end

  describe '#custom_field_list' do
    it 'can be set from attributes'
    it 'can be set from a CustomFieldList object'
  end

  describe '.get' do
    context 'when the response is successful' do
      let(:response) { NetSuite::Response.new(:success => true, :body => { :memo => 'This is a test' }) }

      it 'returns a inventory_adjustment instance populated with the data from the response object' do
        expect(NetSuite::Actions::Get).to receive(:call).with([NetSuite::Records::InventoryAdjustment, {:external_id => 1}], {}).and_return(response)
        inventory_adjustment = NetSuite::Records::InventoryAdjustment.get(:external_id => 1)
        expect(inventory_adjustment).to be_kind_of(NetSuite::Records::InventoryAdjustment)
        expect(inventory_adjustment.memo).to eql('This is a test')
      end
    end

    context 'when the response is unsuccessful' do
      let(:response) { NetSuite::Response.new(:success => false, :body => {}) }

      it 'raises a RecordNotFound exception' do
        expect(NetSuite::Actions::Get).to receive(:call).with([NetSuite::Records::InventoryAdjustment, {:external_id => 1}], {}).and_return(response)
        expect {
          NetSuite::Records::InventoryAdjustment.get(:external_id => 1)
        }.to raise_error(NetSuite::RecordNotFound,
          /NetSuite::Records::InventoryAdjustment with OPTIONS=(.*) could not be found/)
      end
    end
  end

end
