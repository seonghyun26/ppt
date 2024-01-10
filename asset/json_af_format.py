import json

# Function to modify the data
def modify_data(data):
    for key in data:
        data[key] = {
            "code": data[key],
            "number": 1
        }
    return data

# Read the JSON file
with open('alphafold_organism.json', 'r') as file:
    data = json.load(file)

# Modify the data
modified_data = modify_data(data)

# Write the modified data back to the file
with open('alphafold_organism.json', 'w') as file:
    json.dump(modified_data, file, indent=4)
