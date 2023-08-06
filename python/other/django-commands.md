# Gettig started with Django

### Installation and Starting Django
#### 1. Install django using pip
    pip install django

#### 2. Create the project using `django-admin`
    django-admin startproject myproject

This will create directory `myproject` inside which all the files resides.

#### 3. Add default database
    python manage.py makemigration
    
This will create `db.sqlite3` binary file at the root directory of project. `SQLite` is the default database in django.

Django examines your project's models and compares them to the existing database schema. It detects any changes you have made to the models since the last migration and generates new migration files to capture those changes.

Once you are satisfied with the generated migrations run following command.

    python manage.py migrate

This command applies the migrations and updates the database schema to match the models' changes.

Later on these command will be used a alot.

#### 4. Run the server
    python manage.py runserver

Now `django` server is up and running. Which is available at [http://localhost:8000](http://localhost:8000)




