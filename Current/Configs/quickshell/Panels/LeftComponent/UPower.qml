import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../Colors.js" as T
import Quickshell.Services.UPower


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

			Item {
				height: 0
			}

			Repeater {
				model: [ PowerProfile.PowerSaver, PowerProfile.Balanced, PowerProfile.Performance ]

				Rectangle {
					property int profile: modelData
					readonly property color profileColor: (modelData === PowerProfile.PowerSaver ) ? "green" : (modelData === PowerProfile.Balanced ) ? "#069494" : "red"
					height: 30
					width: 30
					radius: 10
					Layout.alignment: Qt.AlignHCenter
					color: "transparent"
					anchors.bottom: (modelData === PowerProfile.Performance) ? parent.bottom : undefined
			    		anchors.bottomMargin: (modelData === PowerProfile.Performance) ? 5 : 0
					Rectangle {
						anchors.fill: parent
						color: profileColor
						opacity: 0.3
						radius: 10

					}

					border.color: profileColor
					border.width: ( PowerProfiles.profile == modelData ) ? 3 : 0

					Text {
						text: "󱐋"
						color: profileColor
						anchors.centerIn: parent
						opacity: 100

					}

					visible: (rectangleHoverHandler.hovered || ( PowerProfiles.profile == modelData )) ? true : false
					opacity: (rectangleHoverHandler.hovered || ( PowerProfiles.profile == modelData )) ? 1 : 0
					Behavior on opacity {
						NumberAnimation {
							duration: 100
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
				id: bottomItem
				height: 0
			}
		}
	}
