# frozen_string_literal: true

require_relative '../lib/ng_class'

describe NgClass do
  describe 'my_class_method' do
    describe 'specify x' do
      it 'returns x' do
        expect(NgClass.my_class_method(x: 1)).to eq(1)
      end
    end

    describe 'not specify x' do
      it 'returns 0' do
        expect(NgClass.my_class_method).to eq(0)
      end
    end
  end
end
