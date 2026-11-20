# StarQuest · 摘星

StarQuest is a mixed-reality tabletop comedy for PICO. You peel a sticky note off a steam engine and shrink to discover you just removed a town's bridge. You set things right, then the townspeople look up. A giant hand turns an incoming asteroid into a meteor shower.

StarQuest 是一款面向 PICO 的混合现实桌面游戏，目前处于原型阶段。

## Development setup

1. Install Node.js 20 or later, Git, and Unity **6000.3.25f1** with Android Build Support, Android SDK & NDK Tools, and OpenJDK.
2. On Windows, run `powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\Initialize-Game.ps1` from the repository root. It installs PICO CLI 0.7.0 locally and generates a Unity Spatial project in `Game/`.
3. Open `Game/` in Unity, let Unity resolve its dependencies, and select Android as the build target. Use the template's sample scene for the first build.

This repository currently contains the setup script. The Unity project is generated from PICO's upstream template. Unity, PICO dependencies, and generated template files are governed by their respective terms. The MIT license covers StarQuest's original repository files.

[PICO Unity quickstart](https://developer.picoxr.com/document/pico-cli/quickstart-unity/) · [Unity Android setup](https://docs.unity3d.com/Manual/android-sdksetup.html)
