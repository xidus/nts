# Python

* https://awesome-python.com/
* http://www.ianbicking.org/docs/setuptools-presentation/

## Snippets

### `argparse` how-to

```python
import argparse

def isodate(s):
    fmt = '%Y-%m-%d'
    try:
        return dt.datetime.strptime(s, fmt).date()
    except ValueError:
        raise argparse.ArgumentTypeError(f'Expected `{s}` to match format `{fmt}`')

def load_args():
    parser = argparse.ArgumentParser(description='Select data.')
    parser.add_argument('--date-beg', metavar='BEG', type=isodate, required=True, help='Start date (inclusive) for the data.')
    parser.add_argument('--date-end', metavar='END', type=isodate, required=True, help='End date (inclusive) for the data.')
    return parser.parse_args()

```
