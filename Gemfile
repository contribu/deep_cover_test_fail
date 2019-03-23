# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# gem 'deep-cover', '~> 0.7', require: false
gem 'deep-cover', github: 'deep-cover/deep-cover', ref: 'd7aba4fa956d226d582b1f2cc126d50b10be3503', require: false
gem 'rspec'
