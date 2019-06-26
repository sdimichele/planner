json.id relationship.id
json.guardian do
  json.partial! relationship.guardian, partial: 'api/guardian', as: :guardian
end

# json.guardian_id relationship.guardian_id
# json.guardian_id relationship.guardian.name
json.child_id relationship.child_id
json.parent relationship.parent