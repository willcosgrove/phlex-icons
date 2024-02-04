# frozen_string_literal: true

class DemoController < ApplicationController
  layout -> { ApplicationLayout }

  def index
    render Demo::IndexView.new
  end
end
