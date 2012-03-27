# coding: utf-8
class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document

  private

  # Renders the content for the footer
  def build_footer
    div :id => "footer" do
      para "Copyright &copy; #{Date.today.year.to_s} #{link_to("A l'école buissonière", 'http://www.alecolebuissoniere.com')}. Propulsé par #{link_to('Active Admin', 'http://www.activeadmin.info')} #{ActiveAdmin::VERSION}".html_safe
    end
  end

end