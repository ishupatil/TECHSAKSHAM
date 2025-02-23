from workout import FitnessTracker

if __name__ == "__main__":
    tracker = FitnessTracker()
    
    while True:
        print("1. Add User")
        print("2. Add Workout")
        print("3. View Workouts")
        print("4. Save Workouts")
        print("5. Load Workouts")
        print("6. Exit")
        choice = input("Enter your choice: ")

        try:
            if choice == "1":
                name = input("Enter your name: ")
                age = int(input("Enter your age: "))
                weight = float(input("Enter your weight (kg): "))
                tracker.add_user(name, age, weight)
            elif choice == "2":
                user_name = input("Enter your name: ")
                workout_type = input("Enter workout type: ")
                duration = int(input("Enter duration (minutes): "))
                calories = int(input("Enter calories burned: "))
                workout_date = input("Enter workout date (YYYY-MM-DD): ")
                tracker.add_workout(user_name, workout_type, duration, calories, workout_date)
            elif choice == "3":
                tracker.view_workouts()
            elif choice == "4":
                tracker.save_workouts()
            elif choice == "5":
                tracker.load_workouts()
            elif choice == "6":
                tracker.exit_program()
            else:
                print("Invalid choice. Please try again.\n")
        except ValueError:
            print("Invalid input! Please enter numbers where required.\n")
# -*- coding: utf-8 -*-

