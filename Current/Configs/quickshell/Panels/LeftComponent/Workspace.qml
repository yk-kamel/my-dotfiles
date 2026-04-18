import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../Colors.js" as T
import Quickshell.Hyprland

Rectangle {
	color: T.c.Accent2
	height: 210
	width: 40
	radius: 10
	ColumnLayout {
		anchors.fill: parent
		Item {
			height: 3
			width: 0
			anchors.right: 	parent
		}
		Repeater {
			model: 6
			Rectangle {
				Layout.alignment: Qt.AlignHCenter
				width: 13
				height: 13
				color: (index + 1) === Hyprland.focusedWorkspace.id ? T.c.Accent1 : T.c.Text2
				radius: 10

				Rectangle {
					height: 5
					width: height
					radius: width
					color: T.c.Accent2
					anchors.centerIn: parent
					visible: Hyprland.workspaces.values.some(ws => ws.id === (index + 1)) ? false : true
				}


				MouseArea {
					anchors.fill : parent
					anchors.margins: -2
					cursorShape : Qt.PointingHandCursor
					onClicked: {
						Hyprland.dispatch(`workspace ${index + 1}`)
					}

				}
			}
		}
		Item {
			height: 3
			width: 0
			anchors.right: 	parent
		}
	}
}