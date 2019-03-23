# frozen_string_literal: true

require_relative '../lib/ok_class'

describe OkClass do
  describe 'my_class_method' do
    describe 'specify x' do
      it 'returns x' do
        expect(OkClass.my_class_method(x: 1)).to eq(1)
      end
    end

    describe 'not specify x' do
      it 'returns 0' do
        expect(OkClass.my_class_method).to eq(0)
      end
    end
  end
end
