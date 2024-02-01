## Django - Basic Structure of Django

Django's structure follows the Model-View-Controller (MVC) architectural pattern, which is often referred to as Model-View-Template (MVT) in Django. The basic structure of a Django project consists of the following components:

### 1. Project:
A Django project is a collection of settings, configurations, and applications that make up a web application. It serves as the root directory of your web application. You can create a new project using the `django-admin startproject` command. The project contains the following main components:

- `manage.py`: A command-line utility that lets you interact with the Django project. You can use it for tasks like running the development server, creating database tables, and managing applications.

- `settings.py`: This file contains all the configuration settings for your project, such as database connection settings, installed applications, middleware, static files, and more.

- `urls.py`: This file defines the URL patterns for your project. It maps URLs to views (explained below) using regular expressions.

- `wsgi.py`: A WSGI (Web Server Gateway Interface) configuration file used to deploy the Django application on a production web server.

- `asgi.py`: An ASGI (Asynchronous Server Gateway Interface) configuration file used for running Django with asynchronous web servers.

### 2. Applications:
Django applications are modular components that perform specific tasks within your project. Each application can handle different parts of your web application, such as user authentication, blog posts, product catalog, etc. Applications are designed to be reusable and can be plugged into multiple projects.

An application typically consists of the following components:

- `models.py`: Defines the database models using Django's Object-Relational Mapping (ORM). Models represent database tables and their relationships.

- `views.py`: Contains the view functions that handle user requests, process data, and render templates. Views are responsible for the application's logic and interaction with the models.

- `templates`: This directory holds the HTML templates used to generate the web pages. Views use these templates to present data to the user.

- `urls.py`: Similar to the project level `urls.py`, this file defines URL patterns specific to the application and maps them to corresponding views.

### 3. Database:
Django supports various database backends, such as SQLite, PostgreSQL, MySQL, and Oracle. You can specify the database connection settings in the project's `settings.py` file. Django's ORM allows you to work with databases using Python classes, making it easier to manage and interact with the database.

### 4. Static files and Media:
Django provides mechanisms to handle static files (CSS, JavaScript, images) and media files (user-uploaded files) separately. You can specify the static and media file directories in the project's `settings.py` file.

This basic structure allows you to organize your Django projects efficiently and follow the "Don't Repeat Yourself" (DRY) principle by reusing applications across projects. It promotes modularity, making it easier to maintain and scale your web applications.
