# -*- coding: utf-8 -*-
module ApplicationHelper
     #affichage des secondes sous format humain xhxx
        def humanize(s)
          h = s / 3600
          s -= h * 3600
          m = s / 60
          if m==0
            return h.to_s << "h"
          end
          [h, m].join("h")
        end


end
