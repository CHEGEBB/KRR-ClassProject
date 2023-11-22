# 🍅 Tomato Disease Diagnosis with CLIPS and Prolog 🌱🔍
This repository contains two powerful tools for diagnosing tomato plant diseases: one using CLIPS and another using Prolog.<br>
Choose your preferred tool or experiment with both to enhance your understanding of tomato diseases.<br>
# CLIPS - C Language Integrated Production System🚦
## Prerequisites
CLIPS Installation: Ensure that CLIPS is installed on your system.
# Getting Started
Clone the Repository:
```bash
   
   git clone https://github.com/CHEGEBB/KRR-ClassProject.git
```
# Navigate to the Project Directory:
```bash
cd KRR-ClassProject
```
# Load the CLIPS Environment:
```bash
clips
```
# Load the CLIPS Script:
```bash
(load "tomato_disease.clp")

(reset)
(run)
```
# Query for Symptoms or Diseases:
To find symptoms for a specific tomato plant (e.g., "tomato-plant-1"):
```bash
(find-symptoms-for-disease tomato-plant-1)
```
# Prolog📚
## prerequisites
Prolog Installation: Ensure that you have a Prolog environment installed on your machine.

# Getting Started
## Load Tomato Disease Knowledge Base:
Launch your Prolog environment and load the file:
 ```bash
?- [tomato_diseases].
```
## Query for Symptoms of a Specific Disease:📊
Below is an example of how to query:
```bash
?- symptoms_for_disease(Disease, Symptoms), member('wilting_of_leaves', Symptoms).
```

Author: CHEGEBB 👨‍💻
GitHub: https://github.com/CHEGEBB/ 🚀













