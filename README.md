# Billinho on Rails

### Overview

Billinho is a project that are supposed to simulate an API for management of payments for students from a university/institution that are currently studying.

### Setup

* To configure and initialize the project, you must have Ruby and Rails installed on your O.S. By the way, the project doesn't are **dockerized**, but will be, soon.. That will free the need of setup the project locally.

### Database

* First of all, you can easily create database with:
```
rails db:create
```

* Now you need to migrate the tables:
```
rails db:migrate
```

* After all, if you want, you can seed those tables:
```
rails db:seed
```

### Run

* To run the Billinho, you can execute `rails s` on your terminal at project root folder, and by default, it will be listen at port 3000, in http://localhost:3000

### Tips

* The project has 4 principals Entities, that are **Students**, **Institutions**, **Enrolments** and **Invoices**, you have endpoints for creation, update, delete, list, show specific, for everyone of then, with the exception of invoices, that are only created through enrolment creation.

  ##### Principal Endpoints:
  * Creation of Students - ***/api/v1/student*** **[POST]**
  * Creation of Institutions - ***/api/v1/institution*** **[POST]**
  * Creation of Enrolments- ***/api/v1/enrolment*** **[POST]**
.
  * List of Students - ***/api/v1/student*** **[GET]**
  * List of Institutions - ***/api/v1/institution*** **[GET]**
  * List of Enrolments- ***/api/v1/enrolment*** **[GET]**
  * List of Invoices- ***/api/v1/invoice*** **[GET]**
.
  * Show Student - ***/api/v1/student/:id*** **[GET]**
  * Show Institution - ***/api/v1/institution/:id*** **[GET]**
  * Show Enrolment- ***/api/v1/enrolment/:id*** **[GET]**
  * Show Invoice - ***/api/v1/invoice/:id*** **[GET]**