function array_map(_array, _function)
{
    var _new = array_create(array_length(_array), undefined);
    
    var _i = 0;
    repeat(array_length(_array))
    {
        _new[@ _i] = _function(_array[_i]);
        ++_i;
    }
    
    return _new;
}