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

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'auteur.gabrielpolastrini'
    automaticOrientation: true

    property bool narrowMode

    width: units.gu(45)
    height: units.gu(55)

      Page {

        id: home

        header: TextField {
          id: header
          placeholderText: qsTr("Enter Title")
          font.bold: true
          font.pixelSize: 90   

          anchors {
            top: parent.top
            topMargin: units.gu(2)
            left: parent.left
            right: parent.right
          }
          style: TextFieldStyle {
            background: null 
          }
        }

        anchors.fill: parent 

        TextArea {
          id: noteTextArea
          anchors {
            top: header.bottom
            topMargin: units.gu(2)
            bottom: parent.bottom
            left: parent.left
            right: parent.right
          }      
          objectName: "noteTextArea"
          autoSize: true
          font.pixelSize: 70
          maximumLineCount: 0
          focus: !root.newnote
          style: TextAreaStyle {
            background: null 
          }
          wrapMode: TextEdit.Wrap 
          text: root.note ? root.note.richTextContent : ""
          onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
 
        }
      RadialBottomEdge {
            id: nav
            visible: true
            actions: [
                RadialAction {
                    id: about
                    iconName: "info"
                    onTriggered: {
                      Qt.openUrlExternally("https://gbrlplstrn.now.sh/auteur.html")
                    }
                    text: qsTr("About")
                }, 

                RadialAction {
                    id: save
                    iconName: "save"
                    onTriggered: {
                       // webview.reload()
                    }
                    text: qsTr("Save")
                }                
            ]
        } 
    }
}
   
