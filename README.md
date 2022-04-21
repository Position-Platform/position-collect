# Position Collect v0.4.0

Depot officiel de l'application mobile Position Collect

## Installation

- Creer le fichier .env.prod a la racine du projet et coller le contenu du fichier .env à l'intérieur

- Modifier la valeur de apiUrl dans /lib/src/utils/config.dart

- Executez

## Build

- prod

```
$ flutter build appbundle -t lib/main_prod.dart  --flavor=prod
```

- dev

```
$ flutter build appbundle -t lib/main_dev.dart  --flavor=dev
```

- staging

```
$ flutter build appbundle -t lib/main_staging.dart  --flavor=staging
```
