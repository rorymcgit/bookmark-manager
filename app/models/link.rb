class Link
  include DataMapper::Resource

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

  property :id, Serial
  property :title, Text
  property :url, Text
end
