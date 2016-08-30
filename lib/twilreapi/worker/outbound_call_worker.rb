class Twilreapi::Worker::OutboundCallWorker
  require 'drb'

  def perform(payload)
    drb_client.initiate_outbound_call!(payload)
  end

  private

  def drb_client
    raise("No DRB URL specified") if !drb_url
    @drb_client ||= DRbObject.new_with_uri(drb_url)
  end

  def drb_url
    ENV["TWILREAPI_WORKER_OUTBOUND_CALL_WORKER_DRB_URL"]
  end
end
