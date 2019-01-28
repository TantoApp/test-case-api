class TestCase::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(TestCase, :new)
    step Contract::Build( constant: TestCase::Contract::Create )
  end

  step Nested( Present )
  step Contract::Validate( key: :test_case )
  failure :failed!

  step Contract::Persist( )
  step :notify!

  def notify!(options, model:, **)
    options["result.notify"] = Rails.logger.info("New TestCase #{model.description}.")
  end

  def failed!(options, model:, **)
    Rails.logger.error "Validation Failed" if options["result.contract.default"].try(:errors)
  end
end
