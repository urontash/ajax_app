class ApplicationController < ActionController::Base
  before_action :basic_auth
  
  private
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == 'admin' && password =='2222'
      # 環境変数を読み込む設定へ変更
      # binding.pry
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
