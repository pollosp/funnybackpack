ENV['RACK_ENV'] = 'test'

require_relative '../NoteWall.rb'  # <-- your sinatra app
require 'rspec'
require 'rack/test'

describe 'The NoteWall App' do
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  it 'displays index' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match ('NoteWall')
  end

  it 'displays app template' do
    get '/notes'
    expect(last_response).to be_ok
    expect(last_response.body).to match ('NoteWall')
  end

  it 'Save Report' do
    post '/notes'
    expect(last_response).to be_ok
  end

  it 'List Notes' do
    get '/listallnotes'
    expect(last_response).to be_ok
  end

  it 'Upload picture' do
    post '/upload'
    expect(last_response).to be_ok
  end

  it 'List pictures' do
    get '/listpictures'
    expect(last_response).to be_ok
  end

end
