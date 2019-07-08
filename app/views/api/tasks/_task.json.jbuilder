json.id task.id
json.name task.name
json.description task.description
json.guardian_id task.guardian_id
# json.time task.time.strftime("%Y-%m-%dT%H:%M")
json.time task.time.strftime("%m-%d-%Y %H:%M")
json.status task.status
json.children_tasks task.children_tasks

json.child_info task.children


