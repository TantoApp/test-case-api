#:contract
require "reform"
require "reform/form/dry"

module TestCase::Contract
  class Create < Reform::Form
    include Dry

    def self.statuses
      {"0" => "untested", "1" => "passed", "2" => "failed"}
    end

    #:property
    property :description
    property :project_id
    property :status
    property :active
    #:property end

    #:validation
    validation do
      required(:description).filled
      required(:project_id).filled
      required(:status).filled.included_in?(TestCase::Contract::Create.statuses.keys)
    end
    #:validation end
  end
end
#:contract end
