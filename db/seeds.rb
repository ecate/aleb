# encoding: utf-8

Label.create!(:name => "Coup de coeur", :remote_avatar_url => "http://dl.dropbox.com/u/6061667/label_coeur.png")
Label.create!(:name => "Deal",:remote_avatar_url =>"http://dl.dropbox.com/u/6061667/label_flash.png")
Label.create!(:name => "A l'école buissonnière", :remote_avatar_url =>"http://dl.dropbox.com/u/6061667/label_star.png")


Categorie.create!(:name => "Cuisine")
Categorie.create!(:name => "Arts")
Categorie.create!(:name => "Sciences humaines")
Categorie.create!(:name => "Loisirs créatifs")
Categorie.create!(:name => "Bien-être")

Organisateur.create!(:name=>"C'est pas sorcier", :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas gravida quam et purus feugiat auctor tincidunt tortor facilisis. Maecenas nec mi velit. Duis mollis lorem at turpis tempus nec vehicula risus placerat. Duis sed ligula id risus iaculis ullamcorper. Nunc eu ante ipsum, in porttitor eros. Integer eget libero nec felis aliquet malesuada eget mollis orci. Donec adipiscing adipiscing congue. Suspendisse potenti. Nam eget dolor ut lorem consequat vestibulum ac vitae metus.Nam tempor aliquet congue. Maecenas sapien mauris, molestie sagittis lobortis tincidunt, varius sit amet metus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel diam nulla. Duis erat orci, hendrerit sit amet semper eget, porttitor nec libero. Praesent ut tempor arcu. Integer id purus quis odio rhoncus tristique. Pellentesque eu nisl sit amet nibh placerat volutpat nec vel risus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ultricies ullamcorper libero ac accumsan. Phasellus varius adipiscing felis, ac consequat risus eleifend vitae. Cras neque orci, rhoncus ut hendrerit sed, venenatis vitae dui.", :remote_avatar_url=>"http://idata.over-blog.com/0/00/74/35/35/C-EST-PAS-SORCIER.JPG")
Organisateur.create!(:name=>"Franklin", :description =>"Maecenas dictum lacinia dui eu ultrices. Phasellus venenatis aliquet venenatis. Proin dapibus nisl a lectus accumsan volutpat. Curabitur mattis, quam nec ornare vehicula, nisi purus aliquet justo, a dictum purus dui et dui. Integer lectus tortor, tincidunt eget placerat quis, fermentum sit amet arcu. Nulla id sem lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce mi sapien, bibendum eget suscipit ac, eleifend eu leo. Donec laoreet tincidunt orci. Sed et tincidunt lorem. In hac habitasse platea dictumst. Ut et ipsum dui, et posuere mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus est velit, malesuada non cursus vitae, consectetur vel odio. Aliquam dui nulla, scelerisque vitae bibendum id, malesuada id orci." , :remote_avatar_url=>"http://www.coloriage.tv/dessincolo/franklin.png")
Organisateur.create!(:name=>"Platon and co", :description =>"Nam tempor aliquet congue. Maecenas sapien mauris, molestie sagittis lobortis tincidunt, varius sit amet metus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel diam nulla. Duis erat orci, hendrerit sit amet semper eget, porttitor nec libero. Praesent ut tempor arcu. Integer id purus quis odio rhoncus tristique. Pellentesque eu nisl sit amet nibh placerat volutpat nec vel risus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ultricies ullamcorper libero ac accumsan. Phasellus varius adipiscing felis, ac consequat risus ettis quam nec diam condimentum convallis. Curabitur cursuida trisus ante, feugiat molestie nibh. Aliquam rutrum dictum sem a malesuada." , :remote_avatar_url=>"http://upload.wikimedia.org/wikipedia/commons/e/e8/Platon_Aristote.jpg")
Organisateur.create!(:name=>"Gourmet gourmand", :description => "Maecenas dictum lacinia dui eu ultrices. Phasellus venenatis aliquet venenatis. Proin dapibus nisl a lectus accumsan volutpat. Curabitur mattis, quam nec ornare vehicula, nisi purus aliquet justo, a dictum purus dui et dui. Integer lectus tortor, tincidunt eget placerat quis, fermentum sit amet arcu. Nulla id sem lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce mi sapien, bibendum eget suscipit ac, eleifend eu leo. Donec laoreet tincidunt orci. Sed et tincidunt lorem. In hac habitasse platea dictumst. Ut et ipsum dui, et posuere mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus est velit, malesuada non cursus vitae, consectetur vel odio. Aliquam dui nulla, scelerisque vitae bibendum id, malesuada id orci.", :remote_avatar_url=>"http://idata.over-blog.com/0/59/31/96//ratatouille.jpg")
Organisateur.create!(:name=>"In sevilla", :description => "Suspendisse lorem erat, condimentum et adipiscing in, egestas quis lorem. Curabitur tempor sollicitudin magna, id pellentesque augue ullamcorper at. Cras tristique mattis nisi, eu gravida enim bibendum sed. Mauris vehicula vestibulum gravida. Sed nec condimentum ligula. Morbi massa neque, fermentum ut luctus in, adipiscing quis lectus.", :remote_avatar_url=>"http://perlbal.hi-pi.com/blog-images/122101/mn/1245341230.jpg")
Organisateur.create!(:name=>"Cedric Villani", :description => "Cedric Villani (ne le 5 octobre 1973 a Brive-la-Gaillarde) est un mathematicien francais, directeur de l'Institut Henri-Poincare et professeur a l'universite Claude Bernard Lyon 1. Il a recu la medaille Fields en 2010. Specialiste de l'analyse, il s'interesse a la resolution mathematique de problemes physiques par etat de relaxation spontane, en particulier la theorie cinetique des gaz et la theorie du transport. Avec son confrere Clement Mouhot, Cedric Villani a contribue a eclairer une controverse de physiciens sur le plasma en expliquant comment son champ electrique revient a l'equilibre dans certaines conditions", :remote_avatar_url=>"http://upload.wikimedia.org/wikipedia/commons/1/1e/C%C3%A9dric_Villani.jpeg")

Import.create!
AdminUser.create!(:email => "admin@example.com", :password => "password", :password_confirmation => "password")


