ActiveAdmin.register Syllabus do

  #collection_action :import_csv, :method => :post do
  #      # Do some CSV importing work here...
  #      redirect_to :action => :index, :notice => "CSV imported successfully!"
  #    end

  index do
    button_to "Importer", :action => "import_spreadsheet", :method => :post
  end

  form do |f|
         f.inputs "Details" do
           f.input :titre
           f.input :logo

         end
  end


end
