#
# Cookbook Name:: validation
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright (c) 2014 Jamie Winsor
#

#chef_gem "chef-validation" do
#  version Chef::Validation.cookbook_version(node)
#  options "--ignore-dependencies"
#  action :nothing
#end.run_action(:install)

gem_version = Chef::Validation.cookbook_version(node)
gem_file = "chef-validation-#{gem_version}.gem"

cookbook_file "/tmp/#{gem_file}" do
  source gem_file
  action :nothing
end.run_action(:create_if_missing)

chef_gem "chef-validation" do
  version gem_version
  source "/tmp/#{gem_file}"
  options "--ignore-dependencies"
  compile_time false if respond_to?(:compile_time)
  action :nothing
end.run_action(:install)

require "chef-validation"
