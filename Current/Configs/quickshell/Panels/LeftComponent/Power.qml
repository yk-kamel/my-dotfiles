import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "../../Colors.js" as T


Rectangle {
	anchors.horizontalCenter: parent.horizontalCenter
	color: T.c.Accent2
	height: mainLayout.implicitHeight
	width: 40
	radius: 10
	HoverHandler {
		id: rectangleHoverHandler
	}
	Behavior on height {
		NumberAnimation {
			duration: 100
		}
	}
	ColumnLayout {
		id: mainLayout
		anchors.fill: parent
		anchors.bottom: parent.bottom
		Item { id: topItem}

		Rectangle {
			anchors.top: parent.top
			anchors.bottomMargin: 5
			anchors.topMargin: 5
			height: 30
			width: 30
			radius: 5
			Layout.alignment: Qt.AlignHCenter
			color: "transparent"
			Rectangle {
				anchors.fill: parent
				color: "red"
				opacity: 0.3
				radius: 5

			}

			border.color: "red"
			border.width: 3

			Text {
				text: "󰐥"
				color: "red"
				anchors.centerIn: parent
				opacity: 100

			}

			//visible: (rectangleHoverHandler.hovered || ( PowerProfiles.profile == modelData )) ? true : false
			//opacity: (rectangleHoverHandler.hovered || ( PowerProfiles.profile == modelData )) ? 1 : 0
			Behavior on opacity {
				NumberAnimation {
					duration: 300
				}
			}
			MouseArea {
				cursorShape: Qt.PointingHandCursor
				anchors.fill: parent
				Process {
					id: shutDownProcess
					command: ["shutdown", "now"]
				}
				onClicked: { shutDownProcess.start() }
			}
		}
		Rectangle {
			anchors.bottomMargin: 5
			anchors.topMargin: 5
			height: 30
			width: 30
			radius: 5
			Layout.alignment: Qt.AlignHCenter
			color: "transparent"
			Rectangle {
				anchors.fill: parent
				color: "yellow"
				opacity: 0.3
				radius: 5

			}

			border.color: "yellow"
			border.width: 3

			Text {
				text: "󰌾"
				color: "yellow"
				anchors.centerIn: parent
				opacity: 100

			}

			visible: rectangleHoverHandler.hovered ? true : false
			opacity: rectangleHoverHandler.hovered ? 1 : 0
			Behavior on opacity {
				NumberAnimation {
					duration: 300
				}
			}
			MouseArea {
				cursorShape: Qt.PointingHandCursor
				anchors.fill: parent
				Process {
					id: lockProcess
					command: ["notify-send", "Hello!", "You clicked the button."]
				}
				onClicked: { lockProcess.start() }
			}
		}
		Rectangle {
			anchors.bottomMargin: 5
			anchors.topMargin: 5
			height: 30
			width: 30
			radius: 5
			Layout.alignment: Qt.AlignHCenter
			color: "transparent"
			Rectangle {
				anchors.fill: parent
				color: "green"
				opacity: 0.3
				radius: 5

			}

			border.color: "green"
			border.width: 3

			Text {
				text: "󰑐"
				color: "green"
				anchors.centerIn: parent
				opacity: 100

			}

			visible: rectangleHoverHandler.hovered ? true : false
			opacity: rectangleHoverHandler.hovered ? 1 : 0
			Behavior on opacity {
				NumberAnimation {
					duration: 300
				}
			}
			MouseArea {
				cursorShape: Qt.PointingHandCursor
				anchors.fill: parent
				onClicked: { reboot }
			}
		}
		Item {}
	}
}
