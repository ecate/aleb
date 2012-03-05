# -*- coding: utf-8 -*-
module ApplicationHelper
     #affichage des secondes sous format humain xhxx
        def humanize(s)
          h = s / 3600
          s -= h * 3600
          m = s / 60
          [h, m].join("h")
        end




end
