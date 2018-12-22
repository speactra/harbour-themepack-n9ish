import QtQuick 2.0
import Sailfish.Silica 1.0
import uithemer.themescripts 1.0
import "../components"

Page
{
    id: firstpage
    focus: true
    ThemePack { id: themePack }


    Keys.onPressed: {
        handleKeyPressed(event);
    }

    function handleKeyPressed(event) {

        if (event.key === Qt.Key_Down) {
            flickable.flick(0, - firstpage.height);
            event.accepted = true;
        }

        if (event.key === Qt.Key_Up) {
            flickable.flick(0, firstpage.height);
            event.accepted = true;
        }

        if (event.key === Qt.Key_PageDown) {
            flickable.scrollToBottom();
            event.accepted = true;
        }

        if (event.key === Qt.Key_PageUp) {
            flickable.scrollToTop();
            event.accepted = true;
        }
    }

    BusyState { id: busyindicator; }

    Connections
    {
        function notify() {
            busyindicator.running = false;
        }

        target: themePack
        onIconsFetched: notify()
    }

    SilicaFlickable
    {
        id: flickable
        anchors.fill: parent
        anchors.bottomMargin: Theme.paddingLarge
        contentHeight: content.height
        enabled: !busyindicator.running
        opacity: busyindicator.running ? 0.0 : 1.0

        Column
        {
            id: content
            width: parent.width
            spacing: Theme.paddingMedium

           PageHeader { title: qsTr("N9ish Icon Pack") }

            Item {
                height: appicon.height + Theme.paddingMedium
                width: parent.width

                Image { id: appicon; anchors.horizontalCenter: parent.horizontalCenter; source: "../../appinfo.png" }
            }

            LabelText {
                text: qsTr("Thank you for using N9ish Icon Pack!")
            }

            LabelText {
                text: qsTr("Released under the GNU GPLv3 license.")
            }
            LabelText {
                text: qsTr("Developed with help by the Themepack Companion by fravacarro")
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Themepack Companion")
                onClicked: Qt.openUrlExternally("https://github.com/fravaccaro/harbour-themepack-companion")
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("N9ish Sources")
                onClicked: Qt.openUrlExternally("https://github.com/speactra/harbour-themepack-n9ish")
            }

            SectionHeader { text: qsTr("Icons") }

            LabelText {
                text: qsTr("The N9-like icons used in this pack are made by hpluslabels on XDA:")
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("XDA Thread")
                onClicked: Qt.openUrlExternally("https://forum.xda-developers.com/showthread.php?t=1363692")
            }

            LabelText {
                text: qsTr("Missing icons is filled with fravacarros Evolve Plus Icon Pack:")
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Open Repos")
                onClicked: Qt.openUrlExternally("https://openrepos.net/content/fravaccaro/evolve-plus-icons")
            }

            LabelText {
                text: qsTr("As for now SailfishX (X, XA2) is supported. It may work on other screen sizes. I have not converted the icons to all sizes, and as the base icons is .png there is no scalable icons.")
            }

            SectionHeader { text: qsTr("Icon request") }

            LabelText {
                text: qsTr("From here you can request missing icons for your favorite apps.")
            }

            LabelText {
                text: qsTr("This will open your e-mail client, from which you can send me the name of the apps you would like to be included in this theme.")
             }

            LabelText {
                text: qsTr("By requesting new icons, you accept sending the name of the unthemed apps installed on your device, along with your e-mail address. This data will be used by me only for the intended purpose and NEVER disclosed to thirdy parties. Your app names and e-mail address will be deleted right after.")
             }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Request icons")
                onClicked: {
                        busyindicator.running = true;
                        themePack.fetchIcons();
                }
            }

            SectionHeader { text: qsTr("Developers") }

            LabelText {
                  text: qsTr("If you want to create a theme compatible with UI Themer, please read the documentation.")
               }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Documentation")
                  onClicked: Qt.openUrlExternally("https://fravaccaro.github.io/themepacksupport-sailfishos/docs/getstarted.html")
              }

              SectionHeader { text: qsTr("Credits") }

              LabelText {
                  text: qsTr("Keyboard navigation based on the one on <a href='https://github.com/Wunderfitz/harbour-piepmatz'>Piepmatz</a> by Sebastian Wolf.")
               }

              /*SectionHeader { text: qsTr("Translations") }

              AboutLanguage { text: "Deutsch" }
              AboutTranslator { text: "Translator name" }
              Item { width: parent.width; height: Theme.paddingLarge }

              AboutLanguage { text: "Italiano" }
              AboutTranslator { text: "Translator name" }
              Item { width: parent.width; height: Theme.paddingLarge }

              LabelText {
                  text: qsTr("Request a new language or contribute to existing languages on the Transifex project page.")
              }

              Button {
                  anchors.horizontalCenter: parent.horizontalCenter
                  text: qsTr("Transifex")
                  onClicked: Qt.openUrlExternally("https://www.transifex.com/#")
              }*/

        }

        VerticalScrollDecorator { }
    }
}
