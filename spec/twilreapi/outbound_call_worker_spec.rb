require 'spec_helper'

describe(Twilreapi::Sidekiq.const_get(ENV["TWILREAPI_SIDEKIQ_OUTBOUND_CALL_WORKER_CLASS"] || "OutboundCallWorker")) do
  describe "#perform(payload)" do
    let(:payload) { "some payload" }
    let(:call_id) { 1234 }
    let(:drb_object) { double(DRb::DRbObject, :initiate_outbound_call! => call_id) }

    def stub_drb_object!
      allow(DRbObject).to receive(:new_with_uri).and_return(drb_object)
    end

    def setup_scenario
      stub_drb_object!
    end

    def assert_call_initiated!
      expect(DRbObject).to receive(:new_with_uri).with(ENV["TWILREAPI_SIDEKIQ_OUTBOUND_CALL_WORKER_DRB_URL"])
      expect(drb_object).to receive(:initiate_outbound_call!).with(payload)
      subject.perform(payload)
    end

    before do
      setup_scenario
    end

    it { assert_call_initiated! }
  end
end

