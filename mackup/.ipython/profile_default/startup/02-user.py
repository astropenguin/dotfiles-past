# coding: utf-8

sep = os.path.sep
projects = '/Users/Akio/Local/Repositories'

for dirpath, dirnames, filenames in os.walk(projects):
    level = dirpath[len(projects)+len(sep):].count(sep)
    if level < 1:
        sys.path.append(dirpath)


import fmflow as fm
import azely


def default(func):
    depth = [s[3] for s in stack()].index('<module>')
    myglobals = sys._getframe(depth).f_globals

    myglobals['__userfunc__'] = func
    spec = getargspec(func)
    args = spec.args
    defs = spec.defaults or []

    for i in range(len(args)-len(defs)):
        myglobals[args[i]] = '__nodefault_'

    for i in range(len(defs)):
        myglobals[args[i-len(defs)]] = defs[i]


def go():
    depth = [s[3] for s in stack()].index('<module>')
    myglobals = sys._getframe(depth).f_globals

    func = myglobals['__userfunc__']
    spec = getargspec(func)
    args = spec.args

    kwargs = {}
    for arg in args:
        value = myglobals[arg]
        if value != '__nodefault__':
            kwargs[arg] = value

    return func(**kwargs)


def inp():
    depth = [s[3] for s in stack()].index('<module>')
    myglobals = sys._getframe(depth).f_globals

    func = myglobals['__userfunc__']
    name = func.func_code.co_name
    spec = getargspec(func)
    args = spec.args

    print('function: {0}'.format(name))
    print('-'*(10+len(name)))

    for arg in args:
        value = myglobals[arg]

        if value == '__nodefault__':
            value = '<no default value>'
        elif type(value) == str:
            value = "'{0}'".format(value)

        npad = max(map(len, args))
        print('# {0:<{1}} = {2}'.format(arg, npad, value))
