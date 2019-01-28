#:update
class TestCase::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(TestCase, :find_by)
    step Contract::Build( constant: TestCase::Contract::Update )
  end

  step Nested(Present)
  step Contract::Validate( key: :test_case )
  step Contract::Persist()
end
#:update end
