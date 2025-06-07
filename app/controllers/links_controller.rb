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

  def show
    link = Links::Queries::GetByLookupCode.new.call(lookup_code: params[:lookup_code])
    redirect_to link.original_url, allow_other_host: true
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
