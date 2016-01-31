from six import string_types

def map_keys(keys, row):
    
    result = {}

    if row is None:
        return result

    key_iter = iter(keys)

    for element in row:
        key = next(key_iter)

        # Recurse when the element is a list.
        if hasattr(element, '__iter__') and not isinstance(element, string_types):
                     
            # Recursively map keys to all non-iterable elements.
            if all(map(lambda x: not hasattr(x, '__iter__') or isinstance(x, string_types), element)):
                result[key[0]] = map_keys(key[1], element)
            # Recursively map keys to each iterable element.
            else:
                result[key[0]] = [map_keys(key[1], i) for i in element if any(i)]
        else:
            result[key] = element

    return result
