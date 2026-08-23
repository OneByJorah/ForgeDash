# Maintenance

## Restart stack

```bash
docker compose restart
```

## Update services

```bash
docker compose pull
docker compose up -d
```

## Backup Honcho memory

Honcho data lives in the `honcho-data` Docker volume (and `honcho-postgres` / `honcho-redis` for the main-stack variant). Back up with:

```bash
docker compose stop honcho
docker run --rm -v forgedash_honcho-data:/data -v "$PWD":/backup alpine \
  tar czf /backup/honcho-backup.tgz -C /data .
docker compose start honcho
```

Adjust the volume name prefix if your compose project name differs (`docker volume ls | grep honcho`).
