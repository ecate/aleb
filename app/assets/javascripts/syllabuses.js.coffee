$(document).ready ->



  actif = $("input[name=syllabus[flag_actif]]:checked").val()
  lieudefini = $("input[name=syllabus[flag_lieu_defini]]:checked").val()


  $("#syllabus_flag_actif_true").click ->
    $("#syllabus_name_input").toggle()
    $("#syllabus_description_input").toggle()
    show_lieu()


  affichage_adresse = (flag) ->
    if flag
      show_lieu()
    else
      hide_lieu()

  show_lieu= () ->
    $("#syllabus_adresse_etablissement_input").show()
    $("#syllabus_adresse_num_voie_input").show()
    $("#syllabus_adresse_complement_input").show()
    $("#syllabus_adresse_etablissement_input").show()
    $("#syllabus_adresse_codepostal_input").show()
    $("#syllabus_adresse_ville_input").show()

  hide_lieu= () ->
    $("#syllabus_adresse_etablissement_input").hide()
    $("#syllabus_adresse_num_voie_input").hide()
    $("#syllabus_adresse_complement_input").hide()
    $("#syllabus_adresse_etablissement_input").hide()
    $("#syllabus_adresse_codepostal_input").hide()
    $("#syllabus_adresse_ville_input").hide()

  $("#syllabus_flag_lieu_defini_true").click ->
    $("#syllabus_adresse_num_voie_input").toggle()
    $("#syllabus_adresse_etablissement_input").toggle()
    $("#syllabus_adresse_complement_input").toggle()
    $("#syllabus_adresse_etablissement_input").toggle()
    $("#syllabus_adresse_codepostal_input").toggle()
    $("#syllabus_adresse_ville_input").toggle()