{\rtf1\ansi\ansicpg1252\cocoartf949
{\fonttbl}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww9000\viewh8400\viewkind0
}

# I AM 414C

## Story
Hlavni protagonista najde rozbiteho robota. Tomu se rozsviti hlavni display a zacne s nim komunikovat pomoci binary. Hrac se v prvni polovine hry (binary cast) dozvida, ze:
- se jmenuje AL;
- robot zna jeho jmeno;
- robot se jmenuje 414C;
- robot je rozbity;

Po oprave/upgradu robota pokracuje druha cast hry (hex cast). V te se hlavni protagonista dozvida, ze:
- se jmenuje 414C (AL v HEX);
- on je robotem;
- je v komatu;

## TODO

### Important
- Turn off memory analyzer!! Project scheme (nahore hi414C > iPhone) -> edit -> diagnostics
- read: https://useyourloaf.com/blog/xcode-visual-memory-debugger/
- monitor memory usage over time

### Visuals

- BlurIn animated (slow transition)
- Figlet shakening (group of `Text` with offset changing: https://stackoverflow.com/questions/61619013/is-there-a-better-way-to-implement-a-shake-animation-in-swiftui or here : https://www.objc.io/blog/2019/10/01/swiftui-shake-animation/)
- Font je cropped by upper and edge borders

### Model

- ASCII bin maybe not UInt8
- ASCII test replace with BIN/DEC/HEX ...

### Keyboard
- DEL a ENT nahradit za figlet symbols, 123 - <- ?
- Figlets in command line
- command line prompt better
- special symbols? - jednotne theme
- BS on long press should delete

### others
- other name? Something with shifting? been shifted? being shift? 414C
- SHL and SHR need to be fixed

### Themes
- Swamp
- BananaSky
- Vintage
- Palete
- Ice
- Sunset
