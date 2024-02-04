# frozen_string_literal: true

class Demo::IndexView < ApplicationView
  include Phlex::Icons::Helper[:heroicons]

  def template
    h1 { "Demo" }

    # render Icon("cake", library: :heroicons, class: "icon")

    render Icon("cake", library: :heroicons, class: "icon")
    render Phlex::Icons::Icon.new("cake", library: :heroicons, class: "icon")
    render Phlex::Icons::Icon.new("cake", library: :heroicons, variant: "outline", class: "icon")
    render Phlex::Icons::Icon.new("cake", library: :heroicons, variant: "solid", class: "icon")
  end
end
