import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import Quickshell.Services.Mpris
import Qt5Compat.GraphicalEffects
import "../../Colors.js" as T

Rectangle {
	width : 500
	Layout.fillHeight: true
	Layout.alignment: Qt.AlignHCenter
	color: "Transparent"
	HoverHandler {
	        id: topHover
	}

	PanelWindow {
		visible: true
		color: "transparent"
		height : (topHover.hovered || panelHover.hovered) ? 80 : 0
		implicitWidth : 200
		anchors.top:	true
		anchors.left:	false
		anchors.right: 	false
		WlrLayershell.layer: WlrLayer.Overlay
		exclusionMode: ExclusionMode.Ignore
		HoverHandler {
            		id: panelHover
        	}
        	Behavior on height {
            		NumberAnimation {
                		duration: 50
                		easing.type: Easing.OutQuad
            		}
        	}
		Rectangle {
			color: T.c.Background
			width: 150
			height: 50
			radius: height
			anchors.centerIn: parent
				RowLayout {
					anchors.fill: parent
					spacing: 15
					Item {
						width: 5
					}
					Text {
						text: ""
						color: T.c.Accent2
						font.pointSize: 15
						MouseArea {
							anchors.fill : parent
							anchors.margins: -3
							cursorShape: Qt.PointingHandCursor
							hoverEnabled: true
							onClicked: { Mpris.players.values[0].previous () }
						}
					}
					Rectangle {
						height: 35
						width: height
						radius: height
						anchors.centerIn: parent
						Image {
							id: albumArt
							source: Mpris.players.values[0].trackArtUrl
							height: parent.width
							width: height
							fillMode: Image.PreserveAspectCrop
							layer.enabled: true
							layer.effect: OpacityMask {
								maskSource: Rectangle {
									width: albumArt.width
									height: albumArt.width
									radius: width / 2
								}
							}

						}
						NumberAnimation on rotation {
							from: 0
							to: 360
							duration: 3000
							loops: Animation.Infinite
							paused: !Mpris.players.values[0].isPlaying
						}
						MouseArea {
							anchors.fill : parent
							cursorShape: Qt.PointingHandCursor
							hoverEnabled: true
							onClicked: {
								Mpris.players.values[0].togglePlaying ()
							}
						}
					}
					Text {
						text: ""
						color: T.c.Accent2
						font.pointSize: 15
						font.family: "Terminess Nerd Font"
						MouseArea {
							anchors.fill : parent
							anchors.margins: -3
							cursorShape: Qt.PointingHandCursor
							hoverEnabled: true
							onClicked: {
								Mpris.players.values[0].next ()
							}
						}
					}
					Item {
						width: 5
					}
			}


		}
	}
}
