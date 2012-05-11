$(document).ready ->

  #Fonctions
  show_lieu = () ->
    $("#syllabus_adresse_etablissement_input").show()
    $("#syllabus_adresse_num_voie_input").show()
    $("#syllabus_adresse_complement_input").show()
    $("#syllabus_adresse_etablissement_input").show()
    $("#syllabus_adresse_codepostal_input").show()
    $("#syllabus_adresse_ville_input").show()

  hide_lieu = () ->
    $("#syllabus_adresse_etablissement_input").hide()
    $("#syllabus_adresse_num_voie_input").hide()
    $("#syllabus_adresse_complement_input").hide()
    $("#syllabus_adresse_etablissement_input").hide()
    $("#syllabus_adresse_codepostal_input").hide()
    $("#syllabus_adresse_ville_input").hide()


  #Initialisation
  actif = false
  lieudefini = false
  interne = false
  dates = false
  if $("#syllabus_flag_actif_true").prop('checked')
    actif = true
  if $("#syllabus_flag_lieu_defini_true").prop('checked')
    lieudefini = true
  if $("#syllabus_flag_interne_true").prop('checked')
    interne = true
  if $("#syllabus_flag_date_true").prop('checked')
    dates = true

  #Affichage initial
  show_lieu()
  if !interne
    $("#panel_interne").hide()
    $("#panel_externe").show()
  if !dates
    $("#panel_dates").hide()

  #changement en cours
  $("#syllabus_flag_lieu_defini_true").click ->
    show_lieu()
  $("#syllabus_flag_lieu_defini_false").click ->
    hide_lieu()
  $("#syllabus_flag_interne_true").click ->
    $("#panel_interne").show()
    $("#panel_externe").hide()
  $("#syllabus_flag_interne_false").click ->
    $("#panel_interne").hide()
    $("#panel_externe").show()
  $("#syllabus_flag_date_true").click ->
    $("#panel_dates").show()
  $("#syllabus_flag_date_false").click ->
    $("#panel_dates").hide()
