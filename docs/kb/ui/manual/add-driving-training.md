# How to Add a New Driving Training

This guide explains how to register a new student's driving training on the **DriveUp mobile app** (instructor) and the **DriveUp web admin** (manager).

> A "driving training" is the whole course a student takes for one category (e.g. Car, Motorcycle). Once you create it, the student appears in your training list and you can start scheduling driving sessions.

---

## On the Mobile App (Instructor)

### Step 1 – Open the add form

- Go to the **Training** tab.
- Tap **"Add new student"** on an empty list, or use the **+** (global add) button.

### Step 2 – Add the student

**If the student already exists in the system:**

1. Tap the phone field and start typing the student's phone number.
2. As you type, a list of matching students appears.
3. Tap the correct student — their name and profile picture are filled in automatically.
   - Their data is **locked** (not editable) to keep the existing profile intact.
   - If you picked the wrong person, tap the **change (swap) icon** to remove them and search again.

**If this is a brand-new student:**

1. Enter their **phone number**.
2. Add their **name** (at least 3 characters).
3. *(Optional)* Tap the photo circle / the camera button to upload a **profile picture**.

### Step 3 – Choose the driving category

- Tap the **Category** card and select the category from the list (e.g. Car, Motorcycle).
- If the company only has **one active category**, it's pre-selected for you and you can skip this step.

### Step 4 – Select the transmission

- The **"Automatic transmission"** switch is off by default, which means **Manual**.
- Toggle it **on** if the student will drive an automatic car.

### Step 5 – Save

- Tap **"Submit"** (the button is only active once a category is chosen).
- A confirmation popup appears and the training is added to your training list.

---

## On the Web Admin (Manager)

### Step 1 – Open the add form

- Go to **Driving Trainings**.
- Click **"Add driving training"**.

### Step 2 – Add the student

**If the student already exists in the system:**

- Type the **full phone number** — if it matches exactly one student, that student is **selected automatically**.
- Or start typing the **student's name** (at least 3 characters) and pick them from the search results.
- The student's data is **auto-filled and locked** (not editable).
- To start over, click the **x** on the selected student — the form resets so you can search again.

**If this is a brand-new student:**

1. Enter their **name** (required).
2. Enter a **valid phone number** (required, matching the country of the company).
3. *(Optional)* Upload a **profile picture** using the image upload control.

### Step 3 – Choose the driving category

- Select the **category** from the dropdown.
- If only **one active category** exists, it's pre-selected automatically.

### Step 4 – Choose the instructor

- Select which **instructor** will be in charge of this training (only active team members are shown).
- If only **one instructor** exists, they are pre-selected automatically.

### Step 5 – Select the transmission

- The **"Automatic"** switcher is **on by default** — switch it off if the car is **Manual**.

### Step 6 – Save

- Click **"Add training"**.
- The dialog closes, the list refreshes, and you see a success message.

---

## What happens in the background

- If the student is **new**, the system creates their profile automatically (using the phone number) and then creates the training.
- If you selected an **existing student**, the system checks they already have a training with your company, then adds the new one.
- A **profile picture** is attached if you uploaded one.
- Your company must be **active** to create trainings; the company's country must match the student's phone number for new students.

## Troubleshooting

| Problem | Why it happens | What to do |
|---|---|---|
| "Category" is empty / nothing to pick | The company has no active driving categories | Create a category in **Category Management** first |
| Student isn't found when typing | The phone number is incomplete or doesn't match the country | Enter the full number with the correct country code |
| Cannot save | Missing category, instructor, or student name/phone | Fill in all required fields shown above |
| Wrong student selected | You picked the wrong search result | Use the **x / change icon** to reset and search again |
