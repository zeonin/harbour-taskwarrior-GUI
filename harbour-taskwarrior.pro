# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-taskwarrior

CONFIG += sailfishapp

SOURCES += src/Taskwarrior.cpp \
    src/taskexecuter.cpp \
    src/taskwatcher.cpp

OTHER_FILES += qml/Taskwarrior.qml \
    rpm/harbour-taskwarrior.changes.in \
    rpm/harbour-taskwarrior.spec \
    rpm/harbour-taskwarrior.yaml \
    translations/*.ts \
    harbour-taskwarrior.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-taskwarrior-de.ts

HEADERS += \
    src/taskexecuter.h \
    src/taskwatcher.h

DISTFILES += \
    qml/pages/Tasklist.qml \
    qml/pages/Viewlist.qml \
    qml/lib/storage.js \
    qml/lib/utils.js \
    qml/pages/DetailView.qml \
    qml/pages/DetailTask.qml \
    qml/cover/CoverPage.qml \
    qml/pages/DateView.qml \
    qml/pages/Divider.qml

