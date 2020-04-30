# frozen_string_literal: true

require 'bundler/setup'
require 'yaml'
require 'private_pub'
require 'rack/multipart/parser'
require 'faye'

Faye::WebSocket.load_adapter('thin')

PrivatePub.load_config(File.expand_path('private_pub.yml', __dir__),
                       ENV['RACK_ENV'] || 'development')

run PrivatePub.faye_app
