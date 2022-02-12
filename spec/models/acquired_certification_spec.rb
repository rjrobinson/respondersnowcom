# frozen_string_literal: true

require "rails_helper"

RSpec.describe AcquiredCertification, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:certification) }
  end

  describe "validations" do
  end

  context "rendering the proper images" do
    let(:acquire_certification) { create(:acquired_certification) }

    describe "#cert_logo" do
      #  todo File uploads are breaking at this point.

      context "if the file is stored locally" do
        it "returns the local file path" do
          expect(acquire_certification.cert_logo).to eq "patches/nj-emt.png"
        end
      end

      context "if the file is stored remotely" do
        it "should return the remote file path"
      end

      context "if the file not stored locally or remotely" do
        before(:each) do
          allow(FileTest).to receive(:exist?).and_return(nil)
        end

        it "returns the default" do
          expect(acquire_certification.cert_logo).to eq "defaults/ems.png"
        end
      end
    end

    describe "#patch_image_name" do
      context "when looking for a patch in the folder" do
        it "returns the proper string" do
          expect(acquire_certification.patch_image_name).to eq "patches/njemt"
        end
      end
    end
  end
end
