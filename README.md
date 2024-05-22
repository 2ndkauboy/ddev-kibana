[![tests](https://github.com/2ndkauboy/ddev-kibana/actions/workflows/tests.yml/badge.svg)](https://github.com/2ndkauboy/ddev-kibana/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2024.svg)

# DDEV Kibana

## What is ddev-kibana?

This repository allows you to quickly install Kibana into a [DDEV](https://ddev.readthedocs.io) project using just `ddev get 2ndkauboy/ddev-kibana`.

## Installation

```
ddev get 2ndkauboy/ddev-kibana && ddev restart
```

You can then visit Kibana by running `ddev kibana` or visiting the URL shown in `ddev describe`.

## Configuration

The add-on assumes that the Elasticsearch service is named `elasticsearch`.

This add-on tries to always use the latest version of Kibana, which might not be compatible with your version of Elasticsearch. If you are using in incompatible version, try to change the version of the image in the `.ddev/docker-compose.override.yaml` file, like this:

```yaml
services:
  kibana:
    image: docker.elastic.co/kibana/kibana:6.0.0
```

## Explanation

Kibana is a free and open-source gui for elasticsearch that you can use to manage the data in your cluster.

## Additional Resources

- [Kibana official website](https://www.elastic.co/kibana).
- [Kibana GitHub repository](https://github.com/elastic/kibana).

**Kibana is maintained by [@elastic](https://github.com/cars10)**  
**DDEV Kibana is maintained by [@2ndkauboy](https://github.com/2ndkauboy)**
