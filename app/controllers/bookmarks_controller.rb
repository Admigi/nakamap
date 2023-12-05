class BookmarksController < ApplicationController
    before_action :authenticate_user!
  
    def create
        @challenge = Challenge.find(params[:challenge_id])
        current_user.bookmarks.create(challenge: @challenge)
        redirect_to challenges_path, notice: 'Challenge bookmarked!'
      end
    end