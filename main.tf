terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}


resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

# Define a Docker container resource for the Nginx image
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  # Map port 80 in the container to port 8000 on the host
  ports {
    internal = 80
    external = 8000
  }
}
