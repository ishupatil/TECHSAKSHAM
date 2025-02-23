import json
from datetime import datetime

class User:
    def __init__(self, name, age, weight):
        self.name = name
        self.age = age
        self.weight = weight

    def __str__(self):
        return f"User: {self.name}, Age: {self.age}, Weight: {self.weight} kg"

    def to_dict(self):
        return {
            "name": self.name,
            "age": self.age,
            "weight": self.weight
        }

class Workout:
    def __init__(self, user_name, workout_type, duration, calories, workout_date):
        self.user_name = user_name
        self.workout_type = workout_type
        self.duration = duration  # in minutes
        self.calories = calories  # in kcal
        self.workout_date = workout_date  # Date of the workout

    def __str__(self):
        return f"{self.user_name} - {self.workout_date} - {self.workout_type} - {self.duration} min - {self.calories} kcal"

    def to_dict(self):
        return {
            "user_name": self.user_name,
            "workout_type": self.workout_type,
            "duration": self.duration,
            "calories": self.calories,
            "workout_date": self.workout_date
        }

class FitnessTracker:
    def __init__(self, filename="workouts.json"):
        self.filename = filename
        self.workouts = []
        self.users = []
        self.load_workouts()
        self.load_users()

    def add_user(self, name, age, weight):
        user = User(name, age, weight)
        self.users.append(user)
        print(f"User added successfully: {user}\n")

    def add_workout(self, user_name, workout_type, duration, calories, workout_date):
        try:
            datetime.strptime(workout_date, "%Y-%m-%d")  # Validate date format
            workout = Workout(user_name, workout_type, duration, calories, workout_date)
            self.workouts.append(workout)
            print(f"Workout added successfully: {workout}\n")
        except ValueError:
            print("Invalid date format! Please enter in YYYY-MM-DD format.\n")

    def view_workouts(self):
        if not self.workouts:
            print("No workouts logged yet.\n")
        else:
            print("Workout Log:")
            for idx, workout in enumerate(self.workouts, start=1):
                print(f"{idx}. {workout}")
            print()

    def save_workouts(self):
        try:
            with open(self.filename, "w") as file:
                json.dump([workout.to_dict() for workout in self.workouts], file)
            print("Workouts saved successfully!\n")
        except IOError:
            print("Error saving workouts to file.\n")

    def load_workouts(self):
        try:
            with open(self.filename, "r") as file:
                data = json.load(file)
                self.workouts = [Workout(**workout) for workout in data]
            print("Workouts loaded successfully!\n")
        except (FileNotFoundError, json.JSONDecodeError):
            self.workouts = []
        except IOError:
            print("Error loading workouts from file.\n")

    def save_users(self):
        try:
            with open("users.json", "w") as file:
                json.dump([user.to_dict() for user in self.users], file)
            print("Users saved successfully!\n")
        except IOError:
            print("Error saving users to file.\n")

    def load_users(self):
        try:
            with open("users.json", "r") as file:
                data = json.load(file)
                self.users = [User(**user) for user in data]
            print("Users loaded successfully!\n")
        except (FileNotFoundError, json.JSONDecodeError):
            self.users = []
        except IOError:
            print("Error loading users from file.\n")

    def exit_program(self):
        self.save_workouts()
        self.save_users()
        print("Exiting program. Stay fit!")
        exit()