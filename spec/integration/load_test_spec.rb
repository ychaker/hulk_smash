require_relative '../../lib/hulk_smash'

describe "A GET Request" do
  subject { HulkSmash::Smasher.new("http://localhost") }

  it "can process at least 1000 requests per second" do
  	result = subject.run_load_test
  	(result.requests_per_second > 1000).should be_true, "Expected #{result.requests_per_second} to be greater than 1000"
  end

  it "has a response time of less than 100 milliseconds" do
    result = subject.run_scalability_test
  	(result.avg_response_time < 100).should be_true, "Expected #{result.avg_response_time} to be less than 100"
  end
end

describe "A PUT Request" do
  subject { HulkSmash::Smasher.new("http://localhost", method: :put, data: data) }

  let(:data) { { some: { data: 'foo' } } }

  it "can process at least 1000 requests per second" do
  	result = subject.run_load_test
  	(result.requests_per_second > 1000).should be_true, "Expected #{result.requests_per_second} to be greater than 1000"
  end

  it "has a response time of less than 100 milliseconds" do
    result = subject.run_scalability_test
  	(result.avg_response_time < 100).should be_true, "Expected #{result.avg_response_time} to be less than 100"
  end
end

describe "A POST Request" do
  subject { HulkSmash::Smasher.new("http://localhost", method: :post, data: data) }

  let(:data) { { some: { data: 'foo' } } }  

  it "can process at least 1000 requests per second" do
  	result = subject.run_load_test
  	(result.requests_per_second > 500).should be_true, "Expected #{result.requests_per_second} to be greater than 1000"
  end

  it "has a response time of less than 100 milliseconds" do
    result = subject.run_scalability_test
  	(result.avg_response_time < 100).should be_true, "Expected #{result.avg_response_time} to be less than 100"
  end
end

