x = 20;
y = 20;

y2 = y + 605;

outputBox = new Textbox(fntConsolas, room_width-40, y2 - y - 20);

outputBox.SetContent("Textbox + Catspeak example\nMade by Juju Adams   2023-06-21\nCatspeak is made by Katsaii: https://github.com/katsaii/catspeak-lang\n");

outputBox.SetCanType(false);

inputBox = new Textbox(fntConsolas, room_width-40, room_height - y2 - 20);
inputBox.SetReturnBehavior(1);