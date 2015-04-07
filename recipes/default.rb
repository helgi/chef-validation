#
# Cookbook Name:: validation
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright (c) 2014 Jamie Winsor
#

chef_gem "chef-validation" do
  version Chef::Validation.cookbook_version(node)
  options "--ignore-dependencies --local #{File.expand_path(File.dirname(__FILE__) + '/../')}"
  action :nothing
end.run_action(:install)

require "chef-validation"
