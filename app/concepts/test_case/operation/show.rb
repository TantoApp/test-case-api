class TestCase::Show < Trailblazer::Operation
  step Model(TestCase, :find_by)
end
