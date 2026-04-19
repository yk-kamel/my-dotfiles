import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../Colors.js" as T
import Quickshell.Services.UPower

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
				height: 0
			}
			Repeater {
				model: [ PowerProfile.PowerSaver, PowerProfile.Balanced, PowerProfile.Performance ]
				Rectangle {
					property int profile: modelData
					height: 30
					width: 30
					radius: 5
					Layout.alignment: Qt.AlignHCenter
					color: "transparent"
					Rectangle {
						anchors.fill: parent
						color: (modelData === PowerProfile.PowerSaver ) ? "green"
						: (modelData === PowerProfile.Balanced ) ? "#069494"
						: "red"
						opacity: 0.4
						radius: 5

					}

					border.color: insideText.color
					border.width: ( PowerProfiles.profile == modelData ) ? 3 : 0

					Text {
						id: insideText
						text: "󱐋"
						color: (modelData === PowerProfile.PowerSaver ) ? "green"
						: (modelData === PowerProfile.Balanced ) ? "#069494"
						: "red"
						anchors.centerIn: parent
						opacity: 100

					}

					visible: (rectangleHoverHandler.hovered || ( PowerProfiles.profile == modelData )) ? true : false
					opacity: (rectangleHoverHandler.hovered || ( PowerProfiles.profile == modelData )) ? 1 : 0
					Behavior on opacity {
						NumberAnimation {
							duration: 300
						}
					}
					MouseArea {
						cursorShape: Qt.PointingHandCursor
						anchors.fill: parent
						onClicked: { PowerProfiles.profile = parent.profile }
					}
				}
			}
			Item {
				height: 0
			}
		}
	}
}