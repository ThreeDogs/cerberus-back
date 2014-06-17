json.array!(@test_codes) do |test_code|
  json.extract! test_code, :id, :import_code_java, :import_code_class, :project_id
  json.url test_code_url(test_code, format: :json)
end
