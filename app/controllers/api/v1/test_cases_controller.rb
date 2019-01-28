class Api::V1::TestCasesController < ApplicationController
  def index
    run TestCase::Index
    render json: result["model"]
  end

  def show
    run TestCase::Show
    render json: result["model"]
  end

  def create
    run TestCase::Create do |result|
      if (errors = result["result.contract.default"].try(:errors)).present?
        render json: errors, status: :unprocessable_entity
      else
        render json: result['model'], status: :created, location: @api_v1_test_case
      end
    end
  end

  def update
    run TestCase::Update do |result|
      if (errors = result["result.contract.default"].try(:errors)).present?
        render json: errors, status: :unprocessable_entity
      else
        render json: result['model'], status: :created, location: @api_v1_test_case
      end
    end
  end

  def destroy
    run TestCase::Delete
  end
end
