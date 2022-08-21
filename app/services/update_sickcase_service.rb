class UpdateSickcaseService
  def initialize(sickcase, params)
    @sickcase = sickcase
    @params = params
  end

  def call
    if @params[:image] && !file?(@params[:image])
      delete_image if @sickcase.image.attached?
      @params.delete(:image)
    end

    @sickcase.update(@params)
  end

  private

  def file?(param)
    param.is_a?(ActionDispatch::Http::UploadedFile)
  end

  def delete_image
    @sickcase.image.purge
  end
end
