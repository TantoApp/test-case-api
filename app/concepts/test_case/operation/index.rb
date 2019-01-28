class TestCase::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] =
      if p_id = options["params"][:project_id] # probably do a better query
        ::TestCase.where(project_id: p_id)
      else
        ::TestCase.all
      end
  end
end
