import QtQuick
import QtQuick.Layouts
import "../../../Colors.js" as T
import Quickshell.Services.Pipewire
import QtQuick.Controls


ColumnLayout {

	height: content.height
	width: content.width
	anchors.horizontalCenter: parent.horizontalCenter

	PwNodeLinkTracker {
		id: audioAppOutputTracker
		node: Pipewire.defaultAudioSink
	}

	Repeater {
		model: audioAppOutputTracker.linkGroups
        	Rectangle {
        		readonly property int currentVolume:  Math.round(modelData.source.audio.volume *100)
        		color: "transparent"
        		height: 30
        		width: 30
        		anchors.horizontalCenter: parent.horizontalCenter
        		PwObjectTracker {
				objects: [ modelData.source ]
			}
			Text {
				text: modelData.source.audio.muted ? ""
				: (currentVolume >= 50)  ? ""
				: (currentVolume >= 25)  ? ""
				: ""
				anchors.verticalCenter: parent.verticalCenter
				anchors.left: parent.left
				anchors.leftMargin: 7
				color: T.c.Accent1
				font.family: "Terminess Nerd Font"
			}
        		MouseArea {
        			anchors.fill: parent
				hoverEnabled: true
				cursorShape: Qt.PointingHandCursor
				onClicked: {
                			modelData.source.audio.muted = !modelData.source.audio.muted
                        	}


				ToolTip {
					visible: parent.containsMouse
					text: modelData.source.properties["media.name"] + ":	" + currentVolume
					delay: 500
					font.family: "Terminess Nerd Font"
				}
				onWheel: (wheel)=> {
        				modelData.source.audio.volume = modelData.source.audio.volume + ( 0.05 * wheel.angleDelta.y/120)
    				}

        		}


        	}

	}
}