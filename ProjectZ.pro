TEMPLATE = app
QT += network
QT += quick
QT += testlib
android: QT += androidextras

TARGET = ProjectZ


SOURCES += main.cpp \
    tcpserver.cpp \
    tcpclient.cpp

HEADERS += \
    tcpserver.h \
    tcpclient.h

DISTFILES += \
    main_ui.qml \
    KeyCell.qml \
    KeyRow1.qml \
    KeyRow2.qml \
    KeyRow3.qml \
    KeyRow4.qml \
    KeyRow5.qml \
    KeyRow6.qml \
    KeyRow7.qml \
    KeyRow8.qml \
    KeyRow9.qml \
    KeyRow10.qml \
    KeyStatus.qml \
    VolumeSlider.qml \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/res/xml/device_admin_sample.xml \
    android/res/values/strings.xml \
    ScrollCell.qml

RESOURCES += \
    projectz.qrc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
