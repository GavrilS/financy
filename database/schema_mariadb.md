# Tables

* users
    - id - Automatically generated / Required
    - name - Text / Required / Can be used for login
    - email - Text / Required
    - password - Text / Required
    - type - Text / 2 user types(regular and admin/regular by default) / Populated automatically

* expenses
    - id - Unique id / Required
    - date - Date /Required
    - month - Text
    - year - Number
    - item - Text
    - type - Text / Required
    - store - Text
    - comment - Text
    - amount - Float / Required

* income
    - id - Unique id / Required
    - date - Date / Required
    - month - Text
    - year - Number
    - source - Text
    - type - Text
    - comment - Text
    - amount - Float / Required
