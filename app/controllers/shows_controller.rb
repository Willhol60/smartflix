# frozen_string_literal: true

class ShowsController < ApplicationController
    def index
        @shows = Show.order('starred DESC').take(params[:limit]&.to_i || 10)
    end
end
