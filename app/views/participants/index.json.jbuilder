json.array!(@participants) do |participant|
  json.extract! participant, :id, :partname, :gender, :dob, :address
  json.url participant_url(participant, format: :json)
end
