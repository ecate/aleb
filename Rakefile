#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# encoding: utf-8
require File.expand_path('../config/application', __FILE__)
require 'rake/dsl_definition'
require 'rake'

module ::Aleb
  class Application
    include Rake::DSL
  end
end

module ::RakeFileUtils
  extend Rake::FileUtilsExt
end

Aleb::Application.load_tasks