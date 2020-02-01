/*
 * Copyright (C) 2020  Gabriel Polastrini
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * Auteur is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Controls.Suru 2.2
import QtQuick.Layouts 1.3
import Ubuntu.Content 0.1
import Ubuntu.Components.Themes.Ambiance 1.3
import Qt.labs.settings 1.0
import "./components"

Page {
    id: aboutPage

    header: PageHeader {
        title: i18n.tr("About")
        flickable: scrollView.flickableItem
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent

        Column {
            width: scrollView.width
            spacing: units.gu(2)

            Item {
                width: 1; height: units.gu(4)
            }

            Icon {
                anchors.horizontalCenter: parent.horizontalCenter
                width: units.gu(16); height: width
                source: Qt.resolvedUrl("../assets/logo.svg")
            }

            Column {
                width: parent.width

                Label {
                    fontSize: "x-large"
                    font.weight: Font.DemiBold
                    text: "Auteur"

                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    text: i18n.tr("Version %1").arg(APP_VERSION)
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Column {
                width: parent.width

                Label {
                    text: "© 2020 Gabriel Polastrini"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    fontSize: "small"
                    text: i18n.tr("Released under the terms of the GNU GPL v3")
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Column {
                width: parent.width
                spacing: units.gu(2)

                Label {
                    fontSize: "small"
                    text: i18n.tr("Source code %1").arg("<a href=\"https://github.com/gbrlplstrn/Auteur\">Github</a>")

                    anchors.horizontalCenter: parent.horizontalCenter
                    onLinkActivated: Qt.openUrlExternally(link)
                    linkColor: UbuntuColors.blue
                }
            } 
        }
    }
}

