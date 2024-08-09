class Admin::BookDashboardsController < ApplicationController
  before_action :authenticate_admin!
    def index
        @books = Book.all
    end

end
