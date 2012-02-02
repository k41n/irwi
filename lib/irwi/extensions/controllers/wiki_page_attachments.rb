module Irwi::Extensions::Controllers::WikiPageAttachments

  def add_attachment
    attachment = page_attachment_class.new(params[:wiki_page_attachment])
    attachment.save
    redirect_to url_for(:path => attachment.page.path, :action => :edit, :protocol=>(Rails.env=="production" ? "http://" : "http://"))
  end

  def remove_attachment
    attachment = page_attachment_class.find(params[:attachment_id])
    attachment.destroy
    redirect_to url_for(:path => attachment.page.path, :action => :edit, :protocol => (Rails.env=="production" ? "http://" : "http://"))
  end

  protected

  def page_attachment_class
    Irwi.config.page_attachment_class
  end

end
