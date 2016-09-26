require 'spec_helper'

describe NetSuite::Records::InventoryNumber do
  let(:inventory_number) { NetSuite::Records::InventoryNumber.new }
  
  it 'has all the right read_only_fields' do
    [
      :inventory_number, :status, :units
    ].each do |field|
      expect(NetSuite::Records::InventoryNumber).to have_read_only_field(field)
    end
  end
  
  it 'has all the right attributes' do
    [
      :memo, :expiration_date
    ].each do |field|
      expect(inventory_number).to have_field(field)
    end
  end

  it 'has all the right record refs' do
    [
      :item
    ].each do |record_ref|
      expect(inventory_number).to have_record_ref(record_ref)
    end
  end

  describe '#location_list' do
    it 'can be set from attributes'
    it 'can be set from a ClassTranslationList object'
  end

  describe '#custom_field_list' do
    it 'can be set from attributes'
    it 'can be set from a CustomFieldList object'
  end

  describe '.get' do
    context 'when the response is successful' do
      let(:response) { NetSuite::Response.new(:success => true, :body => { :memo => 'This is a test' }) }

      it 'returns a inventory_number instance populated with the data from the response object' do
        expect(NetSuite::Actions::Get).to receive(:call).with([NetSuite::Records::InventoryNumber, {:external_id => 1}], {}).and_return(response)
        inventory_number = NetSuite::Records::InventoryNumber.get(:external_id => 1)
        expect(inventory_number).to be_kind_of(NetSuite::Records::InventoryNumber)
        expect(inventory_number.memo).to eql('This is a test')
      end
    end

    context 'when the response is unsuccessful' do
      let(:response) { NetSuite::Response.new(:success => false, :body => {}) }

      it 'raises a RecordNotFound exception' do
        expect(NetSuite::Actions::Get).to receive(:call).with([NetSuite::Records::InventoryNumber, {:external_id => 1}], {}).and_return(response)
        expect {
          NetSuite::Records::InventoryNumber.get(:external_id => 1)
        }.to raise_error(NetSuite::RecordNotFound,
          /NetSuite::Records::InventoryNumber with OPTIONS=(.*) could not be found/)
      end
    end
  end

end
