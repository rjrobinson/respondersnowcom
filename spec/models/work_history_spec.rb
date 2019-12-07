# frozen_string_literal: true

require 'rails_helper'

describe WorkHistory do
  describe 'validations' do
    it { should belong_to(:user) }
    it { should belong_to(:agency) }
  end

  context 'should print pretty dates' do
    let(:work_history) { create(:work_history) }

    describe '#pretty_start' do
      it 'should print pretty' do
        expect(work_history.pretty_start).to be_truthy
      end
    end

    describe '#pretty_start' do

      it 'should print pretty' do
        expect(work_history.pretty_end).to be_truthy
      end
    end
  end

end
