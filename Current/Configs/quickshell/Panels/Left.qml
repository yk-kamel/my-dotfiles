import Quickshell
import QtQuick
import QtQuick.Layouts
import "../Colors.js" as T
import "LeftComponent"


PanelWindow {
	color: T.c.Background
	width : 60
	anchors.top:	true
	anchors.left:	true
	anchors.bottom: 	true

	ColumnLayout {
		anchors.fill: parent

		Item {
			height: 5
			width: 0
			anchors.right: 	parent
		}
		Workspace {
			Layout.alignment: Qt.AlignHCenter
		}
		Item {
			Layout.fillHeight: true
		}

		Clock {
			Layout.alignment: Qt.AlignHCenter
			Layout.preferredWidth: parent.width
			Layout.leftMargin: 3
			Layout.rightMargin: 3
		}

		Item {
			height: 5
			width: 0
			anchors.right: 	parent
		}
	}
}