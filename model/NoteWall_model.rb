require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'

DataMapper.setup :default, "sqlite://../#{Dir.pwd}/notewall.sqlite"

class Note
    include DataMapper::Resource

    property :id       , Serial
    property :name , String
    property :message  , String
end
