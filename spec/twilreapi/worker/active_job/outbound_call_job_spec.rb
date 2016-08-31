require 'spec_helper'
require 'active_job'
require 'twilreapi/worker/active_job/outbound_call_job'

describe Twilreapi::Worker::ActiveJob::OutboundCallJob do
  describe "#perform(*args)" do
    let(:args) { ["1", "2", "3"] }
    let(:outbound_call_job) { double(Twilreapi::Worker::Job::OutboundCallJob) }

    def assert_active_job_performed!
      allow(Twilreapi::Worker::Job::OutboundCallJob).to receive(:new).and_return(outbound_call_job)
      expect(outbound_call_job).to receive(:perform).with(*args)
      subject.perform(*args)
    end

    it { assert_active_job_performed! }
  end
end
