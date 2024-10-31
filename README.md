# JSON Server Mock API

This repository provides a mock API using JSON Server, perfect for developing and testing front-end applications before the final API is ready.

## Prerequisites

- **Docker** or **Podman**: Ensure that Docker (or Podman) is installed on your machine, as Docker is used in this repository to run JSON Server in a container.
- **Make**: Make sure `make` is installed and accessible. On macOS, you can install it with Xcode tools, and on Linux, use the package manager (e.g., `apt install make`).

## Instructions

### 1. Build the Docker Image

To build the Docker image with JSON Server:

```bash
make build
```

This command will create the image with the name `json-server-mock`.

### 2. Start JSON Server

To start the container and run JSON Server:

```bash
make run
```

The server will be available at [http://localhost:3000](http://localhost:3000). Available endpoints include:

- `/auth`
- `/establishments`
- `/services`
- `/attendants`
- `/appointments`
- `/notifications`
- `/rules`

### 3. Stop the Container

To stop the running container:

```bash
make stop
```

### 4. Clean Up Image and Containers

To remove the container and Docker image:

```bash
make clean
```

### Using JSON Server with `curl`

Here are some `curl` examples to interact with the API:

#### Authentication (Example)

- **Login**: `POST /auth/login`
  
  ```bash
  curl -X POST http://localhost:3000/auth/login -H "Content-Type: application/json" -d '{"username": "proprietario1", "password": "senha123"}'
  ```

#### Fetch Establishments

- **GET /establishments**

  ```bash
  curl http://localhost:3000/establishments
  ```

#### Create a New Service

- **POST /services**

  ```bash
  curl -X POST http://localhost:3000/services -H "Content-Type: application/json" -d '{"name": "New Service", "description": "Service description", "price": 100, "establishmentId": 1}'
  ```

Refer to the `db.json` file to see the structure and fields available for each route.

## Help Commands

To view the list of available `Makefile` commands:

```bash
make help
```