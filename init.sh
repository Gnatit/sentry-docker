# Generate Sentry secret key and update docker-compose.yaml
docker run --rm sentry config generate-secret-key

# Databases
docker-compose up -d sentry-redis sentry-postgres sentry

# Initial setup
docker exec -it [SENTRY CONTAINER] sentry upgrade

# Run the remaining containers (Celery)
docker-compose up -d

# Run bash in sentry as root
docker exec -it --user=root [SENTRY CONTAINER] bash
