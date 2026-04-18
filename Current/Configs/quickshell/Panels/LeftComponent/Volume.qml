import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../Colors.js" as T
import Quickshell.Services.Pipewire
import QtQuick.Controls
import "VolumeComponent"

Item {

	Rectangle {
		anchors.horizontalCenter: parent.horizontalCenter
		color: T.c.Accent2
		height: mainLayout.implicitHeight
		width: 40
		radius: 10
		anchors.bottom: parent.bottom
		anchors.bottomMargin: 5
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

			Item {
				height: 5
			}



			SecondaryVolumeRepater {
				opacity: rectangleHoverHandler.hovered ? 1 : 0
				Behavior on opacity {
					NumberAnimation {
						duration: 200
					}
				}
				visible: rectangleHoverHandler.hovered ? 1 : 0
				anchors.bottom: mainSeparator.top
				anchors.bottomMargin: 10
			}

			Rectangle {
				id: mainSeparator
				width: parent.width * .8
				height: 1.5
				visible: rectangleHoverHandler.hovered ? true : false
				radius: 2
				color: T.c.Accent1
				anchors.bottom: mainVolumeButtonOut.top
				anchors.bottomMargin: 3
				anchors.horizontalCenter: parent.horizontalCenter
			}
			MainVolume {
				id: mainVolumeButtonOut
			}
		}
	}
}