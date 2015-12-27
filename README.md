# Crew
A person collection for iOS

### Must

✅ get remote contacts

- request error handling

✅ save it into a local database for offline access

✅ retrieve from local database

✅ enters in a screen1 with a title and a list 

✅ this contact list contains cells that presents first_name and surname

✅ when user taps a cell, the navigation changes the current screen1 to a detail screen2

✅ in the detail screen2 the user can change back the navigation, see a title and labels for the contact fields: first_name, surname, address, phone_number, email, createdAt and updatedAt

### Should
✅ the contact should have an adorable avatar

### Would be good
✅ store local data using realm database

### The tests should cover
- get remote fail
- get remote empty
- get remote wierd
- get local fail *assert
- get local empty

Performance
- measure the database read or write speeds