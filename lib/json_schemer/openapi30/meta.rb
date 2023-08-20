# frozen_string_literal: true
module JSONSchemer
  module OpenAPI30
    BASE_URI = URI('json-schemer://openapi30/schema')
    SCHEMA = {
      'id' => 'json-schemer://openapi30/schema',
      '$schema' => 'http://json-schema.org/draft-04/schema#',
      'allOf' => [
        { '$ref' => 'http://json-schema.org/draft-04/schema#' },
        {
          'oneOf' => [
            { '$ref' => 'https://spec.openapis.org/oas/3.0/schema/2021-09-28#/definitions/Schema' },
            { '$ref' => 'https://spec.openapis.org/oas/3.0/schema/2021-09-28#/definitions/Reference' }
          ]
        }
      ]
    }

    module Meta
      SCHEMAS = {
        Draft4::BASE_URI.dup.tap { |uri| uri.fragment = nil } => Draft4::SCHEMA,
        URI('https://spec.openapis.org/oas/3.0/schema/2021-09-28') => Document::SCHEMA
      }
    end
  end
end
