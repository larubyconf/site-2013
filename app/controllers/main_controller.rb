class MainController < ApplicationController
  def index
    @sponsors = Sponsor.order('level asc, sponsored_at asc')
  end
end
