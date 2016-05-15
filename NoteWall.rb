require 'sinatra'
require 'haml'
require_relative './model/NoteWall_model.rb'
include FileUtils::Verbose

get '/' do
  haml :index
end

post '/' do
end

get '/notes' do
  haml :notes
end

post '/notes' do
  note = Note.new
  note.name = params[:name]
  note.message = params[:message]
  note.save
  return haml(:index)
end

get '/listallnotes' do
  @notes = Note.all
  haml :notelist
end

get '/upload' do
  haml :upload
end

post '/upload' do
  unless params[:file] &&
      (tmpfile = params[:file][:tempfile]) &&
      (name = params[:file][:filename])
    @error = "No file selected"
    return haml(:upload)
  end
  cp(tmpfile, "public/uploads/#{name}")
  return haml(:index)
end

get '/listpictures' do
  @pictures=Dir.entries("public/uploads/").select {|f| !File.directory? f}
  haml :pictureslist
end
