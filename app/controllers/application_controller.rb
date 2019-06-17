class ApplicationController < ActionController::Base
    # 全コントローラー共通の処理を記述できる

    protect_from_forgery with: :exception
    include SessionsHelper

end
