# docker-craft-cms-ci-env
![docker pulls badge](https://img.shields.io/docker/pulls/codemonauts/craft-cms-ci-env)

This image is intendet to use in a CI/CD pipeline to build CraftCMS websites (or other PHP applications). It contains:
  * PHP 7.4
  * composer
  * NodeJS 12
  * npm
  * gulp

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
    - npm install
    - gulp build --env=produciton
    - cd ..
    - composer install --ignore-platform-reqs --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader
    - zip -qr package.zip .
```
