# Notes of the lost.
These are my notes. Hardships, goodtimes and so on.

//TODO copy over snippets from README.md

I installed Android SDK using Android Studio. I am using Manjaro KDE. Pamac automatically installs adb under /usr/share/. Android studio also installs adb, but under ~/Android/sdk. So I needed to change 

1. Paths to *ANDROID_SDK_ROOT*

2. Add chmod permissions to *.gradlew* in the project and *platform-tools* in sdk

If you have a jetify issue. Then you need to delete node_modules and npm install again. That worked for some reason.

## Watchman

1. Duly take note of.
... *watchman watch-project PROJECTPATH* - this makes ur watchman look at the project
... *watchman watch-list* - this shows what projects ur watchman looks at
... *watchman watch-del* - deletes a project that is being watched
... *watchman has a problem if installed that it needs more BYTES from you, so you need to increase its buffer /etc/conf.d/ has some inotifywatchers thingy, google it. it should be *524288* (MAX NUMBER IT CAN BE)!
