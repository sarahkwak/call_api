class CallsController < ActionController::Base
  class RestAPI
    attr_accessor :auth_id, :auth_token, :url, :version, :api, :headers, :rest

    def initialize(url="https://api.plivo.com", version="v1")
      p "IS THIS INITIALIZED???"
        @auth_id = 'MAYTQ0NJI2MZNMZTZHYM'
        @auth_token = 'NThlYWY1MTE5MzA1ZTA5YzA4NmUyZTJiM2FlNmM0'
        @url = url.chomp('/')
        @version = version
        @api = @url + '/' + @version + '/Account/' + @auth_id
        @headers = {"User-Agent" => "RubyPlivo"}
        @rest = RestClient::Resource.new(@api, @auth_id, @auth_token)
    end

    def hash_to_params(myhash)
        return myhash.map { |k, v| "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}" }.join("&")
    end

    def request(method, path, params=nil)
        if method == "POST"
            if not params
                params = {}
            end
            begin
                r = @rest[path].post params.to_json, :content_type => 'application/json'
            rescue => e
                response = e
            end
            if not response
                code = r.code
                raw = r.to_str
                response = JSON.parse(raw)
            else
              p response
                code = response.http_code
                response = JSON.parse(response.response.to_s)
            end
            return [code, response]
        elsif method == "GET"
            if params
                path = path + '?' + hash_to_params(params)
            end

            begin
                r = @rest[path].get
            rescue => e
                response = e
            end
            if not response
                code = r.code
                raw = r.to_str
                response = JSON.parse(raw)
            else
                code = response.http_code
                response = JSON.parse(response.response.to_s)
            end
            return [code, response]
        elsif method == "DELETE"
            if params
                path = path + '?' + hash_to_params(params)
            end
            begin
                r = @rest[path].delete
            rescue => e
                response = e
            end
            if not response
                code = r.code
            else
                code = response.http_code
                response = JSON.parse(response.response.to_s)
            end
            return [code, ""]
        end
        return [405, 'Method Not Supported']
    end
    def make_call(params={})
      p "MAKE_CALL FUNCTION THIS IS NOT MAKECALL"
      return request('POST', "/Call/", params)
    end
  end
  AUTH_ID = 'MAYTQ0NJI2MZNMZTZHYM'
  AUTH_TOKEN = 'NThlYWY1MTE5MzA1ZTA5YzA4NmUyZTJiM2FlNmM0'
  def makecall
    p "IM inside of MAKECALL FUNCTION"
    p = RestAPI.new(AUTH_ID, AUTH_TOKEN)
    p "IS RESTAPI INITIALIZED? LET's FITURE OUT"
    params = {
        'to' => '16509245485', # The phone number to which the call has to be placed
        'from' => '16503819918', # The phone number to be used as the caller id
        'answer_url' => 'https://s3.amazonaws.com/plivosamplexml/conference_url.xml', # The URL invoked by Plivo when the outbound call is answered
        'answer_method' => 'GET' # The method used to call the answer_url
    }
    p "RESPONSE MIGHT BE AN ISSUE"
    # Make an outbound call
    response = p.make_call(params)
    p response
    p "hello world!!!!!"
  end
end

