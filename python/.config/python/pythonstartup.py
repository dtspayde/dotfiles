try:
    from rich import pretty, print, inspect
    pretty.install()
except ImportError:
    pass

try:
    import numpy as np
except ImportError:
    pass
