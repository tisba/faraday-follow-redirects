# frozen_string_literal: true

RSpec.describe Faraday::FollowRedirects::Middleware do
  it 'redirects on 301' do
    stub_request(:get, 'http://www.site-a.com/').to_return(
      status: 301,
      headers: { 'Location' => 'https://www.site-b.com/' }
    )
    stub_request(:get, 'https://www.site-b.com/')

    connection = Faraday.new do |conn|
      conn.use described_class
      conn.adapter Faraday.default_adapter
    end

    response = connection.get 'http://www.site-a.com'
    expect(response.env[:url].to_s).to eq('https://www.site-b.com/')
  end

  it 'redirects on 302' do
    stub_request(:get, 'http://www.site-a.com/').to_return(
      status: 302,
      headers: { 'Location' => 'https://www.site-b.com/' }
    )
    stub_request(:get, 'https://www.site-b.com/')

    connection = Faraday.new do |conn|
      conn.use described_class
      conn.adapter Faraday.default_adapter
    end

    response = connection.get 'http://www.site-a.com'
    expect(response.env[:url].to_s).to eq('https://www.site-b.com/')
  end

  it 'redirects on 303' do
    stub_request(:get, 'http://www.site-a.com/').to_return(
      status: 303,
      headers: { 'Location' => 'https://www.site-b.com/' }
    )
    stub_request(:get, 'https://www.site-b.com/')

    connection = Faraday.new do |conn|
      conn.use described_class
      conn.adapter Faraday.default_adapter
    end

    response = connection.get 'http://www.site-a.com'
    expect(response.env[:url].to_s).to eq('https://www.site-b.com/')
  end

  it 'redirects on 307' do
    stub_request(:get, 'http://www.site-a.com/').to_return(
      status: 307,
      headers: { 'Location' => 'https://www.site-b.com/' }
    )
    stub_request(:get, 'https://www.site-b.com/')

    connection = Faraday.new do |conn|
      conn.use described_class
      conn.adapter Faraday.default_adapter
    end

    response = connection.get 'http://www.site-a.com'
    expect(response.env[:url].to_s).to eq('https://www.site-b.com/')
  end

  it 'redirects on 308' do
    stub_request(:get, 'http://www.site-a.com/').to_return(
      status: 308,
      headers: { 'Location' => 'https://www.site-b.com/' }
    )
    stub_request(:get, 'https://www.site-b.com/')

    connection = Faraday.new do |conn|
      conn.use described_class
      conn.adapter Faraday.default_adapter
    end

    response = connection.get 'http://www.site-a.com'
    expect(response.env[:url].to_s).to eq('https://www.site-b.com/')
  end

  describe 'usage via alias' do
    it 'redirects on 301' do
      stub_request(:get, 'http://www.site-a.com/').to_return(
        status: 301,
        headers: { 'Location' => 'https://www.site-b.com/' }
      )
      stub_request(:get, 'https://www.site-b.com/')

      connection = Faraday.new do |conn|
        conn.response :follow_redirects
        conn.adapter Faraday.default_adapter
      end

      response = connection.get 'http://www.site-a.com'
      expect(response.env[:url].to_s).to eq('https://www.site-b.com/')
    end
  end
end
