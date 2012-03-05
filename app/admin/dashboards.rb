# -*- coding: utf-8 -*-
ActiveAdmin::Dashboards.build do



  section "Organisateurs récemment créés", :priority => 1 do
      table_for Organisateur.order('id desc').limit(5) do
        column("Organisateur") { |organisateur| link_to(organisateur.name, admin_organisateur_path(organisateur))}
        column("Avatar") {|organisateur| link_to(image_tag(organisateur.avatar.thumb.url), admin_organisateur_path(organisateur)) }
      end
  end

  section "Cours récemment créés", :priority => 2 do
    table_for Syllabus.order('id desc').limit(5).each do
      column("Cours") {|cours| link_to(cours.name, admin_syllabus_path(cours))}
      column("Logo") {|cours| link_to(image_tag(cours.logo.thumb.url), admin_syllabus_path(cours)) }

      end
    end


  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
