#:delete
class TestCase::Delete < Trailblazer::Operation
  step Model(TestCase, :find_by)
  step :delete_with_dependents!

  def delete_with_dependents!(options, model:, **)
    ActiveRecord::Base.transaction do
      # insert something like
      test_client = ::Tantoapp::Test::V1::Client.new("http://127.0.0.1:3003")
      test_client.tests.get(test_case_id: model.id).each do |t|
        test_client.tests.delete_by_id(t.id)
      end
      # Ideally, we won't do this for direct relations,
      # but only for relations outside the bounded context
      # Or let the frontend's light backend orchestrator do the talking.
      model.destroy
    end
  end
end
#:delete end
