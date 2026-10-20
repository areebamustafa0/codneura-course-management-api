# CodNeura Course Management REST API

A backend learning project built with **Node.js, Express.js, and MySQL**. It demonstrates REST API routes, CRUD operations, request validation, parameterized SQL queries, error handling, and relational JOINs.

## Features

- `GET /api/health` — checks the API and database connection
- `GET /api/courses` — list courses; optional `?level=beginner` filter
- `GET /api/courses/:id` — get one course
- `POST /api/courses` — create a course
- `PATCH /api/courses/:id` — update course fields
- `DELETE /api/courses/:id` — delete a course
- `GET /api/enrollments` — show enrollments using SQL `INNER JOIN`
- Basic input validation, HTTP status codes, request logging, and a central error handler

## Requirements

- Node.js 18 or newer
- MySQL Server (MySQL Workbench is optional)
- Postman or another API client for testing

## Setup

1. Clone or download this repository.
2. Install dependencies:

   ```bash
   npm install
   ```

3. Create the database and tables. In MySQL Workbench, open `database/schema.sql` and run it.
4. Copy `.env.example` to `.env`.
5. Update `.env` with your local MySQL username and password. Never commit `.env`.
6. Start the API:

   ```bash
   npm run dev
   ```

7. Visit `http://localhost:3000/` or test `http://localhost:3000/api/health`.

## Test with Postman

### List courses
- Method: `GET`
- URL: `http://localhost:3000/api/courses`

### Filter courses
- Method: `GET`
- URL: `http://localhost:3000/api/courses?level=beginner`

### Create a course
- Method: `POST`
- URL: `http://localhost:3000/api/courses`
- Header: `Content-Type: application/json`
- Body → raw → JSON:

  ```json
  {
    "title": "REST API Development",
    "level": "beginner"
  }
  ```

Expected status: `201 Created`.

### Update a course
- Method: `PATCH`
- URL: `http://localhost:3000/api/courses/1`
- JSON body:

  ```json
  {
    "level": "intermediate"
  }
  ```

### Get a single course
- Method: `GET`
- URL: `http://localhost:3000/api/courses/1`

### Delete a course
- Method: `DELETE`
- URL: `http://localhost:3000/api/courses/2`

### View joined enrollment data
- Method: `GET`
- URL: `http://localhost:3000/api/enrollments`

## Learning notes

- Path parameters are read from `req.params`.
- Query parameters are read from `req.query`.
- JSON request bodies are parsed with `express.json()`.
- SQL values are passed with `?` placeholders rather than concatenated into SQL strings.
- The `enrollments` table links students and courses using foreign keys.

## Current scope and limitations

This is a learning project, not a production-ready service. It does not yet implement user login, authentication/authorization, automated tests, rate limiting, or production deployment. Database credentials must be configured locally in `.env`. Test all endpoints locally before presenting the repository as a completed practical demo.

## Suggested next improvements

1. Add authentication and role-based authorization.
2. Add automated tests.
3. Add pagination and more robust schema validation.
4. Deploy the API with a managed database and environment variables.
