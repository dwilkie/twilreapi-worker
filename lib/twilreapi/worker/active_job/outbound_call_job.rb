require_relative "../job/outbound_call_job"

class Twilreapi::Worker::ActiveJob::OutboundCallJob < ActiveJob::Base
  def perform(*args)
    ::Twilreapi::Worker::Job::OutboundCallJob.new.perform(*args)
  end
end
