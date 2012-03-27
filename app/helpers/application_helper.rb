# -*- coding: utf-8 -*-
module ApplicationHelper

     #module syllabus
     #affichage des secondes sous format humain xhxx
        def humanize(s)
          return "0h" if s.class == NilClass
          h = s / 3600
          s -= h * 3600
          m = s / 60
          if m==0
            return h.to_s << "h"
          end
          [h, m].join("h")
        end

        def semicolonize(s)
          return "00:00" if s.class == NilClass
          h = s / 3600
          s -= h * 3600
          m = s / 60
          if m==0
            return h.to_s << "h"
          end
          [h, m].join(":")
        end

        def duree (string, id)
        if string.empty?
          return Syllabus.find_by_id(id).duree
        else

        end
        end

end
