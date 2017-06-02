# README

An example on how to leverage Docker for Ruby (on Rails) development.

## Development

    docker-compose build --pull
    docker-compose up app

`docker-compose ps` will tell you, on which local port the application binds.

## Launch tests

    docker-compose build --pull
    docker-compose -f docker-compose.test.yml run --rm app

## Prepare for airplane mode

    docker-compose pull

## Troubleshooting

Have you tried to turn it off an on again?

    # Turn off
    docker-compose kill
    docker-compose rm -fv

    # Turn on
    docker-compose up app

Check the logs:

    docker-compose logs

You can enter a running container:

    docker-compose exec app /bin/sh
