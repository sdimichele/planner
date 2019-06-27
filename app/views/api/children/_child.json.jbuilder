json.id child.id
json.name child.name
json.picture_url child.picture_url

# json.time task.format_time(task.time)
json.tasks do
  json.array! child.tasks, partial: 'api/tasks/task', as: :task
end

json.relationships do
  json.array! child.relationships, partial: 'api/relationships/relationship', as: :relationship
end


# json.relationship child.relationships


# json.adult Guardian.where(id: child.relationships.guardian_id)