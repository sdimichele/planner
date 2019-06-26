json.id child.id
json.name child.name
json.picture_url child.picture_url
json.task child.tasks


json.relationships do
  json.array! child.relationships, partial: 'api/relationships/relationship', as: :relationship
end

# json.relationship child.relationships


# json.adult Guardian.where(id: child.relationships.guardian_id)