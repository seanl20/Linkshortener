class LinksController < ApplicationController
  def create
    shortener = Shortener.new(link_params[:original_url])

    result = shortener.generate_short_link

    case result
    in Success(link:)
      @link = link
    in Failure(:invalid)
      render json: { error: "Unable to create Link shortener" }, status: 400
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
