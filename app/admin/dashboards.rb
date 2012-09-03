# -*- coding: utf-8 -*-
ActiveAdmin::Dashboards.build do



  section "Organisateurs récemment créés", :priority => 1 do
      table_for Organisateur.order('updated_at DESC').limit(5) do
        column("Organisateur") { |organisateur| link_to(organisateur.name, admin_organisateur_path(organisateur))}
        column("Avatar") {|organisateur| link_to(image_tag(organisateur.avatar.thumb.url), admin_organisateur_path(organisateur)) }
      end
  end

  section "Cours récemment créés", :priority => 2 do
    table_for Syllabus.order('updated_at DESC').limit(5).each do
      column("Cours") {|cours| link_to(cours.name, admin_syllabus_path(cours))}
      column("avatar") {|cours| link_to(image_tag(cours.avatar.thumb.url), admin_syllabus_path(cours)) }

      end
    end

end
