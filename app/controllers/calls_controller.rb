class CallsController < ActionController::Base
  AUTH_ID = ENV['AUTH_ID']
  AUTH_TOKEN = ENV['AUTH_TOKEN']
  def makecall
    p = Plivo::RestAPI.new(AUTH_ID, AUTH_TOKEN)
    params = {
          'to' => '16503819918',
          'from' => '16509245485',
          'answer_url' => 'https://s3.amazonaws.com/plivosamplexml/conference_url.xml',
          'answer_method' => 'GET'
          # 'hangup_url' => 'http://example.com/HangupUrl',
    }
    response = p.make_call(params)
  end #makecall
end #CallsController


