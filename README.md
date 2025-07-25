# Case Study: Backend Engineering (PHP)

---

⚠️ PLEASE DO NOT FORK THIS REPO AS OTHERS MAY SEE YOUR CODE. INSTEAD YOU CAN SHOULD
[USE THIS TEMPLATE](https://github.com/new?template_name=case-study-backend-engineering-php&template_owner=MDPI-AG)
TO CREATE YOUR OWN REPOSITORY.

---

## Context

This repository contains the skeleton of a Symfony 6.4 application that serves as the basis for the case study.
The application has been Dockerized and is ready to be used with Docker Compose. If you do not have Docker installed,
please follow the [installation instructions](https://docs.docker.com/get-docker/) to get `Docker Desktop`.

## Getting Started

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
