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
		Power {
			id: realPower
			anchors.top: parent.top
			anchors.topMargin: 15
		}
		Workspace {
			Layout.alignment: Qt.AlignHCenter
			anchors.top: realPower.bottom
			anchors.topMargin: 5
		}
		UPower {
			Layout.alignment: Qt.AlignHCenter
			anchors.bottom: volume.top
			anchors.bottomMargin: 5
		}
		Volume {
			id: volume
			Layout.alignment: Qt.AlignHCenter
			anchors.bottom: clock.top
		}

		Clock {
			id: clock
			Layout.alignment: Qt.AlignHCenter
			Layout.preferredWidth: parent.width
			anchors.bottom: parent.bottom
			anchors.bottomMargin: 5
		}
	}
}