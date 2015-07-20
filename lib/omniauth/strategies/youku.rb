# -*- encoding: utf-8 -*-
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Youku < OmniAuth::Strategies::OAuth2
      option :name, 'youku'
      option :client_options, {
                 site: "https://openapi.youku.com", # 第二版
        authorize_url: "/v2/oauth2/authorize",
            token_url: "/v2/oauth2/token"
      }
      option :token_params, {
        :parse => :json
      }

      uid do
        raw_info['id']
      end

      info do
        {
             nickname: raw_info['name'],
                 name: raw_info['name'],
             location: '',
                image: raw_info['avatar_large'],
          description: raw_info['description'],
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/v2/users/myinfo.json', params: signed_params).parsed
      end

      ##
      # You can pass +display+, +with_offical_account+ or +state+ params to the auth request, if
      # you need to set them dynamically. You can also set these options
      # in the OmniAuth config :authorize_params option.
      #
      def authorize_params
        # super.tap do |params|
        #   %w[ state ].each do |v|
        #     if request.params[v]
        #       params[v.to_sym] = request.params[v]

        #       # to support omniauth-oauth2's auto csrf protection
        #       session['omniauth.state'] = params[:state] if v == 'state'
        #     end
        #   end
        # end
        super
      end

      private
      
      def signed_params
        {
          client_id: client.id,
          access_token: access_token.token
        }
      end
    end
  end
end

OmniAuth.config.add_camelization "youku", "Youku"
