require 'couchrest_model'

class Report < CouchRest::Model::Base
	property :name, String
	property :apk_id, Integer
	timestamps!
end
