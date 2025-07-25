# Case Study: Backend Engineering (PHP)

---

⚠️ PLEASE DO NOT FORK THIS REPO AS OTHERS MAY SEE YOUR CODE. INSTEAD YOU CAN SHOULD
[USE THIS TEMPLATE](https://github.com/new?template_name=case-study-backend-engineering-php&template_owner=MDPI-AG)
TO CREATE YOUR OWN REPOSITORY.

---

## Getting Started

This repository contains the skeleton of a Symfony 6.4 application that serves as the basis for the case study.
The application has been Dockerized and is ready to be used with Docker Compose. If you do not have Docker installed,
please follow the [installation instructions](https://docs.docker.com/get-docker/) to get `Docker Desktop`.

Make sure the following ports are available on your machine (you may need to shut down any services that are
using them):

- Port 8000 for the PHP application server
- Port 3306 for the MySQL database server
- Port 8080 for the PHPMyAdmin interface

Then, start the Docker stack using Docker Compose:

```bash
docker-compose up -d
```

This will start the Dockerized stack, which includes:

- A PHP 8.2 application server running Symfony 6.4, accessible at [http://localhost:8000](http://localhost:8000)
- A MySQL 8.0 database server
- A PHPMyAdmin interface for managing the MySQL database via a GUI, accessible at [http://localhost:8080](http://localhost:8080)

To sign in to PHPMyAdmin, use the following credentials (we know this ain't secure, but it's just a case study!):

- **Username:** `root`
- **Password:** `root`

The application sources are volume-mounted into the PHP container under `/var/www/html` in the container.

To follow the logs from the Docker stack, you can use:

```bash
docker-compose logs -f
```

To log into the Symfony PHP container, you can use:

```bash
docker exec -ti symfony_app bash
```

There you can run the usual Composer and Symfony commands, such as:

```bash
composer install
php bin/console list
```

---

# 📝 Case Study Task: Build a REST API for Managing "Books"

### Context

You are to implement a small REST API for managing a collection of books in a library system. The goal is to evaluate
your skills with Symfony, API design, entity modeling, and basic authentication.

### Task Description

#### 1. Entity: Book

Create a Book entity with the following properties using Doctrine ORM:

| Property    | Type     | Details                         |
| ----------- | -------- | ------------------------------- |
| id          | UUID     | Primary key, auto-generated     |
| title       | string   | Required, max length 255        |
| author      | string   | Required, max length 255        |
| publishedAt | DateTime | Optional, publication date      |
| isbn        | string   | Optional, max length 20, unique |
| createdAt   | DateTime | Automatically set on creation   |
| updatedAt   | DateTime | Automatically updated on change |

Migrate the database schema so that the Book entity is created in the MySQL database.

#### 2. Basic API Key Authentication

Implement a simple middleware (Symfony event listener or authenticator) that requires all API requests
to include an HTTP header `X-API-KEY` with a predefined API key. We assume here that we have only one
API client, so we can hardcode the API key in the configuration so that -- at least -- we can use a
different API key per environment (development, staging, production, etc.).

```
X-API-KEY: your_api_key_here
```

Requests without the correct API key should return HTTP 401 Unauthorized.

#### 3. Build the REST API Endpoints

Build these endpoints for the Book resource:

| HTTP Method | URL             | Description             | Request Body           | Response                     |
| ----------- | --------------- | ----------------------- | ---------------------- | ---------------------------- |
| GET         | /api/books      | List all books          | None                   | JSON array of books          |
| GET         | /api/books/{id} | Get details of a book   | None                   | JSON object of book          |
| POST        | /api/books      | Create a new book       | JSON book data         | JSON created book + HTTP 201 |
| PUT         | /api/books/{id} | Update an existing book | JSON updated book data | JSON updated book            |
| DELETE      | /api/books/{id} | Delete a book           | None                   | HTTP 204 No Content          |

#### 4. Data Validation

- Validate required fields (title, author).
- Validate the ISBN is unique if provided.
- Validate the max lengths on strings.

#### 5. Deliverables

The updated Symfony app source code with:

- Book entity and Doctrine mappings
- Repository class or service if needed
- API Controllers and routes
- API Key authentication mechanism
- Validation rules
- Instructions on how to test the API (e.g., example curl commands)
- Basic test cases (optional, but a plus)

#### 6. Bonus (optional)

- Use Symfony Serializer groups to customize JSON responses.
- Add pagination on the GET /api/books endpoint.
- Add filters (e.g., search by author or title).
- Add OpenAPI/Swagger documentation for the API.
- Unit test coverage for the API endpoints with PHPUnit.
