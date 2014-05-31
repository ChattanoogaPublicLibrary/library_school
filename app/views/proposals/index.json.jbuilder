json.array!(@proposals) do |proposal|
  json.extract! proposal, :id, :name, :description, :user_id
  json.url proposal_url(proposal, format: :json)
end
