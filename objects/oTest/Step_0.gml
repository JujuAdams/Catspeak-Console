outputBox.Step(x, y, mouse_x, mouse_y, mouse_check_button(mb_left));
inputBox.Step(x, y2, mouse_x, mouse_y, mouse_check_button(mb_left));

if (inputBox.GetReturnPressed())
{
    var _content = inputBox.GetContent();
    inputBox.SetContent("");

    if (_content == "")
    {
        outputBox.AppendContent("\n");
    }
    else
    {
        try
        {
            var _asg = Catspeak.parseString(_content);
            var _function = Catspeak.compileGML(_asg);
        }
        catch(_error)
        {
            outputBox.AppendContent("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            outputBox.AppendContent("Error encountered whilst compiling");
            outputBox.AppendContent(_error.message);
            outputBox.AppendContent(_error.stacktrace);
            outputBox.AppendContent("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        }
        
        var _return = undefined;
        try
        {
            var _return = _function();
        }
        catch(_error)
        {
            outputBox.AppendContent("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            outputBox.AppendContent("Error encountered whilst executing");
            outputBox.AppendContent(_error.message);
            outputBox.AppendContent(_error.stacktrace);
            outputBox.AppendContent("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        }
        
        _content = string_replace_all(_content, "\n\r", "\n");
        _content = string_replace_all(_content, "\r\n", "\n");
        _content = string_replace_all(_content, "\r",   "\n");
        _content = string_replace_all(_content, "\n", "\n> ");
        
        outputBox.AppendContent("\n> " + _content + "\n\n= " + string(_return));
    }
}