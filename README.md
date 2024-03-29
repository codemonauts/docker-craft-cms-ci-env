# docker-craft-cms-ci-env
![docker pulls badge](https://img.shields.io/docker/pulls/codemonauts/craft-cms-ci-env)

This image is intendet to use in a CI/CD pipeline to build CraftCMS websites (or other PHP applications). It contains:
  * PHP 8.1
  * composer
  * NodeJS 18
  * npm

## Example usage with Gitlab CI
```yaml
build:
  stage: build
  image: codemonauts/craft-cms-ci-env
  artifacts:
    paths:
      - package.zip
  script:
    - cd src/
    - npm ci
    - npm run build
    - cd ..
    - composer install --ignore-platform-reqs --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader
    - zip -qr package.zip .
```
