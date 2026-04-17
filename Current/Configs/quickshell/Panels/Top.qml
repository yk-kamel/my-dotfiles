import Quickshell
import QtQuick
import QtQuick.Layouts
import "../Colors.js" as T
import "./TopComponent"

PanelWindow {
	color: T.c.Background
	height : 10
	anchors.top:	true
	anchors.left:	true
	anchors.right: 	true

	RowLayout {
		anchors.fill: parent
		Item {
			Layout.fillWidth: true
			Layout.fillHeight: true
		}
		Island {}
		Item {
			Layout.fillWidth: true
			Layout.fillHeight: true
		}
	}
}